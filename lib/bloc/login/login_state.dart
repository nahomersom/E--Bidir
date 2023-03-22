import 'package:e_bidir/data/model/login_model.dart';
import 'package:equatable/equatable.dart';


enum loginStatus {initial,loading,success,error,selected}

extension LoginStatusx on loginStatus{
  bool get isInitial => this == loginStatus.initial;
  bool get isLoading => this == loginStatus.loading;
  bool get  isSuccess => this == loginStatus.success;
  bool get isSelected => this == loginStatus.selected;
  bool get hasError => this == loginStatus.error;

}
class LoginState extends Equatable{

  const LoginState({this.status = loginStatus.initial,List<LoginModel>? loginData}):loginData = loginData ?? const [];

  final List<LoginModel> loginData;
  final loginStatus status;

  @override
  List<Object?> get props => [loginData,status];

  LoginState copyWith({List<LoginModel>? loginData,loginStatus ? status}){
    return  LoginState(loginData: loginData ?? this.loginData,status: status ?? this.status);
  }

}