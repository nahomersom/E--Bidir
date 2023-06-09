

part of 'my_loan_bloc.dart';
//autenticated and authenticated


enum MyLoanStatus {loading,success,error}

extension LoginStatusx on MyLoanStatus{
  bool get isLoading => this == MyLoanStatus.loading;
  bool get  isSuccess => this == MyLoanStatus.success;
  bool get hasError => this == MyLoanStatus.error;

}
class MyLoanState extends Equatable{
  MyLoanState({
    this.status = MyLoanStatus.loading,
    List<MyLoanInfo>? myLoanInfo,
    List<Map>? myLoanStatus,
    required this.errorMessage,
  }):myLoanInfo = myLoanInfo ?? const [],myLoanStatus = myLoanStatus ?? const [];

  final MyLoanStatus status;
  final List<MyLoanInfo> myLoanInfo;
  final List<Map> myLoanStatus;
  final String errorMessage;

  @override
  List<Object?> get props => [status,myLoanInfo];

  MyLoanState copyWith({MyLoanStatus? status,List<MyLoanInfo>? myLoanInfo,errorMessage,List<Map>? myLoanStatus}){
    return  MyLoanState(status: status ?? this.status,myLoanInfo: myLoanInfo ?? this.myLoanInfo,
        myLoanStatus: myLoanStatus ?? this.myLoanStatus,
        errorMessage: errorMessage);
  }

}