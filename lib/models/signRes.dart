import 'dart:convert';

class SignInRes {
  Map<String, dynamic>? data;
  String? message;
  int? code;
  SignInRes({this.data, this.message, this.code});

  SignInRes.fromString(String json) {
    SignInRes.fromJson(jsonDecode(json));
  }

  SignInRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? json['data'] : null;
    message = json['message'];
    code = json['code'];

  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data.toJson();
  //   }
  //   data['message'] = this.message;
  //   data['error'] = this.error;
  //   return data;
  // }
}