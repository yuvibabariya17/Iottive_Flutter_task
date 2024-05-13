// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  bool success;
  int userId;
  String firstName;
  String lastName;
  String primaryEmail;
  String profileImageUrl;
  String authToken;
  String mobileNumber;
  int rewardPoint;
  String aliasId;
  String saferPayToken;
  dynamic saferPayCardDetails;
  String birthDate;

  SignInModel({
    required this.success,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.primaryEmail,
    required this.profileImageUrl,
    required this.authToken,
    required this.mobileNumber,
    required this.rewardPoint,
    required this.aliasId,
    required this.saferPayToken,
    required this.saferPayCardDetails,
    required this.birthDate,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        success: json["success"] ?? false,
        userId: json["userId"] ?? 0,
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        primaryEmail: json["primaryEmail"] ?? "",
        profileImageUrl: json["profileImageURL"] ?? "",
        authToken: json["authToken"] ?? "",
        mobileNumber: json["mobileNumber"] ?? "",
        rewardPoint: json["rewardPoint"] ?? 0,
        aliasId: json["aliasId"] ?? "",
        saferPayToken: json["saferPayToken"] ?? "",
        saferPayCardDetails: json["saferPayCardDetails"],
        birthDate: json["birthDate"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "primaryEmail": primaryEmail,
        "profileImageURL": profileImageUrl,
        "authToken": authToken,
        "mobileNumber": mobileNumber,
        "rewardPoint": rewardPoint,
        "aliasId": aliasId,
        "saferPayToken": saferPayToken,
        "saferPayCardDetails": saferPayCardDetails,
        "birthDate": birthDate,
      };
}
