import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/core/presentation/states/global_state.dart';

class GlobalNotifier extends StateNotifier<GlobalState> {
  GlobalNotifier() : super(GlobalState(selectedIndex: 0));

  void onChangeIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
