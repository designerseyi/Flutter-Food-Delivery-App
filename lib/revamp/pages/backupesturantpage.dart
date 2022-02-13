// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie/revamp/bloc/cartBloc.dart';
// import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
// import 'package:foodie/revamp/common/product_variation_dialog.dart';
// import 'package:foodie/revamp/helperclass/cart_item_wrapper.dart';
// import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
// import 'package:foodie/revamp/model/menu_category.dart';
// import 'package:foodie/revamp/model/menu_items.dart';
// import 'package:foodie/revamp/model/product.dart';
// import 'package:foodie/revamp/model/product_variation.dart';
// import 'package:foodie/revamp/model/resturant.dart';
// import 'package:foodie/revamp/pages/testfirestore.dart';
// import 'package:foodie/revamp/styles/colors.dart';
// import 'package:scrollable_bottom_sheet/scrollable_bottom_sheet.dart';
// import 'package:scrollable_bottom_sheet/scrollable_controller.dart';


// class RestaurantPage extends StatefulWidget {

//   Restaurant restaurant;
//   RestaurantPage(this.restaurant);
//   // String 
//   @override
//   _RestaurantPageState createState() => _RestaurantPageState();
// }

// class _RestaurantPageState extends State<RestaurantPage> {

//   // double
//   double padding = 16.0;
//   double radius = 16.0;

//   double positionY = 0.0;

//   // string
//   String _image = "assets/0107/image.png";
//   String _currentState = "min";

//   // bool
//   bool isBackSide = false;

//   // controller
//   final controller = ScrollableController();

//    final  CartBloc cartBloc =  BlocProvider.getBloc<CartBloc>();


//   @override
//   Widget build(BuildContext context) {
    

//     //  List<Map<String,dynamic>> menuCategories;
//     // List<Map<String, dynamic>> newProducts;
//     List<Product> productList =  List<Product>(); 
//     List<MenuItem> menuitems;

//       return Scaffold(
//               body: Stack(
//                 children: <Widget>[

//                      CustomScrollView(
//                   slivers: <Widget>[
//                     SliverAppBar(
                    
//                         leading:  GestureDetector(
//                           onTap: (){

//                             Navigator.push(context, MaterialPageRoute(builder: (context) => TestFirestore()));
//                           },

//                          child: GestureDetector(
//                            onTap: (){
//                               // ErrorDialog (context);
//                               Navigator.pop(context);
//                            },
//                            child: Icon(Icons.chevron_left))
//                         ),
//                         title: Text("${widget.restaurant.details.name}", ),
//                         actions: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top:8.0,right: 16),
//                     child: CircleAvatar(
//                         radius: 20,
//                         backgroundColor: Colors.transparent,
//                         backgroundImage: AssetImage('assets/images/userboy.png'),
//                     ),
//                   ),
//                 ],
//                         //title: Text('Fixed title', style: TextStyle(color: Colors.black),),
//                         pinned: true,
//                         centerTitle: false,
//                         expandedHeight: 200,
//                         flexibleSpace: FlexibleSpaceBar(
//                           //title:  Container( height: 50, color: Colors.white, child: Column( children: <Widget>[Text('Ostrich Resturant', style: TextStyle(color: Colors.black),), Text(' Resturant', style: TextStyle(color: Colors.black),)],),),
//                           background: Image.asset("assets/images/moneysaving.jpg",fit: BoxFit.cover,colorBlendMode: BlendMode.multiply,color: Colors.black, ),
                        
//                         ),
                        
//                     ),

   
           
               
                 
                 
        
//                SliverFillRemaining(
//                   child:StreamBuilder<QuerySnapshot>(
//                  stream: Firestore.instance.collection('MenuItems').where('res',isEqualTo: 'captaincook')
//             .snapshots(),
//                  builder: (context,  snapshot) {
//                    if(snapshot.hasData){
//                         menuitems = List<MenuItem>();
//                  // print(' menuItem:${data.documents}');
//                    snapshot.data.documents.forEach((doc){
//                    // print(' menuItem:${doc.data}');
//                     //list to store all menu item for a restaurant
                   
//                     //convert map to Menuitem
//                     MenuItem item = MenuItem.fromMap(doc.data);
//                    // print('Item : ${item.name}');
                        
//                         // if(item.res == widget.restaurant.details.res){

//                         //   menuitems.add(item);
//                         // }


//                         if(item.res == 'captaincook'){

//                           menuitems.add(item);
//                         }

//                    });
              
//                    widget.restaurant.products.forEach((newMap){
//                         Product p = Product.fromMap(newMap);
//                        productList.add(p);
//                    });  

//                    return ListView.builder(
//                             itemCount: widget.restaurant.menu_categories.length ,
//                             itemBuilder: (context,position){


//                                       MenuCategory menuCat = MenuCategory.fromMap(widget.restaurant.menu_categories[position]);  
//                                       // convert value of Map<String,dynamic> to Product
//                                       //Product mainProduct = Product.fromMap(newProducts[position]);
//                                       List<String> mlistFood= List.castFrom(menuCat.listFood);

//                                         return Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,

//                                                   children: <Widget>[

//                                                   Text(menuCat.name,style:TextStyle(fontSize:24 ,fontWeight: FontWeight.w600),),

//                                                    buildFoodProduct(productList,mlistFood,menuitems),

//                                                 ],

//                                               );


//                             },
//                     );

//                    }
//                    // end of if
//                    else{

//                      return Center(child: CircularProgressIndicator(),);
//                    }
                   
                  
//                  }
//                )

//                 ),


            

//             ],
//         ),

//              bottomSheet(),

//                 ],
//               ) 




         
             
//       );

//   }

// // END OF WIDGET

// Widget  buildFoodProduct(List<Product> Products,List Productid,List<MenuItem> menuitems)  {


//   //FoodItemWrapper foodItemWrapper;
//   double swidth;
 
//     swidth = MediaQuery.of(context).size.width;

//    return  Padding(

//      key: GlobalKey(),
//      padding: const EdgeInsets.only(top: 8,bottom: 8),
//      child: Column(
//          children: Productid.map((productid){

//                     return Padding(
//                            padding: const EdgeInsets.only(bottom:16.0),
//                            child: 
//                                 GestureDetector(
//                                   onTap: (){
//                                         onProductTap(Products,productid,menuitems);


//                                   },


//                                  child: FittedBox(
//                                         fit: BoxFit.cover,
//                                         child: Container(
//                                           width: swidth,
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius: BorderRadius.all(Radius.circular(8))
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.only(top:8.0,left: 12.0,),
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: <Widget>[

//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top:8.0,),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: <Widget>[
//                                                       Text(Products[int.parse(productid)].name),
//                                                       Padding(
//                                                         padding: const EdgeInsets.only(right:16.0),
//                                                         child: StreamBuilder(
//                                                           stream: cartBloc.getCartList,
//                                                           builder: (context, snapshot) {
//                                                             if(snapshot.hasData){
//                                                                   int cartItems =0;
//                                                             for( CartItemWrapper cartItemWrapper in snapshot.data){
//                                                               if(cartItemWrapper.product.name == Products[int.parse(productid)].name ){
//                                                                cartItems = cartItems + cartItemWrapper.quantity;
//                                                               }

//                                                             }
//                                                             return cartItems > 0 ?  Container(
//                                                                   decoration: BoxDecoration(
//                                                                     color:primaryColor,
//                                                                     borderRadius: BorderRadius.circular(5)
//                                                                   ),
//                                                                   child: Padding(
//                                                                     padding: EdgeInsets.all(8),
//                                                                     child: Text('$cartItems',style: TextStyle(color:Colors.white),),),
//                                                                 ): Container();
//                                                             }
//                                                             else{
//                                                               return Container();
//                                                             }
                                                            
//                                                           }
//                                                         )
//                                                       ),

//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top:8.0),
//                                                   child: Text(Products[int.parse(productid)].description ?? "description"),
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top:8.0,bottom: 12.0),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: <Widget>[
//                                                       //todo work on the int.parse for index of list
//                                                       Products[int.parse(productid)].price.isNotEmpty ?Text(Products[int.parse(productid)].price??"ooo"): Text(""),
//                                                       Padding(
//                                                         padding: const EdgeInsets.only(right:16.0),
//                                                         child: Icon(Icons.add,color: primaryColor,),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ) ,
//                                         ),
//                                       ),
//                               ),


//                     );


//          }).toList()
//      ),
//    );

  
// }




// //on product tap


//   void onProductTap(List<Product> mProducts, String mProductid,List<MenuItem> menuitems){

//       int convertedPid = int.parse(mProductid);
//       Product product = mProducts[convertedPid];

//       // first convert product variation Map<dynamic,dynamic> to a productvariation t ype
      
//         ProductVariation productVariation = ProductVariation.fromMap(product.product_variation);
//         //print('product choice:${productVariation.choice }');

//       // check if the productvariation(food item) has extras like tooppings and
//       // choice , if it has any we will build the view on another screen
//       // if it doesnt we just add the item to cart

//         if(productVariation.choice.isNotEmpty || productVariation.toppings.isEmpty || productVariation.variation.isEmpty)
//         {
//              // print('a variation is available');

//                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductVariationDialog(productVariation,product.name,menuitems,product),
//                        fullscreenDialog: true
//                    ), );
//         }
      
//         else{
//               // print('no variation is available');
//         }



//   }


  
// Widget bottomSheet(){

//   List list = List();
  
  
// final  FoodItemAndCartCounterBloc fooditemCartCounterBloc = BlocProvider.getBloc<FoodItemAndCartCounterBloc>();
//    double  screenHeight = MediaQuery.of(context).size.height;
//       return Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: ScrollableBottomSheet(
//                 autoPop: false,
//                 snapBelow: true,
//                 snapAbove: true,
//                 scrollTo: ScrollState.minimum,
//                 minimumHeight: 55.0,
//                 halfHeight: 380.0,
//                 controller: controller,
//                 callback: (state){
//                   setState(() {
//                     if(state == ScrollState.minimum){
//                       _currentState = "min";
//                       print("_currentState = $_currentState");

//                     }
//                     if(state == ScrollState.half){
//                       _currentState = "half";
//                       print("_currentState = $_currentState");
//                     }
//                     if(state == ScrollState.full){
//                       _currentState = "full";
//                       print("_currentState = $_currentState");
//                     }
//                   });
//                 },

                
//                 child: Material(
//                     elevation: 60,
//                     color: Colors.pink,
//                     borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(radius *2),
//                           topRight: Radius.circular(radius *2),
//                         ),
//                     shadowColor: Colors.black,

//                                   child: Container(
//                      margin:EdgeInsets.only(top:2.0),
//                       padding: EdgeInsets.only(top: padding, left: padding, right: padding),
//                       height: screenHeight - 30.0,
//                       decoration: BoxDecoration(
             
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(radius *2),
//                           topRight: Radius.circular(radius *2),
//                         ),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           // text: today

                          
           
//                           Padding(
                            
//                   padding: const EdgeInsets.only(left: 8,right: 8),
//                   child: Row(
                   
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
//                     children: <Widget>[


                      
//                          Text("Cart",
//                               style: TextStyle(
//                                   fontSize: 20.0,
//                                    color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                               ),
//                                ),


//                          StreamBuilder(
//                           stream: cartBloc.getCartList,
//                           builder: (context, snapshot) {
//                             // List<FoodItemWrapper> foodItemwrapper = snapshot.data;
//                             int length = snapshot.data != null ? snapshot.data.length : 0;
//                             return Text("${length.toString()} Item(s)", 
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                    color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                               ),);
//                           }

//                         ),
                                 
                      



//                         StreamBuilder(
//                           stream: cartBloc.getCartList,

//                           builder: (context, snapshot) {

//                               if(snapshot !=null){
//                                   int subtotal = 0;
//                               for(CartItemWrapper cartitemwrapper in snapshot.data){

//                                 subtotal = subtotal + cartitemwrapper.cart_price;

//                               }

//                             return Text("#$subtotal",
//                                   style: TextStyle(
//                                       fontSize: 20.0,
//                                        color: Colors.black,
//                                      fontWeight: FontWeight.w500,
//                                   ),
//                                    );
//                               }
//                               else{
//                                 return Text('');
//                               }
                            
//                           }
                          

                      

            
//                         ),
                      
                      



                     



                  

//                   ],),
//                           ),

                          
//                           // list view
//                           Flexible(
//                   fit: FlexFit.tight,
//                   child: Cart(),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ),
//             ),
//           );

// }


  




//  Widget Cart() {

//     // List<FoodItemWrapper> fooditemwrapper;
// //    fooditembloc.getSubTotal(list_of_fooditemwrapper);

//     return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top:32.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(left:16.0,right: 16,top: 8),


//               child: StreamBuilder(
//                   stream: cartBloc.getCartList ,
//                  builder: (context, snapshot){
//                     if(snapshot.data.lenght >= 1){
//                         print(' fuck: ${snapshot.data}');
//                         return Text('hhe');
//                       // fooditemwrapper = snapshot.data;
//                         // return _cartItem(snapshot.data);
//                     }
//                     else{
//                       return Container();
//                     }

//                  }),
                      
//                     ),
                



//                   Column(
//                     children: <Widget>[
//                       Padding(
//             padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('SubTotal:'),

//                 StreamBuilder(
//                     stream: cartBloc.getCartList ,
//                     builder: (context, snapshot){



//                       if(snapshot.data != null){
//                         int subtotal = 0;
//                         for(CartItemWrapper cartitemwrapper in snapshot.data){

//                           subtotal = subtotal + cartitemwrapper.cart_price;

//                         }

//                         return Text(subtotal.toString());
//                       }
//                       else{
//                         return Container();
//                       }

//                     }),



//               ],
//             ),
//                       ),

//                       Padding(
//             padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 2),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('Delivey Fee'),
//                 Text('3oo3oi3'),
//               ],
//             ),
//                       ),

//                       Padding(
//             padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('Total'),
//                 Text('330'),
//               ],
//             ),
//                       ),

//                       Padding(
//             padding: const EdgeInsets.only(bottom:8.0,top:20),
//             child: FlatButton(
//               padding: EdgeInsets.only(left: 16,right: 16 , top:12,bottom: 12),
//               onPressed: (){}, child: Text("PROCEED TO CHECKOUT",style:TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600),),color: greenColor,),
//                       )
//                     ],
//                   ),

// //            _buildModalPrice(widget.fi),
//                 ],
//               ),
//           ),
//     );

//   }

  

// Widget _getCartFoodItem(CartItemWrapper cartItemWrapper ,int position){

    
//       return Padding(
//         padding: const EdgeInsets.only(top:8.0, bottom:8.0),
//         child: Column(
//         children: <Widget>[


//             Builder(builder: (context){
//               // fooditembloc.addSubTotal(subfooditemwrapper);

//               if( cartItemWrapper.productChoice!=null||cartItemWrapper.productToppings !=null || cartItemWrapper.productVariation !=null){

//               //  FoodItemAndCartCounterBloc extrablock = FoodItemAndCartCounterBloc();
//               //   int extra_total;

//                 return Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(cartItemWrapper.product.name, style: TextStyle(fontSize:22),),

//                         StreamBuilder(
//                           stream:cartBloc.getCartList ,
//                           builder: (context, snapshot) {
                            
//                               if(snapshot.hasData){
//                                   CartItemWrapper cartItemWrapper = snapshot.data[position];
                            

//                             return Text("#${cartItemWrapper.cart_price}", style: TextStyle(fontSize:22),);
//                               }
//                               else{
//                                 return CircularProgressIndicator();
//                               }
                              


//                           })

//                       ],
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.only(top:8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[

//                           GestureDetector(
//                               onTap: (){
//                                 cartBloc.removeFromList(cartItemWrapper,position);




//                                   },
//                               child: Text("X Remove")),


//                           Row(

//                             children: <Widget>[

//                               GestureDetector(
//                                   onTap: (){
//                                     double unitPrice = cartItemWrapper.cart_price/cartItemWrapper.quantity ;
//                                     cartItemWrapper.quantity = cartItemWrapper.quantity + 1;
//                                     cartItemWrapper.cart_price = unitPrice.toInt() * cartItemWrapper.quantity;

//                                     cartBloc.updateList(cartItemWrapper, position);
                                   
                                    
//                                   },
//                                   child: Icon(Icons.add_box, color: primaryColor,size: 30,)),
//                                   Padding(
//                                       padding: const EdgeInsets.only(left:8.0,right: 8.0),
//                                       child: Text(cartItemWrapper.quantity.toString(), style: TextStyle(fontSize: 18),),
//                                       ),
// //                             StreamBuilder(
// //                                 stream: extrablock.getCount,
// //                                 initialData: subfooditemwrapper.foodItem.quantity,
// //                                 builder: (context,snapshot){
// //                                   temp_quantity = snapshot.data;
// // //
// //                                   return Padding(
// //                                     padding: const EdgeInsets.only(left:8.0,right: 8.0),
// //                                     child: Text(subfooditemwrapper.foodItem.quantity.toString(), style: TextStyle(fontSize: 18),),
// //                                   );
// //                                 }),
//                               GestureDetector(
//                                   onTap: (){

//                                     double unitPrice = cartItemWrapper.cart_price/cartItemWrapper.quantity;
//                                    cartItemWrapper.quantity = cartItemWrapper.quantity - 1;
//                                     cartItemWrapper.cart_price = unitPrice.toInt() * cartItemWrapper.quantity;

//                                     cartBloc.updateList(cartItemWrapper, position);


//                                   },
//                                   child: Icon(Icons.indeterminate_check_box, color: primaryColor,size: 30,)),


//                             ],
//                           ),


//                         ],
//                       ),
//                     ),
//                   ],
//                 );


//               }


//               else {

//                 return Padding(
//                   padding: const EdgeInsets.only(top:8.0,bottom:16),
//                   child: Column(

//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text(cartItemWrapper.product.name, style: TextStyle(fontSize:22),),

//                           StreamBuilder(
//                               stream:cartBloc.getCartList ,
//                           initialData: cartItemWrapper.quantity,
//                           builder: (context, snapshot) {
                            
//                               CartItemWrapper subcartItemWrapper = snapshot.data[position];
                            

//                             return Text("#${subcartItemWrapper.cart_price}", style: TextStyle(fontSize:22),);


//                               }
//                           )

//                         ],
//                       ),

//                       Padding(
//                         padding: const EdgeInsets.only(top:8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[

//                             GestureDetector(
//                                 onTap:(){
//                                       cartBloc.removeFromList(cartItemWrapper,position);
//                                       },
//                                 child: Text("X Remove")),


//                             Row(

//                               children: <Widget>[

//                                 GestureDetector(
//                                     onTap: (){
                                   
//                                     cartItemWrapper.quantity = cartItemWrapper.quantity + 1;
//                                     cartItemWrapper.cart_price = int.parse(cartItemWrapper.product.price) * cartItemWrapper.quantity; 
//                                     cartBloc.updateList(cartItemWrapper, position);


//                                     },
//                                     child: Icon(Icons.add_box, color: primaryColor,size: 30,)),
//                                 // StreamBuilder(
//                                 //     stream: block.getCount,
//                                 //     initialData: subfooditemwrapper.foodItem.quantity,
//                                 //     builder: (context,snapshot){
//                                 //       temp_quantity = snapshot.data;
//                                 //       return Padding(
//                                 //         padding: const EdgeInsets.only(left:8.0,right: 8.0),
//                                 //         child: Text(subfooditemwrapper.foodItem.quantity.toString(), style: TextStyle(fontSize: 18),),
//                                 //       );
//                                 //     }),

//                                 Padding(
//                                         padding: const EdgeInsets.only(left:8.0,right: 8.0),
//                                         child: Text(cartItemWrapper.quantity.toString(), style: TextStyle(fontSize: 18),),
//                                       ),
//                                 GestureDetector(
//                                     onTap: (){
//                                       cartItemWrapper.quantity = cartItemWrapper.quantity - 1;
//                                      cartItemWrapper.cart_price = int.parse(cartItemWrapper.product.price) * cartItemWrapper.quantity;
//                                     cartBloc.updateList(cartItemWrapper, position);


//                                     },
//                                     child: Icon(Icons.indeterminate_check_box, color: primaryColor,size: 30,)),


//                               ],
//                             ),


//                           ],
//                         ),
//                       ),


//                       Padding(
//                         padding: const EdgeInsets.only(top:12.0,),
//                         child: Divider(height:2,color: Colors.black,),
//                       ),
//                     ],
//                   ),
//                 );

//               }


//             }),


//     ],

//     ),
//       );


// }




// Widget _cartItem(List<CartItemWrapper> listCartItems){


//     return ListView.builder(
//            padding: EdgeInsets.zero,
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//           itemCount: listCartItems.length,
//           itemBuilder: (context,position){

//            return _getCartFoodItem(listCartItems[position],position)?? Text("No item in cart");

//           },

//       );


//   }


//   Future<bool> ErrorDialog (context) {
//   return showDialog(
//       context: context,
//       barrierDismissible: true,
//       // false = user must tap button, true = tap outside dialog
//       builder: (BuildContext dialogContext) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(7))),

//           child: Container(
//             height: 150,
//             width: 300,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16.0, right: 16,top: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Center(
//                     child: Text("Do you want to leave ?", style:Theme
//                         .of(context)
//                         .textTheme
//                         .title,),
//                   ),
//                   Padding(
//                       padding: EdgeInsets.only(left:16.0,right: 16.0, top:8),
//                     child: Center(
//                       child: Text("If you leave this resturant your order will be canceled", style: Theme
//                           .of(context)
//                           .textTheme
//                           .body1,),
//                     ),
//                   ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           FlatButton(onPressed: null, child: Text('Yes')),
//                           FlatButton(onPressed: null, child: Text('No')),
                          
//                         ],
//                       )
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }






// }