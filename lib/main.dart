//import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:file_picker/file_picker.dart';
//
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Music Player',
//      theme: ThemeData(
//
//        primarySwatch: Colors.blue,
//      ),
//      home: HomePage(),
//    );
//  }
//}
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  AudioPlayer _audioPlayer = AudioPlayer();
//  bool isPlaying = false;
//  String currentTime = "00:00";
//  String completeTime= "00:00";
//
//  @override
//  void initState() {
//    super.initState();
//
//    _audioPlayer.onAudioPositionChanged.listen((Duration duration){
//      setState(() {
//        currentTime = duration.toString().split(".")[0];
//      });
//    });
//
//    _audioPlayer.onDurationChanged.listen((Duration duration){
//      setState(() {
//        completeTime = duration.toString().split(".")[0];
//      });
//    });
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    AssetImage imageAsset = AssetImage('assets/2.jpg');
//    Image image = Image(image: imageAsset, fit: BoxFit.contain);
//
//    return Scaffold(
//      backgroundColor: Colors.black,
//      body: Stack(
//        children: <Widget>[
//          image,
//
//          Container(
//            width: MediaQuery.of(context).size.width*0.8,
//            height: 80,
//
//            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.7, left: MediaQuery.of(context).size.width*0.1),
//
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.circular(50)
//            ),
//
//
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              mainAxisSize: MainAxisSize.max,
//              children: <Widget>[
//                IconButton(
//                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//                  onPressed: (){
//                    if(isPlaying){
//                      _audioPlayer.pause();
//
//                      setState(() {
//                        isPlaying = false;
//                      });
//                    }else{
//                      _audioPlayer.resume();
//
//                      setState(() {
//                        isPlaying = true;
//                      });
//                    }
//
//                  },
//                )  ,
//
//                SizedBox(width: 16,),
//
//                IconButton(
//                  icon: Icon(Icons.stop),
//                  onPressed: (){
//                    _audioPlayer.stop();
//
//                    setState(() {
//                      isPlaying = false;
//                    });
//
//                  },
//                ),
//
//                Text(currentTime, style: TextStyle(fontWeight: FontWeight.w700),),
//
//                Text(" | "),
//
//                Text(completeTime, style: TextStyle(fontWeight: FontWeight.w300),),
//
//
//
//              ],
//            ),
//          ),
//        ],
//      ),
//
//
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.audiotrack),
//        onPressed: () async{
//          String filePath = await FilePicker.getFilePath();
//
//          int status = await _audioPlayer.play(filePath, isLocal: true);
//
//          if(status == 1){
//            setState(() {
//              isPlaying = true;
//            });
//          }
//        },
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}