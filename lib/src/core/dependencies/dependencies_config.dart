part of 'dependencies.dart';

enum DioType { base, image }

final confgiProvider =
    StateNotifierProvider<ConfigNotifier, ConfigState>((ref) {
  return ConfigNotifier();
});

final dioProvider = Provider.family<Dio, DioType>((ref, dioType) {
  final config = ref.watch(confgiProvider);
  String url;

  switch (dioType) {
    case DioType.base:
      url = config.baseUrl;
      break;
    case DioType.image:
      url = config.imageBaseUrl;
      break;
    default:
      url = config.baseUrl;
  }

  final options = BaseOptions(
    baseUrl: url,
    connectTimeout: 20000,
    receiveTimeout: 20000,
  );

  return Dio(options);
});
