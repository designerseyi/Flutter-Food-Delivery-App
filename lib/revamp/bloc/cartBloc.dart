
import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:foodie/revamp/helperclass/cart_item_wrapper.dart';
import 'package:foodie/revamp/model/menu_items.dart';
import 'package:rxdart/rxdart.dart';


import 'cartItemProvider.dart';
import 'cartListProvider.dart';

class CartBloc extends BlocBase{


// listCOntroller for  cartList
//  var listController = BehaviorSubject<List<FoodItem>>.seeded([]);
  var cartListController = BehaviorSubject<List<CartItemWrapper>>.seeded([]);

//  Stream<List<FoodItem>> get getcartList => listController.stream;
  Stream<List<CartItemWrapper>> get getCartList => cartListController.stream;

  //list Provider is an object that helps the stream
  // perform  some operation before passing data to the sink
  CartItemProvider listProvider = CartItemProvider();

//  Sink<List<FoodItem>> get listSink => listController.sink;
  Sink<List<CartItemWrapper>> get cartListSink => cartListController.sink;






  void addToList(CartItemWrapper cartItemWrapper){

    cartListSink.add(listProvider.addToList(cartItemWrapper));
  }

  void removeFromList(CartItemWrapper cartItemWrapper,position){

    cartListSink.add(listProvider.removeFromList(cartItemWrapper,position));
  }
  void updateList(CartItemWrapper cartItemWrapper,int position){

    cartListSink.add(listProvider.updateList(cartItemWrapper,position));
  }


  var checkstateController = BehaviorSubject<bool>();
  Stream get getcheckState => checkstateController.stream;

  void changeState(MenuItem provider,bool select){
    provider.setOnSelect(select);
    checkstateController.sink.add(provider.onSelect);
  }


  //for radio button state

  var RadioStateController = BehaviorSubject<int>();

  Stream<int> get getRadioState => RadioStateController.stream;

  Sink<int> get addRadioStateSink => RadioStateController.sink;
  

  int radioState;

// food extralink
  void addRadioState(int mRadio){

    radioState = mRadio;
    addRadioStateSink.add(radioState);
  }
 

 //choice radio state
  var choiceRadioStateController = BehaviorSubject<int>();

  Stream<int> get getchoiceRadioState => choiceRadioStateController.stream;

  Sink<int> get addchoiceRadioStateSink => choiceRadioStateController.sink;

  int choiceradioState;

// food extralink
  void addchoiceRadioState(int mRadio){

    choiceradioState = mRadio;
    addchoiceRadioStateSink.add(choiceradioState);
  }

  var tempCounterController = BehaviorSubject<int>.seeded(1);


  Stream<int> get  getTempCounterState => tempCounterController.stream;

  Sink<int> get addTempCounterSink => tempCounterController.sink;

  int tempCounterState;

// food extralink
  void addTempCounter(int mtempCounterState){

    tempCounterState = mtempCounterState;
    addTempCounterSink.add(tempCounterState);
  }

  void resetTempCounter(){
    addTempCounterSink.add(1);
  }


   //for radio button state

  var TotalPriceController = BehaviorSubject<int>();

  Stream<int> get getTotalPrice => TotalPriceController.stream;

  Sink<int> get addTotalPriceSink => TotalPriceController.sink;
  

  int totalPrice;

// food extralink
  void addTotal(int subCartPrice,int quantity){

    totalPrice = subCartPrice * quantity;
    addTotalPriceSink.add(totalPrice);
  }



  void dispose(){
    cartListController.close();
    checkstateController.close();
    RadioStateController.close();
    choiceRadioStateController.close();
    TotalPriceController.close();
  }




}

