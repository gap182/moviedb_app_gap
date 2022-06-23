class ResponseModel<T, M> {
  ResponseModel({
    this.response,
    this.error,
  });
  final T? response;
  final M? error;
}
