import 'package:crypto_app/login.dart';
import 'package:crypto_app/pages/home_page.dart';
import 'package:crypto_app/snackbar.dart';
import 'package:crypto_app/widgets/actions/actions_widget.dart';
import 'package:crypto_app/widgets/balance_panel/balance_panel.dart';
import 'package:crypto_app/widgets/chart/chart_home_page.dart';
import 'package:crypto_app/widgets/type_card.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  double balance = 300000.10;
  double profit = 35.22;
  double profitPercent = 0.22;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
          currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.read_more),label: 'Learn'),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Profile'),
      ]),
      backgroundColor: themeData.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: SizedBox(
            height: 10.w,
            width: 15.w,
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15.w,
          title: Text('Finfy'),
          // title: Image.asset(
          //   themeData.brightness == Brightness.light
          //       ? 'assets/sobGOGdark.png'
          //       : 'assets/sobGOGlight.png',
          //   height: 3.5.h,
          // ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: SizedBox(
                height: 3.5.h,
                width: 10.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    UniconsLine.bell,
                    color: themeData.primaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView(
            children: [
              balancePanel(balance, profit, profitPercent, themeData),
              //actionsWidget(themeData),
              typeCard('Banking', context),
              GestureDetector(
                child: typeCard('Stock Market', context),
                onTap: () {
                  print('hi');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              typeCard('Gold', context)
            ],
          ),
        ),
      ),
    );
  }
}
