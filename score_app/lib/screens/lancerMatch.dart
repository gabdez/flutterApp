import 'package:flutter/material.dart';

class LancerMatch extends StatefulWidget {
  const LancerMatch({Key key}) : super(key: key);

  @override
  _LancerMatchState createState() => _LancerMatchState();
}

class _LancerMatchState extends State<LancerMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          title: Text(
            'Préparation d\'avant match',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            color: Colors.blue,
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Text("data")),
    );
  }
}
