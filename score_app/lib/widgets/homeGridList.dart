import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:score_app/screens/calendar.dart';
import 'package:score_app/screens/lancerMatch.dart';
import 'package:score_app/screens/monEquipe.dart';
import 'package:score_app/transitions/SlideRightRoute.dart';

class HomeGridList extends StatelessWidget {
  const HomeGridList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODOS implement a JSON file with all actions and boucle on it
    return GridView.count(
      crossAxisCount: 2,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      children: <Widget>[
        InkWell(
          onTap: () => {
            Navigator.push(
              context,
              SlideRightRoute(page: MonEquipe(), duration: 200),
            )
          },
          child: Card(
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
        ),
        InkWell(
          onTap: () => {
            Navigator.push(
              context,
              SlideRightRoute(page: LancerMatch(), duration: 200),
            )
          },
          child: Card(
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
                  FontAwesomeIcons.projectDiagram,
                  color: Colors.blueGrey,
                  size: 70.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Mes Systèmes',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => {
            Navigator.push(
              context,
              SlideRightRoute(page: Calendar(), duration: 200),
            )
          },
          child: Card(
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
        ),
      ],
    );
  }
}
