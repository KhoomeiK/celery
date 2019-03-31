library my_prj.globals;

import 'food_icon.dart';
import 'category.dart';
import 'detail_graph.dart';
import 'chart.dart';
import 'profile.dart';

bool isLoggedIn = false;
bool isConnected = false;
bool canceled = false;

List<Category> three = [
  Category("Produce",
      "http://vanderbiltpoliticalreview.com/wp-content/uploads/iStock-589415708-808x454.jpg"),
  Category("Meat",
      "https://i.dietdoctor.com/wp-content/uploads/2019/01/Cut-red-meat-eating-by-80-percent-to-save-the-planet.jpg?auto=compress%2Cformat&w=1600&h=900&fit=crop"),
  Category("Utensils",
      "https://images-na.ssl-images-amazon.com/images/I/71dcDTS8diL._SX466_.jpg")
];
List<Food_icon> global = [
  Food_icon(
      "Pho",
      "https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/roast-turkey-pho-ck.jpg?itok=Vf6k6W0d",
      "Pho Ha",
      0.0,
      ["noodles", "meat", "MSG?"]),
  Food_icon(
      "Pizza",
      "https://upload.wikimedia.org/wikipedia/commons/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg",
      "",
      0.0,
      ["cheese", "flour", "water", "tomatoes"]),
  Food_icon(
      "Steak",
      "https://hips.hearstapps.com/vidthumb/images/delish-cajun-butter-steak-still006-1528495387.jpg",
      "",
      0.0,
      ["Beef", "A1 Sauce", "Butter", "Pepper"]),
  Food_icon(
      "Kung Pao",
      "https://img.taste.com.au/-7KlOnpq/taste/2018/02/kung-pao-chicken-taste-135078-1.jpg",
      "",
      0.0,
      ["Chicken", "Chili Pepper", "Soy Sauce", "Peanuts"])
];

List<Detail_graph> graphs = [
  Detail_graph(
    "Profit",
    [
      new TimeSeriesSales(new DateTime(2017, 1, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 2, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 3, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 4, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 5, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 6, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 7, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 8, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 9, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 11, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 12, 1), 75)
    ],
  ),
  Detail_graph(
    "Sustainability",
    [
      new TimeSeriesSales(new DateTime(2017, 1, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 2, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 3, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 4, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 5, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 6, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 7, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 8, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 9, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 11, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 12, 1), 75)
    ],
  ),
  Detail_graph(
    "Buys",
    [
      new TimeSeriesSales(new DateTime(2017, 1, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 2, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 3, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 4, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 5, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 6, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 7, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 8, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 9, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 11, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 12, 1), 75)
    ],
  )
];

List<Detail_graph> detail_graphs = [
  Detail_graph(
    "Tomatoes",
    [
      new TimeSeriesSales(new DateTime(2017, 1, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 2, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 3, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 4, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 5, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 6, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 7, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 8, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 9, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 11, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 12, 1), 75)
    ],
  ),
  Detail_graph(
    "Wheat",
    [
      new TimeSeriesSales(new DateTime(2017, 1, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 2, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 3, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 4, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 5, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 6, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 7, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 8, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 9, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 11, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 12, 1), 75)
    ],
  ),
  Detail_graph(
    "Meat",
    [
      new TimeSeriesSales(new DateTime(2017, 1, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 2, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 3, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 4, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 5, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 6, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 7, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 8, 1), 75),
      new TimeSeriesSales(new DateTime(2017, 9, 1), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 1), 25),
      new TimeSeriesSales(new DateTime(2017, 11, 1), 100),
      new TimeSeriesSales(new DateTime(2017, 12, 1), 75)
    ],
  )
];

String global_name;
String global_company;
List<String> recent = [];

List<Profile> produce = [
  Profile(
      "Sprouts",
      "https://about.sprouts.com/wp-content/uploads/2018/04/Supermarket-News.jpg",
      "6265576858",
      4.7),
  Profile(
      "99 Ranch",
      "https://www.99ranch.com/img/CMSImages/GrandOpeningPhotos.jpg",
      "6265523458",
      4.8),
  Profile(
      "Subway",
      "https://media-cdn.tripadvisor.com/media/photo-s/09/64/37/fe/subway.jpg",
      "7273092790",
      4.5)
];
List<Profile> meats = [
  Profile(
      "KFC",
      "https://www.joc.com/sites/default/files/field_feature_image/KFC_0.png",
      "6291827473",
      4.5),
  Profile(
      "Popeyes",
      "https://fortunedotcom.files.wordpress.com/2016/11/popeyes-chicken-businesswire.jpg",
      "6268718737",
      4.6)
];
List<Profile> utensils = [
  Profile(
      "Smith Flatware",
      "https://images.food52.com/tYiMtEUOw2v5iY1TUk9gKIDVtVo=/470x470/3cebd127-aaf3-46b0-a0c9-95bc3466e7cb--2018-0625_berghoff_leo-pink-utensil-set-skimmer-serving-ladle-tongs-pasta-spoon-serving-spoon_rocky-luten_005_1-.jpg",
      "7273639072",
      5.0)
];
List<Profile> chosenNigga = [];
Profile chosen;

checkChosen() {
  if (global_company == "Produce") chosenNigga = produce;
  if (global_company == "Meat") chosenNigga = meats;
  if (global_company == "Utensils") chosenNigga = utensils;
}

getPictureURL(String s) {
  for (int i = 0; i < global.length; i++) {
    if (s == three[i].name) {
      return three[i].imagePath;
    }
  }
}

getImageURL(String s) {
  for (int i = 0; i < global.length; i++) {
    if (s == global[i].name) {
      return global[i].imagePath;
    }
  }
}

getRest(String s) {
  for (int i = 0; i < global.length; i++) {
    if (s == global[i].name) {
      return global[i].rest;
    }
  }
}

getIngredients(String s) {
  for (int i = 0; i < global.length; i++) {
    if (s == global[i].name) {
      return global[i].ingredients;
    }
  }
}

String travelMode = "BICYCLING";
