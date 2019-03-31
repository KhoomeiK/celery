import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/home_page.dart';
import 'dart:async';
import './pages/recents.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    AssetImage s = AssetImage('assets/logo.png');
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
     SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return new Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80.0,
                      child: _image(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Text("Celery",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: "Quicksand"))
                  ],
                ))),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    "Food, made easy.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "Quicksand"),
                  )
                ],
              ),
            )
          ])
        ],
      ),
    );
  }

_image() {
    return Image.asset('assets/logo.png');
  }

  Widget _buildDrawer() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Row(
            children: <Widget>[
              Image.asset('assets/logo.png', width: 70.0, height: 70.0),
              SizedBox(width: 25.0),
              Text("Hi, Ryan",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        ListTile(
            title: Text("Vibrational Levels",
                style: TextStyle(fontFamily: "Quicksand")),
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => VibPage()));
            }),
        ListTile(
            title: Text("Haptic Patterns",
                style: TextStyle(fontFamily: "Quicksand")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HapticPage()));
            }),
        ListTile(
            title: Text("Rerun Tutorial",
                style: TextStyle(fontFamily: "Quicksand")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => TutorialPage()));
            }),
        ListTile(
            title: Text("Settings", style: TextStyle(fontFamily: "Quicksand")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SettingsPage()));
            }),
        ListTile(title: Text("Help", style: TextStyle(fontFamily: "Quicksand"))),
        ListTile(
            title: Text("About Us", style: TextStyle(fontFamily: "Quicksand"))),
      ],
    ));
  }
}
