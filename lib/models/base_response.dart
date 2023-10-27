class BaseResponse {
  final int? code;
  final String? message;
  final dynamic data;

  BaseResponse({
    this.code,
    this.message,
    this.data,
  });

  BaseResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        data = json['data'];

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : data
  };
}