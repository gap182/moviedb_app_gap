import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
    required this.apiKey,
    required this.imageBaseUrl,
  });

  final String baseUrl;
  final String imageBaseUrl;
  final String apiKey;

  ConfigState copyWith({
    String? baseUrl,
    String? apiKey,
    String? imageBaseUrl,
  }) {
    return ConfigState(
      baseUrl: baseUrl ?? this.baseUrl,
      apiKey: apiKey ?? this.apiKey,
      imageBaseUrl: imageBaseUrl ?? this.imageBaseUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'base_url': baseUrl,
      'api_key': apiKey,
      'image_base_url': imageBaseUrl,
    };
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['base_url'] ?? '',
      apiKey: map['api_key'] ?? '',
      imageBaseUrl: map['image_base_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source) as Map<String, dynamic>);
}
