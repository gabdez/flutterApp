import 'package:flutter/material.dart';
import 'package:score_app/models/match.dart' as m;

class ListMatchJouer extends StatefulWidget {
  final List<m.Match> listMatchs;
  const ListMatchJouer(this.listMatchs);

  @override
  _ListMatchJouerState createState() => _ListMatchJouerState();
}

class _ListMatchJouerState extends State<ListMatchJouer> {
  double height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: height == null ? 350 : height,
      child: GestureDetector(
        onVerticalDragUpdate: (detail) {
          print('update');
          double h = detail.globalPosition.dy - 120; // 120 -> size of toolbar
          setState(() {
            if (height != null && h < 350 && h > 0)
              height = h;
            else if (height == null) height = h;
          });
        },
        child: Container(
          padding: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.blueAccent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Historique',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: widget.listMatchs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: widget.listMatchs[index].score1 >
                                              widget.listMatchs[index].score2
                                          ? Colors.greenAccent
                                          : Colors.redAccent),
                                  child: Text(
                                    widget.listMatchs[index].score1 >
                                            widget.listMatchs[index].score2
                                        ? 'V'
                                        : 'D',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  height: 30,
                                  width: 30,
                                ),
                                Text(widget.listMatchs[index].nomEquipeAdv,
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 20)),
                                Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.blue,
                                        size: 20,
                                      )),
                                )
                              ],
                            )),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
