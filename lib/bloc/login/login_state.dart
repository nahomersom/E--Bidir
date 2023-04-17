

part of 'login_bloc.dart';
//autenticated and authenticated
enum LoginStatus {initial,loading,success,error}

extension LoginStatusx on LoginStatus{
  bool get isInitial => this == LoginStatus.initial;
  bool get isLoading => this == LoginStatus.loading;
  bool get  isSuccess => this == LoginStatus.success;
  bool get hasError => this == LoginStatus.error;

}
class LoginState extends Equatable{
   LoginState({
    this.status = LoginStatus.initial,
    LoginModel? user,
    required this.errorMessage,
   }):user = user;


  final LoginModel? user;
  final String errorMessage;
  final LoginStatus status;

  @override
  List<Object?> get props => [user,status];

  LoginState copyWith({LoginModel? user,LoginStatus? status,required String errorMessage}){
    return  LoginState(user: user ?? this.user,status: status ?? this.status,errorMessage: errorMessage);
  }

}