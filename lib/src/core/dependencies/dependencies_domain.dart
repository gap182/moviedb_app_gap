part of 'dependencies.dart';

final popularRepositoryProvider = Provider<PopularRepository>((ref) {
  final service = ref.watch(popularServiceProvider);
  return PopularRepositoryImpl(service: service);
});
