import 'dart:math';
import 'dart:typed_data';

import 'package:image/image.dart';

class BlurHash {
  /// The actual BlurHash string.
  final String hash;

  /// The decoded components of the BlurHash.
  /// This is mostly useful for e.g. transposing a BlurHash.
  final List<List<ColorTriplet>> components;

  /// The number of horizontal BlurHash components.
  final int numCompX;

  /// The number of vertical BlurHash components.
  final int numCompY;

  /// Private constructor used in the actual factory constructors.
  /// See [BlurHash.decode] and [BlurHash.encode].
  BlurHash._(
    this.hash,
    this.components,
  )   : assert(components.isNotEmpty),
        assert(components[0].isNotEmpty),
        numCompY = components.length,
        numCompX = components[0].length;

  /// Construct a [BlurHash] object from decoded components.
  /// This is useful for e.g. transposing a BlurHash.
  BlurHash.components(this.components)
      : assert(components.isNotEmpty),
        assert(components[0].isNotEmpty),
        hash = _encodeComponents(components),
        numCompX = components[0].length,
        numCompY = components.length;

  /// Decode a BlurHash String to a BlurHash object.
  ///
  /// The [punch] parameter adjusts the contrast on the decoded image. Values
  /// less than 1 will make the effect more subtle, larger values will make the
  /// effect stronger. This is a design parameter to adjust the look.
  ///
  /// Throws [BlurHashDecodeException] when an invalid BlurHash is encountered.
  factory BlurHash.decode(String blurHash, {double punch = 1.0}) {
    if (blurHash.length < 6) {
      throw BlurHashDecodeException(
        "BlurHash must not be null or '< 6' characters long.",
      );
    }
    final sizeFlag = decode83(blurHash, 0, 1);
    final numCompX = (sizeFlag % 9) + 1;
    final numCompY = (sizeFlag ~/ 9) + 1;

    if (blurHash.length != 4 + 2 * numCompX * numCompY) {
      throw BlurHashDecodeException(
        'Invalid number of components in BlurHash.',
      );
    }

    final maxAcEnc = decode83(blurHash, 1, 2);
    final maxAc = (maxAcEnc + 1) / 166.0;
    final components = List.generate(
      numCompY,
      (i) => List<ColorTriplet>.filled(numCompX, ColorTriplet(0, 0, 0)),
    );

    for (var j = 0; j < numCompY; j++) {
      for (var i = 0; i < numCompX; i++) {
        if (i == 0 && j == 0) {
          final value = decodeDc(decode83(blurHash, 2, 6));
          components[j][i] = value;
        } else {
          final index = i + j * numCompX;
          final value = decodeAc(
            decode83(blurHash, 4 + index * 2, (4 + index * 2) + 2),
            maxAc,
          );
          components[j][i] = value;
        }
      }
    }

    return BlurHash._(blurHash, _multiplyPunch(components, punch));
  }

  /// Encodes an image to a BlurHash string.
  ///
  /// The parameters [numCompX] and [numCompY] are the number of components of
  /// the BlurHash. Both parameters must be between 1 and 9. Throws a
  /// [BlurHashEncodeException] when [numCompX] and [numCompY] are not in
  /// the expected range.
  factory BlurHash.encode(
    Image image, {
    int numCompX = 4,
    int numCompY = 3,
  }) {
    if (numCompX < 1 || numCompX > 9 || numCompY < 1 || numCompY > 9) {
      throw BlurHashEncodeException(
        'BlurHash components must be between 1 and 9.',
      );
    }

    final img = image.convert(format: Format.uint8);
    final components = List.generate(
      numCompY,
      (i) => List<ColorTriplet>.filled(numCompX, ColorTriplet(0, 0, 0)),
    );

    for (var y = 0; y < numCompY; ++y) {
      for (var x = 0; x < numCompX; ++x) {
        final normalisation = (x == 0 && y == 0) ? 1.0 : 2.0;
        components[y][x] = _multiplyBasisFunction(img, x, y, normalisation);
      }
    }

    return BlurHash._(_encodeComponents(components), components);
  }

  /// Construct a [BlurHash] with a single color.
  ///
  /// The RGB values must be in range [0, 255].
  factory BlurHash.fromRgb(int red, int green, int blue) {
    assert(red >= 0 && red <= 255);
    assert(green >= 0 && green <= 255);
    assert(blue >= 0 && blue <= 255);

    final color = ColorTriplet(
      sRgbToLinear(red),
      sRgbToLinear(green),
      sRgbToLinear(blue),
    );

    return BlurHash.components([
      [color]
    ]);
  }

  /// Returns the actual [BlurHash] image with the given [width] and [height].
  ///
  /// The [width] and [height] must not be null and greater than 0. It is
  /// recommended to keep the [width] and [height] small and let the UI layer
  /// handle upscaling for better performance.
  Image toImage(int width, int height) {
    assert(width > 0);
    assert(height > 0);
    final data = _transform(width, height, components);
    return Image.fromBytes(
      width: width,
      height: height,
      bytes: data.buffer,
      numChannels: 4,
    );
  }
}

/// Deprecated. Please use [BlurHash.decode] and [BlurHash.toImage] instead.
/// Decode a BlurHash to raw pixels in RGBA32 format
@Deprecated('Use [BlurHash.decode] instead.')
Uint8List decodeBlurHash(
  String blurHash,
  int width,
  int height, {
  double punch = 1.0,
}) {
  final hash = BlurHash.decode(blurHash, punch: punch);
  return hash.toImage(width, height).getBytes();
}

/// Deprecated. Please use [BlurHash.encode] instead.
/// Encodes an image to a BlurHash string
@Deprecated('Use [BlurHash.encode] instead.')
String encodeBlurHash(
  Uint8List data,
  int width,
  int height, {
  int numCompX = 4,
  int numpCompY = 3,
}) {
  final image = Image.fromBytes(
    width: width,
    height: height,
    bytes: data.buffer,
  );
  final hash = BlurHash.encode(image, numCompX: numCompX, numCompY: numpCompY);
  return hash.hash;
}

String _encodeComponents(List<List<ColorTriplet>> components) {
  final numCompX = components[0].length;
  final numCompY = components.length;

  final factors = List<ColorTriplet>.filled(
    numCompX * numCompY,
    ColorTriplet(0, 0, 0),
  );

  var count = 0;
  for (var i = 0; i < numCompY; i++) {
    for (var j = 0; j < numCompX; j++) {
      factors[count++] = components[i][j];
    }
  }

  return _encodeFactors(factors, numCompX, numCompY);
}

String _encodeFactors(
  List<ColorTriplet> factors,
  int numCompX,
  int numCompY,
) {
  final dc = factors.first;
  final ac = factors.skip(1).toList();

  final blurHash = StringBuffer();
  final sizeFlag = (numCompX - 1) + (numCompY - 1) * 9;
  blurHash.write(encode83(sizeFlag, 1));

  var maxVal = 1.0;
  if (ac.isNotEmpty) {
    final actualMax = ac.map(_maxChannelAbs).reduce(max);
    final quantisedMax = max(0, min(82, (actualMax * 166.0 - 0.5).floor()));
    maxVal = (quantisedMax + 1.0) / 166.0;
    blurHash.write(encode83(quantisedMax, 1));
  } else {
    blurHash.write(encode83(0, 1));
  }

  blurHash.write(encode83(encodeDc(dc), 4));
  for (final factor in ac) {
    blurHash.write(encode83(encodeAc(factor, maxVal), 2));
  }
  return blurHash.toString();
}

double _maxChannelAbs(ColorTriplet c) {
  return max(c.r.abs(), max(c.g.abs(), c.b.abs()));
}

List<List<ColorTriplet>> _multiplyPunch(
  List<List<ColorTriplet>> components,
  double factor,
) {
  for (var i = 0; i < components.length; i++) {
    for (var j = 0; j < components[i].length; j++) {
      if (i != 0 && j != 0) {
        components[i][j] = components[i][j] * factor;
      }
    }
  }
  return components;
}

Uint8List _transform(
  int width,
  int height,
  List<List<ColorTriplet>> components,
) {
  final pixels = List<int>.filled(width * height * 4, 0);

  var pixel = 0;
  for (var y = 0; y < height; ++y) {
    for (var x = 0; x < width; ++x) {
      var r = 0.0;
      var g = 0.0;
      var b = 0.0;

      for (var j = 0; j < components.length; ++j) {
        for (var i = 0; i < components[0].length; ++i) {
          final basis = cos(pi * x * i / width) * cos(pi * y * j / height);
          final color = components[j][i];
          r += color.r * basis;
          g += color.g * basis;
          b += color.b * basis;
        }
      }

      pixels[pixel++] = linearTosRgb(r);
      pixels[pixel++] = linearTosRgb(g);
      pixels[pixel++] = linearTosRgb(b);
      pixels[pixel++] = 255;
    }
  }

  return Uint8List.fromList(pixels);
}

ColorTriplet _multiplyBasisFunction(
  Image image,
  int x,
  int y,
  double normalisation,
) {
  var r = 0.0;
  var g = 0.0;
  var b = 0.0;

  if (image.numChannels >= 3) {
    for (final pixel in image) {
      final basis = normalisation * cos((pi * x * pixel.x) / image.width) * cos((pi * y * pixel.y) / image.height);

      r += basis * sRgbToLinear(pixel.r as int);
      g += basis * sRgbToLinear(pixel.g as int);
      b += basis * sRgbToLinear(pixel.b as int);
    }
  } else {
    for (final pixel in image) {
      final basis = normalisation * cos((pi * x * pixel.x) / image.width) * cos((pi * y * pixel.y) / image.height);

      final value = sRgbToLinear(pixel.r as int);

      r += basis * value;
      g += basis * value;
      b += basis * value;
    }
  }

  final scale = 1.0 / (image.width * image.height);
  return ColorTriplet(r * scale, g * scale, b * scale);
}

int decode83(String text, int from, int to) {
  assert(from >= 0 && to <= text.length);

  var result = 0;
  for (var i = from; i < to; ++i) {
    final index = _encoding[text[i]];
    if (index == null) {
      throw BlurHashDecodeException(
        'Invalid BlurHash encoding: invalid character $index',
      );
    }
    result = result * 83 + index;
  }
  return result;
}

String encode83(int value, int length) {
  assert(value >= 0 && length >= 0);

  final buffer = StringBuffer();
  final chars = _encoding.keys.toList().asMap();
  for (var i = 1; i <= length; ++i) {
    final digit = (value / pow(83, length - i)) % 83;
    buffer.write(chars[digit.toInt()]);
  }
  return buffer.toString();
}

const _encoding = <String, int>{
  '0': 0,
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  'A': 10,
  'B': 11,
  'C': 12,
  'D': 13,
  'E': 14,
  'F': 15,
  'G': 16,
  'H': 17,
  'I': 18,
  'J': 19,
  'K': 20,
  'L': 21,
  'M': 22,
  'N': 23,
  'O': 24,
  'P': 25,
  'Q': 26,
  'R': 27,
  'S': 28,
  'T': 29,
  'U': 30,
  'V': 31,
  'W': 32,
  'X': 33,
  'Y': 34,
  'Z': 35,
  'a': 36,
  'b': 37,
  'c': 38,
  'd': 39,
  'e': 40,
  'f': 41,
  'g': 42,
  'h': 43,
  'i': 44,
  'j': 45,
  'k': 46,
  'l': 47,
  'm': 48,
  'n': 49,
  'o': 50,
  'p': 51,
  'q': 52,
  'r': 53,
  's': 54,
  't': 55,
  'u': 56,
  'v': 57,
  'w': 58,
  'x': 59,
  'y': 60,
  'z': 61,
  '#': 62,
  r'$': 63,
  '%': 64,
  '*': 65,
  '+': 66,
  ',': 67,
  '-': 68,
  '.': 69,
  ':': 70,
  ';': 71,
  '=': 72,
  '?': 73,
  '@': 74,
  '[': 75,
  ']': 76,
  '^': 77,
  '_': 78,
  '{': 79,
  '|': 80,
  '}': 81,
  '~': 82
};

class BlurHashDecodeException implements Exception {
  BlurHashDecodeException([
    String? message,
  ]) : message = message ?? '';

  final String message;

  @override
  String toString() => 'Exception: $message';
}

class BlurHashEncodeException implements Exception {
  BlurHashEncodeException([
    String? message,
  ]) : message = message ?? '';

  final String message;

  @override
  String toString() => 'Exception: $message';
}

extension BlurHashExtensions on BlurHash {
  /// Transposes the [BlurHash].
  BlurHash get transposed {
    final numCompX = components[0].length;
    final numCompY = components.length;
    final transposedComponents = List.generate(
      numCompX,
      (i) => List<ColorTriplet>.filled(numCompY, ColorTriplet(0, 0, 0)),
    );
    for (var j = 0; j < numCompY; j++) {
      for (var i = 0; i < numCompX; i++) {
        transposedComponents[i][j] = components[j][i];
      }
    }
    return BlurHash.components(transposedComponents);
  }

  /// Mirrors the [BlurHash] horizontally.
  BlurHash get mirroredHorizontally {
    final numCompX = components[0].length;
    final numCompY = components.length;
    final mirroredComponents = List.generate(
      numCompY,
      (i) => List<ColorTriplet>.filled(numCompX, ColorTriplet(0, 0, 0)),
    );
    for (var j = 0; j < numCompY; j++) {
      for (var i = 0; i < numCompX; i++) {
        mirroredComponents[j][i] = components[j][i] * (i % 2 == 0 ? 1 : -1);
      }
    }
    return BlurHash.components(mirroredComponents);
  }

  /// Mirrors the [BlurHash] vertically.
  BlurHash get mirroredVertically {
    final numCompX = components[0].length;
    final numCompY = components.length;
    final mirroredComponents = List.generate(
      numCompY,
      (i) => List<ColorTriplet>.filled(numCompX, ColorTriplet(0, 0, 0)),
    );
    for (var j = 0; j < numCompY; j++) {
      for (var i = 0; i < numCompX; i++) {
        mirroredComponents[j][i] = components[j][i] * (j % 2 == 0 ? 1 : -1);
      }
    }
    return BlurHash.components(mirroredComponents);
  }

  /// Returns whether the average brightness is considered dark.
  /// See [BlurHashExtensions.isAverageDark] to set a custom threshold.
  bool get isDark => isAverageDark();

  /// Returns whether the left edge is considered dark.
  /// See [BlurHashExtensions.isDarkAtX] to set a custom threshold.
  bool get isLeftEdgeDark => isDarkAtX(0.0);

  /// Returns whether the right edge is considered dark.
  /// See [BlurHashExtensions.isDarkAtX] to set a custom threshold.
  bool get isRightEdgeDark => isDarkAtX(1.0);

  /// Returns whether the top edge is considered dark.
  /// See [BlurHashExtensions.isDarkAtY] to set a custom threshold.
  bool get isTopEdgeDark => isDarkAtY(0.0);

  /// Returns whether the bottom edge is considered dark.
  /// See [BlurHashExtensions.isDarkAtY] to set a custom threshold.
  bool get isBottomEdgeDark => isDarkAtY(1.0);

  /// Returns whether the top-left corner is considered dark.
  /// See [BlurHashExtensions.isDarkAtPos] to set a custom threshold.
  bool get isTopLeftCornerDark => isDarkAtPos(0.0, 0.0);

  /// Returns whether the top-right corner is considered dark.
  /// See [BlurHashExtensions.isDarkAtPos] to set a custom threshold.
  bool get isTopRightCornerDark => isDarkAtPos(1.0, 0.0);

  /// Returns whether the bottom-left corner is considered dark.
  /// See [BlurHashExtensions.isDarkAtPos] to set a custom threshold.
  bool get isBottomLeftCornerDark => isDarkAtPos(0.0, 1.0);

  /// Returns whether the bottom-right corner is considered dark.
  /// See [BlurHashExtensions.isDarkAtPos] to set a custom threshold.
  bool get isBottomRightCornerDark => isDarkAtPos(1.0, 1.0);

  /// Returns whether the given color is considered dark.
  /// The color must be given as a linear RGB color.
  bool isColorDark(ColorTriplet color, {double threshold = 0.3}) => _getDarkness(color, threshold);

  /// Returns whether the average brightness is considered dark.
  bool isAverageDark({double? threshold}) => _getDarkness(averageLinearRgb, threshold);

  /// Returns whether the given row is considered dark.
  ///
  /// {@template ext_valid_args}
  /// Coordinates are given in percent and must be between 0 and 1.
  /// Throws [ArgumentError] if the coordinates are out of range.
  /// {@endtemplate}
  bool isDarkAtX(double x, {double? threshold}) => _getDarkness(linearRgbAtX(x), threshold);

  /// Returns whether the given row is considered dark.
  ///
  /// {@macro ext_valid_args}
  bool isDarkAtY(double y, {double? threshold}) => _getDarkness(linearRgbAtY(y), threshold);

  /// Returns whether the given point is considered dark.
  ///
  /// {@macro ext_valid_args}
  bool isDarkAtPos(double x, double y, {double? threshold}) => _getDarkness(linearRgbAt(x, y), threshold);

  /// Returns whether the given rectangular region is considered dark.
  ///
  /// {@macro ext_valid_args}
  bool isRectDark(
    Point topLeftCorner,
    Point bottomRightCorner, {
    double? threshold,
  }) {
    return _getDarkness(
      linearRgbInRect(topLeftCorner, bottomRightCorner),
      threshold,
    );
  }

  /// Returns the average linear RGB.
  ///
  /// {@template linear_vs_srgb}
  /// [ColorTriplet] by default is in linear RGB color space. Convert to
  /// RGB before using the color. See [ColorTripletExtensions.toRgb].
  /// {@endtemplate}
  ColorTriplet get averageLinearRgb => components[0][0];

  /// Returns linear RGB for the given column.
  ///
  /// {@macro ext_valid_args}
  /// {@macro linear_vs_srgb}
  ColorTriplet linearRgbAtX(double x) {
    if (x < 0.0 || x > 1.0) {
      throw ArgumentError('Coordinates must be between [0, 1].');
    }

    var i = 0;
    var sum = ColorTriplet(0, 0, 0);
    for (final component in components[0]) {
      sum += component * cos(pi * i++ * x);
    }
    return sum;
  }

  /// Returns linear RGB for the given row.
  ///
  /// {@macro ext_valid_args}
  /// {@macro linear_vs_srgb}
  ColorTriplet linearRgbAtY(double y) {
    if (y < 0.0 || y > 1.0) {
      throw ArgumentError('Coordinates must be between [0, 1].');
    }

    var i = 0;
    var sum = ColorTriplet(0, 0, 0);
    for (final horizontalComponents in components) {
      sum += horizontalComponents[0] * cos(pi * i++ * y);
    }
    return sum;
  }

  /// Returns linear RGB for a point.
  ///
  /// {@macro ext_valid_args}
  /// {@macro linear_vs_srgb}
  ColorTriplet linearRgbAt(double x, double y) {
    if (x < 0.0 || x > 1.0 || y < 0.0 || y > 1.0) {
      throw ArgumentError('Coordinates must be between [0, 1].');
    }

    var sum = ColorTriplet(0, 0, 0);
    for (var j = 0; j < numCompY; j++) {
      for (var i = 0; i < numCompX; i++) {
        sum += components[j][i] * cos(pi * i * x) * cos(pi * j * y);
      }
    }
    return sum;
  }

  /// Returns linear RGB for a rectangular region.
  ///
  /// {@macro ext_valid_args}
  /// {@macro linear_vs_srgb}
  ColorTriplet linearRgbInRect(
    Point topLeftCorner,
    Point bottomRightCorner,
  ) {
    if (topLeftCorner.x < 0.0 || topLeftCorner.x > 1.0 || topLeftCorner.y < 0.0 || topLeftCorner.y > 1.0) {
      throw ArgumentError('Coordinates must be between [0, 1].');
    }

    if (bottomRightCorner.x < 0.0 ||
        bottomRightCorner.x > 1.0 ||
        bottomRightCorner.y < 0.0 ||
        bottomRightCorner.y > 1.0) {
      throw ArgumentError('Coordinates must be between [0, 1].');
    }

    if (topLeftCorner.x >= bottomRightCorner.x || topLeftCorner.y >= bottomRightCorner.y) {
      throw ArgumentError('The bottom-right corner must be right of '
          'and below to the top-left corner!');
    }

    var sum = ColorTriplet(0, 0, 0);
    for (var j = 0; j < numCompY; j++) {
      for (var i = 0; i < numCompX; i++) {
        final horizontalAverage = i == 0
            ? 1.0
            : ((sin(pi * i * bottomRightCorner.x) - sin(pi * i * topLeftCorner.x)) /
                (i * pi * (bottomRightCorner.x - topLeftCorner.x)));
        final verticalAverage = j == 0
            ? 1.0
            : ((sin(pi * j * bottomRightCorner.y) - sin(pi * j * topLeftCorner.y)) /
                (j * pi * (bottomRightCorner.y - topLeftCorner.y)));
        sum += components[j][i] * horizontalAverage * verticalAverage;
      }
    }
    return sum;
  }

  static const _defaultThreshold = 0.3;

  static bool _getDarkness(ColorTriplet color, double? threshold) {
    return color.r * 0.299 + color.g * 0.587 + color.b * 0.114 < (threshold ?? _defaultThreshold);
  }
}

extension ColorTripletExtensions on ColorTriplet {
  /// Returns new [ColorTriplet], converted from linear RGB to sRGB.
  /// After conversion the color components will be between [0, 255].
  ColorTriplet toRgb() {
    return ColorTriplet(
      linearTosRgb(r).toDouble(),
      linearTosRgb(g).toDouble(),
      linearTosRgb(b).toDouble(),
    );
  }
}

/// ColorTriplet by default is used to encode colors in linear space.
/// If you need the color in sRGB see [ColorTripletExtensions.toRgb].
class ColorTriplet {
  /// Construct a new [ColorTriplet].
  const ColorTriplet(this.r, this.g, this.b);

  /// The red component of the color triplet.
  final double r;

  /// The green component of the color triplet.
  final double g;

  /// The blue component of the color triplet.
  final double b;

  /// Adds two [ColorTriplet] objects.
  ColorTriplet operator +(ColorTriplet other) => ColorTriplet(r + other.r, g + other.g, b + other.b);

  /// Subtracts two [ColorTriplet] objects.
  ColorTriplet operator -(ColorTriplet other) => ColorTriplet(r - other.r, g - other.g, b - other.b);

  /// Multiplies two [ColorTriplet] objects.
  ColorTriplet operator *(double scalar) => ColorTriplet(r * scalar, g * scalar, b * scalar);

  /// Divides two [ColorTriplet] objects.
  ColorTriplet operator /(double scalar) => ColorTriplet(r / scalar, g / scalar, b / scalar);

  @override
  String toString() => 'ColorTriplet($r, $g, $b)';
}

ColorTriplet decodeDc(int value) {
  final r = value >> 16;
  final g = (value >> 8) & 255;
  final b = value & 255;

  return ColorTriplet(
    sRgbToLinear(r),
    sRgbToLinear(g),
    sRgbToLinear(b),
  );
}

ColorTriplet decodeAc(int value, double maxVal) {
  final r = value / (19.0 * 19.0);
  final g = (value / 19.0) % 19.0;
  final b = value % 19.0;

  return ColorTriplet(
    signPow((r - 9.0) / 9.0, 2.0) * maxVal,
    signPow((g - 9.0) / 9.0, 2.0) * maxVal,
    signPow((b - 9.0) / 9.0, 2.0) * maxVal,
  );
}

int encodeDc(ColorTriplet color) {
  final r = linearTosRgb(color.r);
  final g = linearTosRgb(color.g);
  final b = linearTosRgb(color.b);
  return (r << 16) + (g << 8) + b;
}

int encodeAc(ColorTriplet color, double maxVal) {
  final r = max(0, min(18, signPow(color.r / maxVal, 0.5) * 9 + 9.5)).floor();
  final g = max(0, min(18, signPow(color.g / maxVal, 0.5) * 9 + 9.5)).floor();
  final b = max(0, min(18, signPow(color.b / maxVal, 0.5) * 9 + 9.5)).floor();
  return r * 19 * 19 + g * 19 + b;
}

double sRgbToLinear(int value) {
  final v = value / 255.0;
  if (v <= 0.04045) return v / 12.92;
  return pow((v + 0.055) / 1.055, 2.4).toDouble();
}

int linearTosRgb(double value) {
  final v = value.clamp(0.0, 1.0);
  if (v <= 0.0031308) return (v * 12.92 * 255.0 + 0.5).toInt();
  return ((1.055 * pow(v, 1.0 / 2.4) - 0.055) * 255.0 + 0.5).toInt();
}

double signPow(double value, double exp) {
  return pow(value.abs(), exp) * value.sign;
}
