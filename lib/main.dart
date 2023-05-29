import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/Screen/auth/editProfile.dart';
import 'package:quize/Screen/auth/login.dart';
import 'package:quize/Screen/auth/splash.dart';
import 'package:quize/conteroller/authgetx.dart';
import 'package:quize/db/DBSQLITE.dart';
import 'package:quize/Screen/MyHomePage.dart';
import 'package:quize/conteroller/datagetx.dart';
import 'package:quize/db/SharedPreferencesApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper().initDatabase();
  SharedPreferencesApp().SharedPreferencesAppInit();
  Get.put(data());
  Get.put(AuthGetx());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
       routes: {
         '/': (context) => SplashView(),
         'home':(context) => MyHomePage(),
         'login':(context) => Login_screen(),
         'update':(context) => ProfileUpdatePage(),
      },
    );
  }
}