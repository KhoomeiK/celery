// IS THIS FILE STILL NEEDED???

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'food_icon.dart';
import 'package:transparent_image/transparent_image.dart';
import 'recents.dart';
import 'stats_page.dart';
import 'globals.dart' as globals;
import 'analysis.dart';
import 'Social.dart';
import 'profile.dart';

class ProducePage extends StatefulWidget {
  State createState() => new ProducePageState();
}

class ProducePageState extends State<ProducePage> {
int index = 0;
List<Food_icon> list = globals.global;
  Widget _buildBottomNav() {
    return new BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        this.index = index;
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
              SizedBox(width: 40.0),
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
                onTap: () {
                  Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (_) => new SocialPage(),
                  ));
                },
                child: Icon(Icons.account_box),
              )),
          SizedBox(width: 17.0),
        ],
      ),
      body:
      //         Container(
      //   padding: EdgeInsets.all(20.0),
      //   child: Column(
      //     children: <Widget>[
      //       Expanded(
      //     child: SizedBox(
      //       height: 200.0,
      //       child: new ListView.builder(
      //         scrollDirection: Axis.vertical,
      //         itemCount: globals.chosenNigga.length,
      //         itemBuilder: (BuildContext ctxt, int index) {
      //           return new Center( 
      //             child: ListTile(
      //               title: new Text(globals.chosenNigga[index].company),
      //               onTap: () {
      //                 globals.chosen = globals.chosenNigga[index];
      //                 // Navigator.push(context,
      //                 //  MaterialPageRoute(builder: (context) => StatsPage()));
      //               },
      //               ));
      //           },
      //       ),
      //     ),
      //   ),
        
      // ],
      // ),
      // ),
      PageView(children: <Widget>[
        new CustomScrollView(
                      primary: false,
                      slivers: <Widget>[
                        new SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: new SliverGrid.count(
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            crossAxisCount: 1,
                            children:
                                listSup(globals.chosenNigga, context),
                          ),
                        ),
                      ],
        ),
      ],
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  List<Widget> listSup(
    List<Profile> bro, BuildContext context) {
  // Children list for the list.
  List<Widget> listElementWidgetList = new List<Widget>();
  if (bro != null) {
    var lengthOfList = bro.length;
    for (int i = 0; i < lengthOfList; i++) {
     Profile temp = bro[i];
      // Image URL
      var imageURL = temp.imagePath;
      // List item created with an image of the poster
      var listItem = new GridTile(
          footer: new GridTileBar(
            backgroundColor: Colors.black45,
            title: new Text(temp.company),
          ),
          child: new GestureDetector(
            onTap: () {
              globals.chosen = temp;
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (_) => new StatsPage(),
                  ));},
            child: new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageURL,
              fit: BoxFit.cover,
            ),
          ));
      listElementWidgetList.add(listItem);
    }
  }
  return listElementWidgetList;
}
}
 