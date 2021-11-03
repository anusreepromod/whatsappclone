import 'dart:ui';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: [
              Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF075E54)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                child: Image.asset(
                  "assets/images/WhatsApp1.jpeg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  "Read our Privacy Policy. Tap 'Agree and continue' to accept the Terms of Service",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: FlatButton(
                  child: Text(
                    'AGREE AND CONTINUE',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  color: Color(0xFF075E54),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
