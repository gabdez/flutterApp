import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeGridList extends StatelessWidget {
  const HomeGridList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      children: <Widget>[
        Card(
          elevation: 6,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Icon(
                  FontAwesomeIcons.users,
                  color: Colors.blueGrey,
                  size: 70.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Mon équipe',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 6,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Icon(
                  FontAwesomeIcons.play,
                  color: Colors.blueGrey,
                  size: 70.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Lancer match',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 6,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Icon(
                  FontAwesomeIcons.chartArea,
                  color: Colors.blueGrey,
                  size: 70.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Stats par match',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 6,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Icon(
                  FontAwesomeIcons.chartLine,
                  color: Colors.blueGrey,
                  size: 70.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Stats par joueur',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 6,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Icon(
                  FontAwesomeIcons.calendarAlt,
                  color: Colors.blueGrey,
                  size: 70.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Calendrier',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 6,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Icon(
                  FontAwesomeIcons.slidersH,
                  color: Colors.blueGrey,
                  size: 70.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Paramètres',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
