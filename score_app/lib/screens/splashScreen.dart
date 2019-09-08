import 'dart:async';
import 'package:flutter/material.dart';
import 'package:score_app/screens/SelectEquipe.dart';
import 'package:score_app/transitions/SlideRightRoute.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => goToHome());
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      SlideRightRoute(page: SelectEquipe(), duration: 600),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build splashscreen');
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Basketball Score',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w500)),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'Chargement...Veuillez patienter !',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
