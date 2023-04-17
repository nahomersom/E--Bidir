import 'dart:io';

import 'package:e_bidir/data/model/bank/bank_info.dart';
import 'package:equatable/equatable.dart';

class Bank extends Equatable{
  final bool success;
  final List<BankInfo> banks;
  const Bank({required this.success, required this.banks});
  @override
  List<Object?> get props => [success,banks];
}