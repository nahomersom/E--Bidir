class MyLoanInfo {
  final dynamic _id;
  final dynamic loan_amount;
  final dynamic Reason_for_loan;
  final dynamic Loan_Payment_Period;
  final dynamic Bank;
  final dynamic Type_Of_Loan;
  final dynamic Type_of_Collateral;
  final double Monthly_payment;
  final double interest;
  final int score;
  final dynamic status;
  final dynamic id;
  final dynamic createdAt;
  final int __v;
  final dynamic rank;
  final dynamic paidMonths;
  final dynamic paidMonth;
  final String Job_Status;

  MyLoanInfo(
      this._id,
      this.loan_amount,
      this.Reason_for_loan,
      this.Loan_Payment_Period,
      this.Bank,
      this.Type_Of_Loan,
      this.Type_of_Collateral,
      this.Monthly_payment,
      this.interest,
      this.score,
      this.status,
      this.id,
      this.createdAt,
      this.__v,
      this.rank,
      this.paidMonths,
      this.paidMonth,
      this.Job_Status);
  factory MyLoanInfo.fromJson(Map<String, dynamic> json) {
    return MyLoanInfo(
        json['_id'],
        json['loan_amount'],
        json['Reason_for_loan'],
        json['Loan_Payment_Period'],
        json['Bank'],
        json['Type_Of_Loan'],
        json['Type_of_Collateral'],
        json['Monthly_payment'],
        json['interest'],
        json['score'],
        json['status'],
        json['id'],
        json['createdAt'],
        json['__v'],
        json['rank'],
        json['paidMonths'],
        json['paidMonth'],
        json['Job_Status']);
  }
}
