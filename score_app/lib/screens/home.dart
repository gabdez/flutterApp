import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/transitions/SlideLeftRoute.dart';
import 'package:score_app/widgets/homeGridList.dart';
import 'package:score_app/widgets/myClipper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SelectEquipe.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print('build home');
    final equipesP = Provider.of<EquipesProvider>(context);
    final equipe = equipesP.currentEquipe;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.blueAccent,
              height: 275,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30, top: 80),
                      child: Text(
                        equipe.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 175, top: 80),
                      child: PopupMenuButton<int>(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text("Changer d'équipe"),
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 1) {
                            final pref = await SharedPreferences.getInstance();
                            await pref.clear();
                            Navigator.pushReplacement(
                              context,
                              SlideLeftRoute(
                                  page: SelectEquipe(), duration: 200),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 175), child: HomeGridList()),
        ],
      ),
    );
  }
}
