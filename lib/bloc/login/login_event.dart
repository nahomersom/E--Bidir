
part of 'login_bloc.dart';
abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  List<Object> get props=>[];
}

class LogoutRequest extends LoginEvent{}
//authencitcated 
class LoginRequest extends LoginEvent{
  final User user;
  const LoginRequest(this.user);
  @override
  List<Object> get props => [user];
}
class LoginFailure extends LoginEvent{
  final String error;
  const LoginFailure(this.error);
  @override
  List<Object> get props => [error];
}