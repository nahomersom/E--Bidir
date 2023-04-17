

part of 'banks_bloc.dart';
//autenticated and authenticated


enum BankStatus {loading,success,error}

extension LoginStatusx on BankStatus{
  bool get isLoading => this == BankStatus.loading;
  bool get  isSuccess => this == BankStatus.success;
  bool get hasError => this == BankStatus.error;

}
class BankState extends Equatable{
  BankState({
    this.status = BankStatus.loading,
    List<BankInfo>? bankInfo,
    required this.errorMessage,
  }):bankInfo = bankInfo ?? const [];

  final BankStatus status;
  final List<BankInfo> bankInfo;
  final String errorMessage;

  @override
  List<Object?> get props => [status,bankInfo];

  BankState copyWith({BankStatus? status,List<BankInfo>? bankInfo,errorMessage}){
    return  BankState(status: status ?? this.status,bankInfo: bankInfo ?? this.bankInfo,errorMessage: errorMessage);
  }

}