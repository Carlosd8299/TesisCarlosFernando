import 'dart:convert';

ResponseProfileImage responseProfileImageFromJson(String str) =>
    ResponseProfileImage.fromJson(json.decode(str));

String responseProfileImageToJson(ResponseProfileImage data) =>
    json.encode(data.toJson());

class ResponseProfileImage {
  ResponseProfileImage({
    this.data,
    this.name,
  });

  String data;
  String name;

  factory ResponseProfileImage.fromJson(Map<String, dynamic> json) =>
      ResponseProfileImage(
        data: json["data"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "name": name,
      };
}
