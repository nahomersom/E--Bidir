part of 'personal_bloc.dart';

// enum UserProfileStatus { loading, success, error }

// enum EconomicStatus { loading, success, error }

enum PersonalProfileStatus { initial,loading, success, error }

// extension UserProfileStatusx on UserProfileStatus {
//   bool get isUserProfileLoading => this == UserProfileStatus.loading;
//   bool get isUserProfileSuccess => this == UserProfileStatus.success;
//   bool get hasUserProfileError => this == UserProfileStatus.error;
// }
extension UserProfileStatusx on PersonalProfileStatus {
  bool get isPersonalProfileInitial => this == PersonalProfileStatus.initial;
  bool get isPersonalProfileLoading => this == PersonalProfileStatus.loading;
  bool get isPersonalProfileSuccess => this == PersonalProfileStatus.success;
  bool get hasPersonalProfileError => this == PersonalProfileStatus.error;
}

class PersonalState extends Equatable {
  PersonalState({
    this.personalStatus = PersonalProfileStatus.initial,
    UserProfile? userInfo,
    Economic? economicInfo,
    Person? personalInfo,
    required this.errorMessage,
  })  : userInfo = userInfo,
        economicInfo = economicInfo,
        personalInfo = personalInfo;

  final PersonalProfileStatus personalStatus;
  final UserProfile? userInfo;
  final Economic? economicInfo;
  final Person? personalInfo;
  final String errorMessage;

  @override
  List<Object?> get props => [
        personalStatus,
        userInfo,
        errorMessage,
        economicInfo,
      ];

  PersonalState copyWith(
      {PersonalProfileStatus? personalStatus,
      UserProfile? userInfo,
      Economic? economicInfo,
      Person? personalInfo,
      errorMessage}) {
    return PersonalState(
        personalStatus: personalStatus ?? this.personalStatus,
        userInfo: userInfo ?? this.userInfo,
        economicInfo: economicInfo ?? this.economicInfo,
        personalInfo: personalInfo ?? this.personalInfo,
        errorMessage: errorMessage);
  }
}
