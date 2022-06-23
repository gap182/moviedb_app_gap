import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/core/app_values/statuses.dart';
import 'package:imagineapp_test_gap/src/features/home/domain/repositories/popular_repository.dart';
import 'package:imagineapp_test_gap/src/features/home/presentation/states/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({required this.repository})
      : super(HomeState(homeStatus: HomeStatus.initial, popularMovies: []));

  final PopularRepository repository;

  void getPopulars() async {
    _loading();
    final response = await repository.getPopulars(1);

    if (response.response != null && response.error == null) {
      state = state.copyWith(popularMovies: response.response);
      _done();
    } else {
      _error();
    }
  }

  void updatePopulars() async {
    _loading();
    state = state.copyWith(indexPage: state.indexPage + 1);
    final response = await repository.getPopulars(state.indexPage);

    if (response.response != null && response.error == null) {
      final tempList = state.popularMovies;

      for (var element in response.response!) {
        tempList.add(element);
      }
      state = state.copyWith(popularMovies: tempList);
      _done();
    } else {
      _error();
    }
  }

  void _loading() {
    state = state.copyWith(homeStatus: HomeStatus.loading);
  }

  void _error() {
    state = state.copyWith(homeStatus: HomeStatus.error);
  }

  void _done() {
    state = state.copyWith(homeStatus: HomeStatus.done);
  }
}
