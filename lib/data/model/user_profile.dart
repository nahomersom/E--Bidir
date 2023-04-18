import 'dart:io';

import 'package:equatable/equatable.dart';

class UserProfile{
  final dynamic profile;
  final dynamic _id;
  final dynamic name;
  final dynamic email;
  final dynamic phoneNo;
  final dynamic gender;

  final dynamic TIN_Number;
  final dynamic role;
  final dynamic scannedFiles;
  final dynamic status;
  final dynamic score;
  final dynamic createdAt;
  final dynamic __v;
  final dynamic rank;
  UserProfile(this.profile, this._id, this.name,
      this.email,
      this.phoneNo,
      this.TIN_Number,
      this.score
      ,this.role,
      this.rank,
      this.gender
     , this.status,
      this.scannedFiles, this.createdAt, this.__v);
  factory UserProfile.fromJson(Map<String,dynamic> json){
    return UserProfile(
        json['profile'],
        json['_id'],
        json['name'],
        json['email'],
        json['phoneNo'],
        json['TIN_Number'],
        json['score'],
        json['role'],
      json['rank'],
        json['gender'],
      json['status'],


        json['scannedFiles'],


      json['createdAt'],
      json['__v'],

    );
  }

}