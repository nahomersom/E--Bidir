part of 'loan_request_bloc.dart';
//autenticated and authenticated

enum PersonalProfileStatus { loading, success, error }

enum EconomicStatus { loading, success, error }

enum LoanRequestStatus { loading, success, error }

extension PersonalProfileStatusx on PersonalProfileStatus {
  bool get isPersonalProfileLoading => this == PersonalProfileStatus.loading;
  bool get isPersonalProfileSuccess => this == PersonalProfileStatus.success;
  bool get hasPersonalProfileError => this == PersonalProfileStatus.error;
}

class LoanRequestState extends Equatable {
  LoanRequestState({
    this.personalProfileStatus = PersonalProfileStatus.loading,
    Person? personalInfo,
    required this.errorMessage,
  }) : personalInfo = personalInfo;

  final PersonalProfileStatus personalProfileStatus;
  final Person? personalInfo;
  final String errorMessage;

  @override
  List<Object?> get props => [
        PersonalProfileStatus,
        errorMessage,
        personalInfo,
      ];

  LoanRequestState copyWith(
      {PersonalProfileStatus? PersonalProfileStatus,
      EconomicStatus? economicStatus,
      PersonalProfileStatus? personalStatus,
      Person? personalInfo,
      errorMessage}) {
    return LoanRequestState(
        personalProfileStatus:
            PersonalProfileStatus ?? this.personalProfileStatus,
        personalInfo: personalInfo ?? this.personalInfo,
        errorMessage: errorMessage);
  }
}
