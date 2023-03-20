import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/views/screens/dashboard.dart';
import 'package:e_bidir/views/screens/user.dart';
import 'package:flutter/material.dart';

import 'loan.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    List<Widget> pages = [
      const Dashboard(),
      const Loan(),
      const User(),


    ];
    return Scaffold(

      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar:BottomNavigationBar(

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
              activeIcon: Icon(Icons.menu_book_sharp),
              label:'Loan'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.menu_book_sharp),
              label:'User'),
        ],

      ),
    );
  }
}
