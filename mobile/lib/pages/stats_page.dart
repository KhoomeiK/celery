// IS THIS FILE STILL NEEDED???

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'recents.dart';
import 'food_icon.dart';
import 'globals.dart' as globals;
import 'home_page.dart';
import 'analysis.dart';
import 'chart.dart';
import "detail_graph.dart";

class StatsPage extends StatefulWidget {
  State createState() => new StatsPageState();
  StatsPage();
  static String name;
  static String imageURL;
  static String rest;
  static double cost;
  static String foodName;
  List<String> ingredients;
}

class StatsPageState extends State<StatsPage> {
  int index = 0;
  String name;
  String imageURL;
  String rest;
  double cost;
  List<String> ingredients;

  List<Detail_graph> list = globals.graphs;

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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AnalysisPage()));
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
            title: Text(
              "Recently Cooked",
              style: TextStyle(fontFamily: "Rajdhani"),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecentsPage()));
            }),
        ListTile(
            title: Text("Dishes", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats2Page()));
            }),
        ListTile(
            title: Text("Suppliers", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats3Page()));
            }),
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
            }),
        ListTile(
            title: Text("About Us", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats6Page()));
            }),
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
            child: new Text("Recommended",
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Rajdhani",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0)),
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
      body: PageView(children: <Widget>[
        new CustomScrollView(
          primary: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.all(15.0),
              sliver: new SliverFixedExtentList(
                  itemExtent: 200.0,
                  delegate: SliverChildListDelegate(
                    listGraphs(list, context),
                  )),
            ),
          ],
        ),
      ]),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  List<Widget> listGraphs(List<Detail_graph> graphs, BuildContext context) {
    List<Widget> listElementWidgetList = new List<Widget>();
    if (graphs != null) {
      var lengthOfList = graphs.length;
      for (int i = 0; i < lengthOfList; i++) {
        print(graphs[i].type);
        Detail_graph graph = graphs[i];
        // Image URL
        //var imageURL = food.imagePath;
        // List item created with an image of the poster
        var listItem = Container(
            child: new Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: new GestureDetector(
                  onTap: () {
                    globals.global_name = graph.type;
                    Navigator.push(
                        context,
                        // change this from StatsPage to the detailstatspage or whatever
                        new MaterialPageRoute(
                          builder: (_) => new StatsPage(),
                        ));
                  },
                  child: Stack(children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(
                          top: 35, left: 15, right: 15, bottom: 10),
                      child: SegmentsLineChart.withSampleData(),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Center(
                              child: Text(graph.type,
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    )
                  ]))),
        ));
        listElementWidgetList.add(listItem);
        print(listElementWidgetList.length);
      }
    }
    return listElementWidgetList;
  }
}
