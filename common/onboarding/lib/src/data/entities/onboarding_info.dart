part of 'onboarding.dart';

class OnboardingInfo extends Equatable implements Onboarding {
  final String title;
  final String description;
  final String? buttonTitle;
  final String? assetPath;
  final int? globalPosition;

  const OnboardingInfo({
    required this.title,
    required this.description,
    this.assetPath,
    this.globalPosition,
    this.buttonTitle,
  });

  /// Creates a [OnboardingInfo] instance from a JSON [Map].
  factory OnboardingInfo.fromJson(Map<String, dynamic> json) {
    return OnboardingInfo(
      title: json['title'] as String,
      description: json['description'] as String,
      assetPath: json['asset_path'] as String?,
      buttonTitle: json['button_title'] as String?,
      globalPosition: json['global_position'] as int?,
    );
  }

  /// Converts a [OnboardingInfo] instance to JSON [Map].
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'asset_path': assetPath,
      'button_title': buttonTitle,
    };
  }

  @override
  List<Object> get props => [title, description, assetPath ?? '', buttonTitle ?? '', globalPosition ?? -1];

  @override
  int get position => globalPosition ?? -1;
}
