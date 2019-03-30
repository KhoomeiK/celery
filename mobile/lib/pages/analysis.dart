// IS THIS FILE STILL NEEDED???

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'recents.dart';
import 'food_icon.dart';
import 'globals.dart' as globals;
import 'home_page.dart';

class AnalysisPage extends StatefulWidget {
  State createState() => new AnalysisPageState();
}

class AnalysisPageState extends State<AnalysisPage> {
int index = 0;
  Widget _buildBottomNav() {
    return new BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        this.index = index;
        if (index == 0) {
          globals.global_name = "";
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        if (index == 1) {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MainPage2()));
        }
        if (index == 2) {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => BluetoothPage()));
        }
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text("Home"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.trending_up),
          title: new Text("Statistics"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.restaurant_menu),
          title: new Text("Full Menu"),
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Row(
            children: <Widget>[
              Image.asset('assets/Logo.png', width: 70.0, height: 70.0),
              SizedBox(width: 25.0),
              Text("Celery",
                  style: TextStyle(
                      fontFamily: "Rajdhani",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        ListTile(
            title: Text("Recently Cooked",
                style: TextStyle(fontFamily: "Rajdhani"),
                ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RecentsPage()));
            }
          ),
        ListTile(
            title: Text("---",
                style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats2Page()));
            }
          ),
        ListTile(
            title: Text("---",
                style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats3Page()));
            }
          ),
        ListTile(
            title: Text("Settings", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats4Page()));
            }),
        ListTile(
          title: Text("Help", style: TextStyle(fontFamily: "Rajdhani")),
          onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats5Page()));
            }
          ),
        ListTile(
            title: Text("About Us", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats6Page()));
            }
            ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    //showMap();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return new Scaffold(
      appBar: AppBar(
        title: new Padding(
            child: new Text("Restaurant Statistics",
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Rajdhani",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0)),
            padding: const EdgeInsets.only(left: 0.0)),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.account_box),
              )),
          SizedBox(width: 17.0),
        ],
      ),
      body: Center( child: Column(
          children: <Widget>[
        // new Padding(
        //   padding: EdgeInsets.all(15.0),
        // child:
        // new Text ("Restaurant Statistics", style: new TextStyle(
        //             fontWeight: FontWeight.normal,
        //             fontFamily: "Rajdhani",
        //             fontStyle: FontStyle.normal,
        //             fontSize: 25.0)),

        // new Padding(
        //   padding: EdgeInsets.all(15.0),
        //   child: new Image.network(globals.getImageURL()),
        // ),

        // new Padding(
        //   padding: EdgeInsets.all(15.0),
        //   child: new Image.network(globals.getImageURL()),
        // ),

        // new Padding(
        //   padding: EdgeInsets.all(15.0),
        //   child: new Image.network(globals.getImageURL()),
        // ),

        
      ],
    ),
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

}
