import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff24272b),
        body: Container(
          child: Row(
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Color(0xff272a2f),
                child: Icon(
                  Icons.arrow_back,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Color(0xff272a2f),
                child: Icon(
                  Icons.menu,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
