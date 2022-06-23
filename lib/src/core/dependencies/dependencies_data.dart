part of 'dependencies.dart';

final popularServiceProvider = Provider<PopularService>((ref) {
  final dio = ref.watch(dioProvider(DioType.base));
  return PopularService(dio: dio, ref: ref);
});
