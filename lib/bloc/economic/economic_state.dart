part of 'economic_bloc.dart';

enum UpdateEconomyStatus { initial, loading, success, error }

extension UpdateEconomyStatusx on UpdateEconomyStatus {
  bool get isLoanRequestInitial => this == UpdateEconomyStatus.initial;
  bool get isLoanRequestLoading => this == UpdateEconomyStatus.loading;
  bool get isLoanRequestSuccess => this == UpdateEconomyStatus.success;
  bool get hasLoanRequestError => this == UpdateEconomyStatus.error;
}

class UpdateEconomyState extends Equatable {
  UpdateEconomyState({
    this.updateEconomicInfoStatus = UpdateEconomyStatus.initial,
    Economic? economicInfo,
    required this.errorMessage,
  }) : economicInfo = economicInfo;

  final UpdateEconomyStatus updateEconomicInfoStatus;
  final Economic? economicInfo;
  final String errorMessage;

  @override
  List<Object?> get props => [
        updateEconomicInfoStatus,
        errorMessage,
        economicInfo,
      ];

  UpdateEconomyState copyWith(
      {UpdateEconomyStatus? updateEconomicInfoStatus,
      Economic? economicInfo,
      errorMessage}) {
    return UpdateEconomyState(
        updateEconomicInfoStatus:
            updateEconomicInfoStatus ?? this.updateEconomicInfoStatus,
        economicInfo: economicInfo ?? this.economicInfo,
        errorMessage: errorMessage);
  }
}
