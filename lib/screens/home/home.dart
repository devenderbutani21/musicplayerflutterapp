import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime= "00:00";

  @override
  void initState() {
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration){
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const color = const Color(0xffFE6F5E);
    const color1 = const Color(0xffFFF1D7);
    const color2 = const Color(0xffE34A27);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
//      backgroundColor: Colors.blueGrey.shade100,
      backgroundColor: color,
      body: SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    String filePath = await FilePicker.getFilePath();
                    int status = await _audioPlayer.play(filePath, isLocal: true);

                    if(status == 1) {
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(150),
              ),
              padding: EdgeInsets.all(6),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/2.jpg'),
                maxRadius: 160,
              ),
            ),
          ),
          SizedBox(height: 30,),
          Text(
              "Song Name",
              style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.w600
              )
          ),
          SizedBox(height: 8,),
          Text(
              "Artist Name",
              style: TextStyle(
                  fontSize:16,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600
              )
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Text(currentTime,
                    style: TextStyle(
                    fontSize:13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                )),
                Text(completeTime,
                    style: TextStyle(
                        fontSize:13,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    )),
              ],
            ),
          ),
          Slider(
            min: 0,
            max: 3,
            value: 1.5,
          ),
          SizedBox(height: 30,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shuffle,
                    size: 20,
                  ),
                  onPressed: () { },
                ),
                SizedBox(width: 30,),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(30),
                  ),
                   child: IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      size: 20,
                      color: Colors.black,
                      ),
                     onPressed: () {},
                    ),
                ),
                SizedBox(width: 18,),
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 30,
                      color: Colors.black,
                    ),
                    onPressed: (){
                      if(isPlaying){
                        _audioPlayer.pause();

                        setState(() {
                          isPlaying = false;
                        });
                      }else{
                        _audioPlayer.resume();

                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 18,),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    size: 20,
                    color: Colors.black,
                  ),
                    onPressed: () { },
                ),
                ),
                SizedBox(width: 30,),
                IconButton(
                  icon: Icon(
                    Icons.repeat,
                    size: 20,
                  ),
                  onPressed: () { },
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
