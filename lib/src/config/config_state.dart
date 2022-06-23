import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
  });

  final String baseUrl;

  ConfigState copyWith({
    String? baseUrl,
  }) {
    return ConfigState(
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'base_url': baseUrl,
    };
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['base_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source) as Map<String, dynamic>);
}
