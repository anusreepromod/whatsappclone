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
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Column(
            children: [
              Text(
                "Welcome to WhatsApp",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
                child: Image.asset("assets/images/WhatsApp1.jpeg"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
                child: Text(
                    "Read our Privacy Policy. Tap 'Agree and continue' to accept the Terms of Service"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: FlatButton(
                  child: Text(
                    'AGREE AND CONTINUE',
                    style: TextStyle(fontSize: 18.0),
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
