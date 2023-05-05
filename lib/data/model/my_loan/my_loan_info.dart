class MyLoanInfo {
  final dynamic _id;
  final dynamic loan_amount;
  final dynamic Reason_for_loan;
  final dynamic Loan_Payment_Period;
  final dynamic Bank;
  final dynamic Type_Of_Loan;
  final dynamic Types_of_Collateral;
  final dynamic Monthly_payment;
  final dynamic interest;
  final dynamic score;
  final dynamic status;
  final dynamic id;
  final dynamic createdAt;
  final dynamic rank;
  final dynamic paidMonths;
  final dynamic paidMonth;
  final dynamic Job_Status;

  MyLoanInfo(
      this._id,
      this.loan_amount,
      this.Reason_for_loan,
      this.Loan_Payment_Period,
      this.Bank,
      this.Type_Of_Loan,
      this.Types_of_Collateral,
      this.Monthly_payment,
      this.interest,
      this.score,
      this.status,
      this.id,
      this.createdAt,

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
        json['Types_of_Collateral'],

        json['Monthly_payment'],
        json['interest'],
        json['score'],
        json['status'],
        json['id'],
        json['createdAt'],

        json['rank'],
        json['paidMonths'],
        json['paidMonth'],
        json['Job_Status']);
  }
}
