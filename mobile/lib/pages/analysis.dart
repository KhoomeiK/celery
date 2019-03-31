// IS THIS FILE STILL NEEDED???

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'recents.dart';
import 'food_icon.dart';
import 'globals.dart' as globals;
import 'home_page.dart';
import 'Social.dart';
import 'package:transparent_image/transparent_image.dart';


class AnalysisPage extends StatefulWidget {
  State createState() => new AnalysisPageState();
}

class AnalysisPageState extends State<AnalysisPage> {
int index = 0;
    List<Padding> lol = [];

  Widget _buildBottomNav() {
    return new BottomNavigationBar(
      currentIndex: 1,
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SocialPage()));
        }
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text("Home"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.lightbulb_outline),
          title: new Text("Insights"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.people),
          title: new Text("Suppliers"),
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
              Image.asset('assets/logo.png', width: 70.0, height: 70.0),
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
            child: new Text("Insights",
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Rajdhani",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0)),
            padding: const EdgeInsets.only(left: 0.0)),
      ),
      body: new PageView(
          children: <Widget>[

             new CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    new SliverPadding(
                      padding: const EdgeInsets.all(15.0),
                      sliver: new SliverFixedExtentList(
                          itemExtent: 200.0,
                          delegate: SliverChildListDelegate(
                            listData(),
                          )),
                    ),
                  ],
                ),
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
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }


List<Widget> listData() {
        lol.add(new Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                  child: Stack(
                    children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(20.0),
                              // child: new FadeInImage.memoryNetwork(
                              //   placeholder: kTransparentImage,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          // new ClipRRect(
                          //   borderRadius: new BorderRadius.circular(20.0),
                          //   child: new Container(
                          //       decoration: BoxDecoration(
                          //           gradient: LinearGradient(
                          //               begin: FractionalOffset.topCenter,
                          //               end: FractionalOffset.bottomCenter,
                          //               colors: [
                          //         Colors.grey.withOpacity(0.0),
                          //         //green = 0x802ecc71
                          //         Color(0x802ecc71),
                          //       ],
                          //               stops: [
                          //         0.0,
                          //         0.9
                          //       ]))),
                          // )
                      
                      Padding(
                          padding: EdgeInsets.all(20.0),
                          child:  
                          Center (child: new Text("Your Profits have decreased by 3.3% from last week. Your Stustainability has increased by 4.8% from last week.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w500)))
                      )],
                  ))),
          );

         lol.add(new Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                  child: Stack(
                    children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(20.0),
                              // child: new FadeInImage.memoryNetwork(
                              //   placeholder: kTransparentImage,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          // new ClipRRect(
                          //   borderRadius: new BorderRadius.circular(20.0),
                          //   child: new Container(
                          //       decoration: BoxDecoration(
                          //           gradient: LinearGradient(
                          //               begin: FractionalOffset.topCenter,
                          //               end: FractionalOffset.bottomCenter,
                          //               colors: [
                          //         Colors.grey.withOpacity(0.0),
                          //         //green = 0x802ecc71
                          //         Color(0x802ecc71),
                          //       ],
                          //               stops: [
                          //         0.0,
                          //         0.9
                          //       ]))),
                          // )
                      
                      Padding(
                          padding: EdgeInsets.all(20.0),
                          child:  
                          Center (child: new Text("Lettuce prices are likely to increase soon! Start shifting the menu or find a substitute.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w500)))
                      )],
                  )),
         ) );

         lol.add(new Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                  child: Stack(
                    children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(20.0),
                              // child: new FadeInImage.memoryNetwork(
                              //   placeholder: kTransparentImage,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          // new ClipRRect(
                          //   borderRadius: new BorderRadius.circular(20.0),
                          //   child: new Container(
                          //       decoration: BoxDecoration(
                          //           gradient: LinearGradient(
                          //               begin: FractionalOffset.topCenter,
                          //               end: FractionalOffset.bottomCenter,
                          //               colors: [
                          //         Colors.grey.withOpacity(0.0),
                          //         //green = 0x802ecc71
                          //         Color(0x802ecc71),
                          //       ],
                          //               stops: [
                          //         0.0,
                          //         0.9
                          //       ]))),
                          // )
                      
                      Padding(
                          padding: EdgeInsets.all(20.0),
                          child:  
                          Center (child: new Text("Tomato season is approaching! We recommend buying from Heinz, whose tomatoes have been rated a 4.9 season.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21.0,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w500)))
                      )],
                  )),
         ) );
         lol.add(new Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                  child: Stack(
                    children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(20.0),
                              // child: new FadeInImage.memoryNetwork(
                              //   placeholder: kTransparentImage,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          // new ClipRRect(
                          //   borderRadius: new BorderRadius.circular(20.0),
                          //   child: new Container(
                          //       decoration: BoxDecoration(
                          //           gradient: LinearGradient(
                          //               begin: FractionalOffset.topCenter,
                          //               end: FractionalOffset.bottomCenter,
                          //               colors: [
                          //         Colors.grey.withOpacity(0.0),
                          //         //green = 0x802ecc71
                          //         Color(0x802ecc71),
                          //       ],
                          //               stops: [
                          //         0.0,
                          //         0.9
                          //       ]))),
                          // )
                      
                      Padding(
                          padding: EdgeInsets.all(20.0),
                          child:  
                          Center (child: new Text("We recommend replacing some beef dishes with poultry for better sustainability!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w500)))
                      )],
                  )),
         ) );
         return lol;
}}
