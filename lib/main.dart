import 'dart:async';

import 'package:flutter/material.dart';

import 'package:whatsapp_clone/screen/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Color(0xFF075E54)),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/HomeScreen': (BuildContext context) => Splash()
        },
        debugShowCheckedModeBanner: false);
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/WhatsApp.jpeg",
              ),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}
