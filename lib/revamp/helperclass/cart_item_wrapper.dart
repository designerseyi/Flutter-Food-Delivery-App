
import 'dart:core';
import 'package:foodie/revamp/model/product.dart';
import 'package:foodie/revamp/model/product_variation.dart';


class CartItemWrapper{

  int quantity =0;  
  int cart_price = 0;
  Product product;
  String productChoice;
  Variation productVariation;
  List productToppings;
  // bool onSelect = false;

  CartItemWrapper({this.product,this.cart_price,this.quantity,this.productChoice,this.productToppings,this.productVariation});


  // void setOnSelect(bool select){
  //       this.onSelect = select;
  //   }



}