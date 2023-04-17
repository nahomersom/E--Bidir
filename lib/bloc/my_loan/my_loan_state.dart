

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
    required this.errorMessage,
  }):myLoanInfo = myLoanInfo ?? const [];

  final MyLoanStatus status;
  final List<MyLoanInfo> myLoanInfo;
  final String errorMessage;

  @override
  List<Object?> get props => [status,myLoanInfo];

  MyLoanState copyWith({MyLoanStatus? status,List<MyLoanInfo>? myLoanInfo,errorMessage}){
    return  MyLoanState(status: status ?? this.status,myLoanInfo: myLoanInfo ?? this.myLoanInfo,errorMessage: errorMessage);
  }

}