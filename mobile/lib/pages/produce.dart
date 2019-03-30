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
        PageView(children: <Widget>[
        new CustomScrollView(
                      primary: false,
                      slivers: <Widget>[
                        new SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: new SliverGrid.count(
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            crossAxisCount: 2,
                            children:
                                listFoods(list, context),
                          ),
                        ),
                      ],
                    
        // _buildRow1(),
        // _buildRow2(),
    ),
      ],),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  List<Widget> listFoods(
    List<Food_icon> food, BuildContext context) {
  // Children list for the list.
  List<Widget> listElementWidgetList = new List<Widget>();
  if (food != null) {
    var lengthOfList = list.length;
    for (int i = 0; i < lengthOfList; i++) {
     Food_icon food = list[i];
      // Image URL
      var imageURL = food.imagePath;
      // List item created with an image of the poster
      var listItem = new GridTile(
          footer: new GridTileBar(
            backgroundColor: Colors.black45,
            title: new Text(food.name),
          ),
          child: new GestureDetector(
            onTap: () {
              globals.global_name = food.name;
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
 
_buildRow1() {
    return new Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
                 child:
                 Stack(
                  children: <Widget>[
                    Material(
                    borderRadius: new BorderRadius.circular(4.0),
                     elevation: 2.0,
                     child: new Image.network(
                'https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/roast-turkey-pho-ck.jpg?itok=Vf6k6W0d',
                    fit: BoxFit.cover,
                  width: 167.0,
                height: 175.0,),
                 ),
                       Center(child: Text("someText")),
                            ],
                      ),
            ),
                  
            Padding(
                    padding: EdgeInsets.all(10.0),
                    child:
                     Material(
                   borderRadius: new BorderRadius.circular(4.0),
                   elevation: 2.0,
                   
       
                     child: new Image.network(
                     'https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/roast-turkey-pho-ck.jpg?itok=Vf6k6W0d',
                     fit: BoxFit.cover,
                       width: 167.0,
                         height: 175.0,),
       ),),
       ]);

}


_buildRow2() {
    return new Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
                 child:
                  Material(
                    borderRadius: new BorderRadius.circular(4.0),
                     elevation: 2.0,
      
                     child: new Image.network(
                'https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/roast-turkey-pho-ck.jpg?itok=Vf6k6W0d',
                    fit: BoxFit.cover,
                  width: 167.0,
                height: 175.0,),
                 ),),
            Padding(
                    padding: EdgeInsets.all(10.0),
                    child:
                     Material(
                   borderRadius: new BorderRadius.circular(4.0),
                   elevation: 2.0,
       
                     child: new Image.network(
                     'https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/roast-turkey-pho-ck.jpg?itok=Vf6k6W0d',
                     fit: BoxFit.cover,
                       width: 167.0,
                         height: 175.0,),
       ),),
       ]);

}

