library my_prj.globals;

import 'food_icon.dart';

bool isLoggedIn = false;
bool isConnected = false;
bool canceled = false;

List<Food_icon> global = [Food_icon("Pho", "https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/roast-turkey-pho-ck.jpg?itok=Vf6k6W0d", "Pho Ha", 0.0, ["noodles", "meat", "MSG?"]), Food_icon("Pizza", "https://upload.wikimedia.org/wikipedia/commons/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg", "", 0.0, ["cheese", "flour", "water", "tomatoes"]), Food_icon("Steak", "https://hips.hearstapps.com/vidthumb/images/delish-cajun-butter-steak-still006-1528495387.jpg", "", 0.0, ["Beef", "A1 Sauce", "Butter", "Pepper"]), Food_icon("Kung Pao", "https://img.taste.com.au/-7KlOnpq/taste/2018/02/kung-pao-chicken-taste-135078-1.jpg", "", 0.0, ["Chicken", "Chili Pepper", "Soy Sauce", "Peanuts"])];
String global_name;
List<String> recent = [];
getImageURL(String s){
  for (int i =0; i< global.length; i++){
    if (s == global[i].name)
    {
      return global[i].imagePath;
    }
  }
}

getRest(String s){
   for (int i =0; i< global.length; i++){
    if (s == global[i].name)
    {
      return global[i].rest;
    }
  }
}

getIngredients(String s){
   for (int i =0; i< global.length; i++){
    if (s == global[i].name)
    {
      return global[i].ingredients;
    }
  }
}
String travelMode = "BICYCLING";