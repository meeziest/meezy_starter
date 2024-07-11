import 'dart:math';

extension RandomKeyGenerateExtension on Random {
  String generateCryptographicKey(int keyLength) {
    final keyBuffer = StringBuffer();
    for (int i = 0; i < keyLength; i++) {
      keyBuffer.write(nextInt(9).toString());
    }
    return keyBuffer.toString();
  }
}
