import 'package:e_bidir/bloc/collateral/collaterals_bloc.dart';
import 'package:e_bidir/bloc/economic/economic_bloc.dart';
import 'package:e_bidir/bloc/person/personal_bloc.dart';
import 'package:e_bidir/views/screens/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/banks/banks_bloc.dart';
import '../../bloc/create_loan/create_loan_bloc.dart';
import '../../bloc/my_loan/my_loan_bloc.dart';
import '../../bloc/user_profile/user_profile_bloc.dart';
import '../../data/api/api_client.dart';
import '../../repositories/bank_repo.dart';
import '../../repositories/user_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async => false,child: HomeScreen());
  }
}
