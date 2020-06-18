import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    const color = const Color(0xffFE6F5E);
    const color1 = const Color(0xffFFF1D7);
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
                  onPressed: () { },
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
                Text("1.30",
                    style: TextStyle(
                    fontSize:13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                )),
                Text("3.00",
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.pause,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: (){ },
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
