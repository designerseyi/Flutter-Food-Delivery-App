// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie/revamp/bloc/fooditem_and_cart_counter_bloc.dart';
// import 'package:foodie/revamp/common/build_list_of_food_items.dart';
// import 'package:foodie/revamp/helperclass/food_item_wrapper.dart';
// import 'package:foodie/revamp/model/FoodChoice.dart';
// import 'package:foodie/revamp/model/food_category.dart';
// import 'package:foodie/revamp/model/food_item.dart';
// import 'package:foodie/revamp/model/food_type.dart';
// import 'package:foodie/revamp/model/foodcombo.dart';
// import 'package:foodie/revamp/model/resturant.dart';
// import 'package:foodie/revamp/styles/colors.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// import 'cart.dart';
// class ResturantMenu extends StatefulWidget {
//   @override
//   _ResturantMenuState createState() => _ResturantMenuState();
// }

// class _ResturantMenuState extends State<ResturantMenu> {


//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;


//     return  Scaffold(

//         backgroundColor: backgroundColor,

//         body:  Column(
//           children: <Widget>[

//             Padding(
//               padding: const EdgeInsets.only(top:44.0),
//               child: Topbar(),
//             ),


//          Expanded(
//            flex: 2,
//             child: Container(
//               child: ListView(
//                 children: resturant1.foodCategories.map((foodcategory){
//                  return Padding(
//                    padding: const EdgeInsets.only(left:16.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,

//                      children: <Widget>[

//                        Text(foodcategory.name,style:TextStyle(fontSize:24 ,fontWeight: FontWeight.w600),),

//                        buildFoodItems(generalFooditems:foodcategory.generalfoodItem)

//                      ],

//                    ),
//                  );

//                 }).toList()
//               ),
//             ),
//           )


//           ],
//         ),





//       floatingActionButton: FloatingActionButton(onPressed: (){

//   Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
// },

//   backgroundColor: primaryColor,
//     child:

//            Icon(FontAwesomeIcons.shoppingBasket),


// ),

//     );
//   }
// }


// Widget Topbar() {

//   final  FoodItemAndCartCounterBloc fooditemCartCounterBloc = BlocProvider.getBloc<FoodItemAndCartCounterBloc>();
//   return Row(

//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[

//       Padding(
//         padding: const EdgeInsets.only(left:16.0),
//         child: Icon(Icons.arrow_back),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 20),
//         child: Column(
//           children: <Widget>[
//             Text('Ostrich', style: TextStyle(fontSize:34 ,fontWeight: FontWeight.w600),),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[

//                 Icon(Icons.access_time),

//                 Padding(
//                   padding: const EdgeInsets.only(left:8.0),
//                   child: Text("13:00 - 6:00"),
//                 ),



//               ],
//             ),
//             StreamBuilder(
//               stream: fooditemCartCounterBloc.getcartList,
//               builder: (context, snapshot) {
//                 List<FoodItemWrapper> foodItemwrapper = snapshot.data;
//                 int length = foodItemwrapper != null ? foodItemwrapper.length : 0;
//                 return Text(length.toString());
//               }

//             ),

//           ],
//         ),
//       ),

//       Padding(
//         padding: const EdgeInsets.only(right:16.0),
//         child: Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(100)),
//               color: Colors.white
//           ),

//         ),
//       ),

//     ],
//   );

// }





// //Future<bool> ModalKnow (context,double swidth, FoodItem fooditem){
// //
// //
// //  return showDialog(
// //      context: context,
// //      barrierDismissible: true, // false = user must tap button, true = tap outside dialog
// //      builder: (BuildContext dialogContext)
// //      {
// //        return Dialog(
// //          shape: RoundedRectangleBorder(
// //              borderRadius: BorderRadius.all(Radius.circular(20))),
// //
// //          child: Container(
// //            height: 300,
// //            width: swidth,
// //            child: Padding(
// //              padding: const EdgeInsets.only(left:16.0,right: 16),
// //              child: ListView(
// //                children: <Widget>[
// //                  Padding(
// //                    padding: const EdgeInsets.only(top:8.0),
// //                    child: Text("Food Extras", style: H4TextStyle,),
// //                  ),
// //                  SizedBox(height: 24,),
// ////                  _buildExtras(fooditem),
// ////
// ////
// ////                  _buildModalPrice(fooditem),
// //                ],
// //
// //              ),
// //            ),
// //          ),
// //        );
// //      });
// //
// //
// //
// //
// //}






