

part of 'user_profile_bloc.dart';
//autenticated and authenticated


enum UserProfileStatus {loading,success,error}

extension LoginStatusx on UserProfileStatus{
  bool get isLoading => this == UserProfileStatus.loading;
  bool get  isSuccess => this == UserProfileStatus.success;
  bool get hasError => this == UserProfileStatus.error;

}
class UserProfileState extends Equatable{
  UserProfileState({
    this.status = UserProfileStatus.loading,
    UserProfile? userInfo,
      required this.errorMessage,
  }):userInfo = userInfo;

  final UserProfileStatus status;
  final UserProfile? userInfo;

  final String errorMessage;

  @override
  List<Object?> get props => [status,userInfo,errorMessage];

  UserProfileState copyWith({UserProfileStatus? status,UserProfile? userInfo,errorMessage}){
    return  UserProfileState(status: status ?? this.status,userInfo: userInfo ?? this.userInfo,

        errorMessage: errorMessage);
  }

}