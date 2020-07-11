import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";
  double currentTimeSlider = 0.0;
  double completeTimeSlider = 0.0;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
        currentTimeSlider = duration.inSeconds.toDouble();
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
        completeTimeSlider = duration.inSeconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    const color = const Color(0xffF5F5F5);
//    const color1 = const Color(0xffFFF1D7);
//    const color2 = const Color(0xffE34A27);
    String filePath = "";
    String songName = "Song Name";
    if (filePath != "") {
      songName = filePath.split('/').last;
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); // For only allowing portrait view of the player
    return Scaffold(
//      backgroundColor: Colors.blueGrey.shade100,
//      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey,
                    Colors.white,
//                Color.fromARGB(255, 25, 178, 238),
//                Color.fromARGB(255, 21, 236, 229),
//                    Color.fromARGB(255, 190,101,245),
//                    Color.fromARGB(255, 218,120,221),
//                    Color.fromARGB(255, 249,123,160),
//                    Color.fromARGB(255, 250,112,137),
              ])),
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
                        filePath = await FilePicker.getFilePath();
                        int status =
                            await _audioPlayer.play(filePath, isLocal: true);

                        if (status == 1) {
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: <Widget>[
                    Container(
//                      height: 300,
//                      width: 300,
//                      alignment: Alignment.center,
                      child: SleekCircularSlider(
                        min: 0.0,
                        max: completeTimeSlider,
                        initialValue:  0.0 ?? currentTimeSlider,
                        appearance: CircularSliderAppearance(
                          size: 200,
                          startAngle: 180,
                          angleRange: 180,
                          counterClockwise: true,
                          customWidths: CustomSliderWidths(progressBarWidth: 7),
                        ),
                        onChange: (value) {
                          setState(() {
                            _audioPlayer.seek(Duration(milliseconds: (value/1000.0).toInt()));
                            value = currentTimeSlider;
                          });
                        },
                        onChangeStart: (double startValue) {
                          // callback providing a starting value (when a pan gesture starts)
                        },
                        onChangeEnd: (double endValue) {
                          // ucallback providing an ending value (when a pan gesture ends)
                        },
                        innerWidget: (double value) {
                          // use your custom widget inside the slider (gets a slider value from the callback)
                        },
                      ),
                    ),
                    Container(
//                      height: 300,
//                      width: 300,
//                      alignment: Alignment.center,
                      padding: EdgeInsets.all(6),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/2.jpg'),
                        maxRadius: 100,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(songName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 8,
              ),
              Text("Artist Name",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(currentTime,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    Text(completeTime,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
//            Slider(
//              value: currentTimeSlider ?? 0,
//              min: 0.0,
//              max: completeTimeSlider,
//              onChanged: (value){
//                setState(() {
//                  _audioPlayer.seek(Duration(milliseconds: (value / 1000.0).toInt()));
//                  value = currentTimeSlider;
//                });
//              },
//              activeColor: Color.fromARGB(255, 25,178,238),
//              inactiveColor: Colors.grey,
//            ),
//              SizedBox(
//                height: 30,
//              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shuffle,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                    SizedBox(
                      width: 18,
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 25, 178, 238),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 30,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (isPlaying) {
                            _audioPlayer.pause();

                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            _audioPlayer.resume();

                            setState(() {
                              isPlaying = true;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.skip_next,
                          size: 20,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.repeat,
                        size: 20,
                      ),
                      onPressed: () {
//                    _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
