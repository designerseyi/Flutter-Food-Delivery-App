
import 'package:foodie/revamp/model/menu_category.dart';
import 'package:foodie/revamp/model/menu_items.dart';


class Restaurant{


  Details _details;
  List _products;
  List _menu_categories;
  

  Restaurant(this._details,this._products,this._menu_categories);

  Details get details => this._details;
  List get products => this._products;
  List get menu_categories => this._menu_categories;



  Map<String,dynamic> tomap(){

    Map<String,dynamic> map = new Map<String,dynamic>();

    map['details'] = this._details;
    map['products'] = this.products;
    map['menu_categories'] = this._menu_categories;


    return map;

  }


  Restaurant.fromMap(Map<String,dynamic> map){

    this._details = Details.fromMap(map['details']);

    this._products = convert_products(map['products']);
    this._menu_categories = convert_menuCat(map['menu_categories']);


    
     
  }

  List<Map<String, dynamic>> convert_menuCat(List menuCats){


       List<Map<String, dynamic>> menuCategories = List<Map<String, dynamic>>();

     menuCats.forEach((map){

                     //conver categories to map<string,dynamic>
                      Map<String, dynamic> catMap = Map.from(map.map((key, value) {
                        //dynamic values = String.from(value);
                        return MapEntry(
                            key.toString(),
                            value);
                    }));

                  menuCategories.add(catMap);

                 });

                 return menuCategories;

  }


   List<Map<String, dynamic>> convert_products(List mproducts){


       List<Map<String, dynamic>> newProducts = List<Map<String, dynamic>>();
           
     mproducts.forEach((map){

                     //conver categories to map<string,dynamic>
                      Map<String, dynamic> productMap = Map.from(map.map((key, value) {
                        //dynamic values = String.from(value);
                        return MapEntry(
                            key.toString(),
                            value);
                    }));

                  newProducts.add(productMap);

                 });

                 return newProducts;

  }



}


class Details{


  String _name;
  String _address;
  String _city;
  String _res;
  
  

  Details(this._name,this._address,this._city,this._res);

  String get name => this._name;
  String get address => this._address;
  String get city => this._city;
  String get res => this._res;
 
 



  Map<String,dynamic> tomap(){

    Map<String,dynamic> map = new Map<String,dynamic>();

    map['name'] = this._name;
    map['address'] = this._address;
    map['city'] = this._city;
    map['res'] = this._res;
    


    return map;

  }


  Details.fromMap(Map<dynamic,dynamic> map){

    this._name = map['name'];
    this._address =map['address'];
     this._city = map['city'];
    this._res =map['res'];
   
     
  }


}