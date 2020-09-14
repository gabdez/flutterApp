import 'package:flutter/material.dart';
import 'package:score_app/models/match.dart' as m;
import 'package:score_app/widgets/matchCard.dart';

class CarouselMatch extends StatelessWidget {
  final String title;
  final List<m.Match> listeMatchs;

  const CarouselMatch(this.title, this.listeMatchs);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 25, bottom: 10, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.title,
                style: TextStyle(
                    fontSize: 25, color: Colors.blue, fontFamily: 'Monserrat'),
              ),
            ],
          ),
        ),
        Container(
          height: 160,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: listeMatchs.length,
            itemBuilder: (context, index) {
              return MatchCard(listeMatchs[index]);
              /* Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(
                                    colors: [
                                      listeMatchs[index].score1 >
                                              listeMatchs[index].score2
                                          ? Colors.redAccent[200]
                                          : Colors.greenAccent[200],
                                      Colors.white
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.0, 1.2))),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 10,
                                          child: Text(
                                            listeMatchs[index].nomEquipeAdv,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                        ),
                                        Positioned(
                                          top: 50,
                                          child: Text(
                                              listeMatchs[index].estDomicile
                                                  ? 'Domicile'
                                                  : 'Extérieur',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 15)),
                                        ),
                                        Positioned(
                                          top: 70,
                                          child: Text(
                                            formatDate(
                                                listeMatchs[index].date, [
                                              dd,
                                              '-',
                                              mm,
                                              '-',
                                              yyyy,
                                            ]),
                                            style: TextStyle(
                                                color: Colors.blueGrey),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: listeMatchs[index].score1 <
                                                  listeMatchs[index].score2
                                              ? Text(
                                                  'V',
                                                  style: TextStyle(
                                                      color: Colors.greenAccent,
                                                      fontSize: 30),
                                                )
                                              : Text(
                                                  'D',
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontSize: 30),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))) */
            },
          ),
        ),
      ],
    );
  }
}
