import 'package:crypto_app/account.dart';
import 'package:crypto_app/auth.dart';
import 'package:crypto_app/data/theme_data.dart';
import 'package:crypto_app/login.dart';
import 'package:crypto_app/pages/home_page.dart';
import 'package:crypto_app/pages/home_screen.dart';
import 'package:crypto_app/themes/app_theme.dart';
import 'package:crypto_app/themes/theme_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeModel(),
        ),
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Account()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) =>
            Sizer(builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 500),
            debugShowCheckedModeBanner: false,
            title: 'Crypto App',
            home: (FirebaseAuth.instance.currentUser!=null)?HomeScreen():LoginPage(),
            theme: AppTheme.dark,
            darkTheme: darkModeTheme,
          );
        }),
      ),
    );
  }
}
