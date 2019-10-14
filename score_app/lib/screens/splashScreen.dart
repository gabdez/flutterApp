import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/screens/SelectEquipe.dart';
import 'package:score_app/screens/home.dart';
import 'package:score_app/transitions/SlideRightRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  SharedPreferences _prefs;
  AnimationController rotationController;
  int _idEquipe = 0;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() {
          _prefs = prefs;
          print('gaggagaga');
          _chargerEquipePref();
        });
      });
    rotationController = AnimationController(
        upperBound: 1.0,
        duration: const Duration(milliseconds: 5000),
        vsync: this);
    rotationController.forward(from: 0.0);
    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.repeat();
      }
    });
  }

  void _chargerEquipePref() {
    _idEquipe = this._prefs.getInt('idEquipe') ?? 0;

    final equipesP = Provider.of<EquipesProvider>(context);
    final equipes = equipesP.items;
    equipesP.currentEquipe =
        equipes.firstWhere((e) => e.id == _idEquipe, orElse: () => null);

    if (equipesP.currentEquipe == null) {
      Timer(Duration(seconds: 5), () => goToSelectEquipe());
    } else
      Timer(Duration(seconds: 5), () => goToHome());
  }

  void goToSelectEquipe() {
    print('pas idEquipe selectionner');
    Navigator.pushReplacement(
      context,
      SlideRightRoute(page: SelectEquipe(), duration: 200),
    );
  }

  void goToHome() {
    print('un idEquipe selectionner');
    Navigator.pushReplacement(
      context,
      SlideRightRoute(page: Home(), duration: 200),
    );
  }

  @override
  void dispose() {
    rotationController.dispose();
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
            color: Colors.blueAccent,
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
                    RotationTransition(
                        turns: Tween(begin: 0.0, end: 3.0)
                            .animate(rotationController),
                        child: FittedBox(
                          child: Image.asset(
                            'assets/images/ball.png',
                            height: 50,
                            width: 50,
                          ),
                          fit: BoxFit.fill,
                        )),
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
