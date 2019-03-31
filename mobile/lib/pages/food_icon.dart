class Food_icon {

  //homepage card parameters
  String name;
  String imagePath;
  String rest;
  double cost;
  List<String> ingredients;

<<<<<<< HEAD
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
=======
//commented out for now bfr integration 
/*
  double profit; 
  double sust; 
  double investIndex; //this is an avg of profit and sust

  //detailpage card parameters
  bool dishProfitColor; 
  List<double> dishProfitData; 
  bool dishSustColor;
  List<double> dishSustData;
  List<double> dishBuysColor;
  List<double> dishBuysData;  
  
  //detailpage for ingredients
  List<Ingredient> ingredientList; 

  */


  Food_icon(this.name,this.imagePath, this.rest, this.cost, this.ingredients);
}

class Ingredient {
  String ingredientName; 
  bool color; 
  List<double> data; 

  Ingredient(this.ingredientName, this.color, this.data);
>>>>>>> 4b00476cbc3ae961e6b2d973ec4d58cc2ef68932
}