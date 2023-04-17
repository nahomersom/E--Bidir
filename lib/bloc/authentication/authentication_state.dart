

part of 'authentication_bloc.dart';
//autenticated and authenticated


enum AuthenticationStatus {unauthenticated,authenticated}

// extension LoginStatusx on loginStatus{
//   bool get isInitial => this == loginStatus.initial;
//   bool get isLoading => this == loginStatus.loading;
//   bool get  isSuccess => this == loginStatus.success;
//   bool get isSelected => this == loginStatus.selected;
//   bool get hasError => this == loginStatus.error;
//
// }
extension RecommendationStatusx on AuthenticationStatus{
  bool get authenticated => this == AuthenticationStatus.authenticated;
  bool get unauthenticated => this == AuthenticationStatus.unauthenticated;

}
class AuthenticationState extends Equatable{
  AuthenticationState({
    this.status = AuthenticationStatus.unauthenticated,
  });


  final AuthenticationStatus status;

  @override
  List<Object?> get props => [status];

  AuthenticationState copyWith({AuthenticationStatus? status,}){
    return  AuthenticationState(status: status ?? this.status);
  }

}