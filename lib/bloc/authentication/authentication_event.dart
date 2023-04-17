
part of 'authentication_bloc.dart';


abstract class AuthenticateEvent extends Equatable{
  const AuthenticateEvent();
  @override
  List<Object> get props=>[];
}

class AuthenticateRequest extends AuthenticateEvent{
  final LoginModel user;
  const AuthenticateRequest(this.user);
  @override
  List<Object> get props => [user];
}
class ClearToken extends AuthenticateEvent{}
class GetCurrentUser extends AuthenticateEvent{}
//authencitcated
