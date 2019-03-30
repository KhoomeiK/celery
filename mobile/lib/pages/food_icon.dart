class Food_icon {
  String name;
  String imagePath;
  String rest;
  double cost;
  List<String> ingredients;

  /*
  bool invest;
  bool profitColor;   
  bool sustColor; 
  bool buyColor; 
  List<double> profitList;
  List<double> sustList;
  List<double> buyList; 
  List<Ingredient> ingredients
  */

  



  Food_icon(this.name,this.imagePath, this.rest, 
  this.cost, this.ingredients); /*, this.invest, 
  this.profitColor, this.sustColor, this.buyColor, 
  this.profitList, this.sustList, this.buyList);*/
}

class Ingredient {
  bool color; 
  List<double> data; 
}