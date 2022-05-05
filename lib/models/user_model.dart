import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String? profilePic;
  final String? fullName;
  final String? role;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final Timestamp? createdAt;

  UserModel(
      {this.userId,
      this.fullName,
      this.email,
      this.role,
      this.phoneNumber,
      this.password,
      this.createdAt,
      this.profilePic});

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      userId: json['userId'],
      fullName: json['fullName'],
      email: json['email'],
      role: json['role'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      createdAt: json['createdAt'],
      profilePic: json['profilePic'],
    );
  }
}
