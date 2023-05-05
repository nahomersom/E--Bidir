part of 'user_profile_bloc.dart';
//autenticated and authenticated

enum UserProfileStatus { loading, success, error }

enum EconomicStatus { loading, success, error }

enum PersonalProfileStatus { loading, success, error }


extension UserProfileStatusx on UserProfileStatus {
  bool get isUserProfileLoading => this == UserProfileStatus.loading;
  bool get isUserProfileSuccess => this == UserProfileStatus.success;
  bool get hasUserProfileError => this == UserProfileStatus.error;
}


class UserProfileState extends Equatable {
  UserProfileState({
    this.userProfileStatus = UserProfileStatus.loading,
    UserProfile? userInfo,
    Economic? economicInfo,
    Person? personalInfo,
    required this.errorMessage,
  })  : userInfo = userInfo,
        economicInfo = economicInfo,
        personalInfo = personalInfo;

  final UserProfileStatus userProfileStatus;
  final UserProfile? userInfo;
  final Economic? economicInfo;
  final Person? personalInfo;
  final String errorMessage;

  @override
  List<Object?> get props => [
        userProfileStatus,
        userInfo,
        errorMessage,
        economicInfo,

      ];

  UserProfileState copyWith(
      {UserProfileStatus? userProfileStatus,
      EconomicStatus? economicStatus,
      PersonalProfileStatus? personalStatus,
      UserProfile? userInfo,
      Economic? economicInfo,
      Person? personalInfo,
      errorMessage}) {
    return UserProfileState(
        userProfileStatus: userProfileStatus ?? this.userProfileStatus,
        userInfo: userInfo ?? this.userInfo,
        economicInfo: economicInfo ?? this.economicInfo,
        personalInfo: personalInfo ?? this.personalInfo,
        errorMessage: errorMessage);
  }
}
