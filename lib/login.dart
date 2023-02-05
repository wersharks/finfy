import 'package:crypto_app/auth.dart';
import 'package:crypto_app/otp_screen.dart';
import 'package:crypto_app/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? phoneNumber;
  String? name;
  String? schoolcode;
  String? rollno;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            themeNotifier.isDark ? "Dark Mode" : "Light Mode",
            style: TextStyle(
                color:
                    themeNotifier.isDark ? Colors.white : Colors.grey.shade900),
          ),
          actions: [
            IconButton(
                icon: Icon(
                    themeNotifier.isDark
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    color: themeNotifier.isDark
                        ? Colors.white
                        : Colors.grey.shade900),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: size.height * 0.2,
                top: size.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, \nWelcome Back",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: size.width * 0.1,
                        )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Full name"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        onChanged: (value) {
                          rollno = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Roll no"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        onChanged: (value) {
                          schoolcode = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "School code"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Phone number"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<Auth>(context,listen: false).name = name;
                        Provider.of<Auth>(context,listen: false).rollno = rollno;
                        Provider.of<Auth>(context,listen: false).schoolcode = schoolcode;
                        Provider.of<Auth>(context,listen: false).mobileNumber = phoneNumber!;
                        Provider.of<Auth>(context,listen: false).submitPhoneNumber(context);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OTPPage()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      child: Center(
                          child: Text(
                        "Get OTP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
