class ResponseData {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;

  ResponseData({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
  });
}
