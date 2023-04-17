import 'dart:io';

import 'package:e_bidir/data/model/bank/bank_logo.dart';


class BankInfo {
   final Map logo;
   final String _id;
   final String bank_name;
   final String bank_email;
   final String bank_phoneNo;
   final String role;
   final String status;
   final String createdAt;
   final int __v;
  BankInfo(this.logo, this._id, this.bank_name, this.bank_email, this.bank_phoneNo, this.role, this.status, this.createdAt, this.__v);
  factory BankInfo.fromJson(Map<String,dynamic> json){

    return BankInfo(
        json['logo'],
        json['_id'],
        json['bank_name'],
        json['bank_email'],
        json['bank_phoneNo'],
        json['role'],
        json['status'],
        json['createdAt'],
        json['__v']
    );
  }
}