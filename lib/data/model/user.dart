import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String? password;
  final String? phoneNo;
  const User({this.password,this.phoneNo});
  @override
  List<Object?> get props => [password,phoneNo];
}