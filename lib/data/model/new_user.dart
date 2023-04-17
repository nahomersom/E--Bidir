import 'dart:io';

import 'package:equatable/equatable.dart';

class NewUser extends Equatable{
  final String name;
  final String email;
  final String gender;
  final String phoneNo;
  final String TIN_Number;
  final List<File> scannedFiles;
  const NewUser({required this.name, required this.gender, required this.TIN_Number, required this.scannedFiles, required this.email,required this.phoneNo});
  @override
  List<Object?> get props => [name,gender,TIN_Number,scannedFiles,email,phoneNo];
}