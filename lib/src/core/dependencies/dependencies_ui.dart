part of 'dependencies.dart';

final globalUiProvider =
    StateNotifierProvider<GlobalNotifier, GlobalState>((ref) {
  return GlobalNotifier();
});

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repo = ref.watch(popularRepositoryProvider);
  return HomeNotifier(repository: repo);
});

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  return FavoritesNotifier();
});
