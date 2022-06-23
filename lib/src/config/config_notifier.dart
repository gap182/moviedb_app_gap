import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/config/config_state.dart';

class ConfigNotifier extends StateNotifier<ConfigState> {
  ConfigNotifier()
      : super(ConfigState(baseUrl: '', apiKey: '', imageBaseUrl: ''));

  void loadConfigData() async {
    final data = await rootBundle.loadString('assets/config/config.json');
    state = ConfigState.fromJson(data);
    state = state.copyWith(apiKey: const String.fromEnvironment('api_key'));
  }
}
