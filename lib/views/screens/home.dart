import 'package:e_bidir/bloc/banks/banks_bloc.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/views/screens/dashboard.dart';
import 'package:e_bidir/views/screens/loan_request.dart';
import 'package:e_bidir/views/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/my_loan/my_loan_bloc.dart';
import '../../data/api/api_client.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {


    List<Widget> pages = [
       Dashboard(),
      const LoanRequest(),
      const User(),


    ];
    return RepositoryProvider(

      create: (context)=> BankRepo(apiClient: ApiClient()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BankBloc>(create: (BuildContext context)=>BankBloc(bankRepo: context.read<BankRepo>())..add(GetBanks())),

          BlocProvider<MyLoanBloc>(create: (BuildContext context)=>MyLoanBloc(myLoanRepo: context.read<BankRepo>())..add(GetMyLoans())),
        ],
        child: BlocBuilder<BankBloc,BankState>(
            builder:(context,state){
              return    Scaffold(

              body: IndexedStack(
              index: _currentIndex,
              children: pages,
              ),
              bottomNavigationBar:BottomNavigationBar(
              selectedItemColor: ColorResources.accentColor,
              selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold
              ),

              backgroundColor: ColorResources.scaffoldColor,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              iconSize: 35,
              onTap: (index)=>{
              setState((){

              _currentIndex = index;

              })

              },
              items:  [
              const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home),
    label:'Home'
    ),
    const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag),
    activeIcon: Icon(Icons.shopping_bag),
    label:'Loan'),
    const BottomNavigationBarItem(
    icon: Icon(Icons.person),

    label:'User'),
    ],

    ),
    );
              
            }
         
      ),
      ),
    );
  }
}
