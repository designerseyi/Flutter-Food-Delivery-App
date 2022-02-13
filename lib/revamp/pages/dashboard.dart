import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/common/main_drawer.dart';
import 'package:foodie/revamp/model/menu_category.dart';
import 'package:foodie/revamp/model/product.dart';
import 'package:foodie/revamp/model/resturant.dart';
import 'package:foodie/revamp/pages/restaurantpage.dart';
import 'package:foodie/revamp/styles/colors.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(

        iconTheme: IconThemeData(color:primaryColor),
        title: Center(child: Text("Fudap", style: TextStyle(fontSize:34 ,fontWeight: FontWeight.w600,color:Colors.black),)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:8.0,right: 16),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/userboy.png'),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body:

      SingleChildScrollView(
        child: Stack(

          children: <Widget>[


               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[

                   Padding(
                     padding: const EdgeInsets.only(top:36.0,bottom:16),
                     child: Center(child: Text("What you want for lunch today?",style: TextStyle(fontSize:22,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w600),)),
                   ),

                    Padding(
                      padding: const EdgeInsets.only(left:28.0, right: 28),
                      child: Row(

                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child:  Material(
                                borderRadius:  BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                elevation: 20,
                                child: TextField(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:  BorderSide(color: Colors.transparent,),
                                        borderRadius:  BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderSide:  BorderSide(color: Colors.transparent,),
                                        borderRadius:  BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),

                                      filled: true,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "Search here",
                                      fillColor: Colors.white),
                                ),
                              ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Material(
                              elevation: 10,
                              borderRadius:  BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: Container(
                                width: 60,

                                child: FlatButton(

                                      splashColor: Colors.red,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    color: Colors.white,
                                    onPressed: (){},
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:14.0, bottom: 14.0),
                                      child:Icon(Icons.tune,color:primaryColor,size: 32,),
                                    )),
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),


                   Padding(
                     padding: const EdgeInsets.only(top:36,left:30),
                     child: Text("Todays best deals",style: TextStyle(fontSize:22,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w600),),
                   ),





                   Padding(
                     padding: const EdgeInsets.only(top:16.0),
                     child: Container(
                       height: 180,

                       child: ListView(
                         scrollDirection: Axis.horizontal,
                         children: <Widget>[
                           Deals(),
                           Deals(),
                           Deals(),

                         ],
                       ),
                     ),
                   ),


                   Padding(
                     padding: const EdgeInsets.only(top:36,left:30),
                     child: Text("Popular resturants",style: TextStyle(fontSize:22,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w600),),
                   ),

                  
                  StreamBuilder(
                    stream: Firestore.instance.collection('myres').snapshots(),
                    
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){

                            if(snapshot.hasData){

                               

                              // for( DocumentSnapshot document  in snapshot.data.documents ){
                              //      Restaurant r =Restaurant.fromMap(document.data);
                              //     // print('${document.data}');
                              //       Product menuCat = Product.fromMap(r.products[0]);
                              //     print('${menuCat.name}');
                              // }
                             

                                return Column(
                                  children: snapshot.data.documents.map((DocumentSnapshot document) {

                                        Restaurant res =Restaurant.fromMap(document.data);


                                    return Restaurants(res);
                                  }).toList(),
                                );


                                // snapshot.data.documents.map((DocumentSnapshot document) {

                                //         Restaurant res =Restaurant.fromMap(document.data);


                                //     return Restaurants(res);
                                // });
                            

                                
                                //  return Container();
                            }

                            else{

                              return Container();
                            }
                
                    }),

                 ],


             ),


//

          ],

        ),
      ),



    );
  }


Widget Restaurants(Restaurant restaurant){

  double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
 return Padding(
                     padding: const EdgeInsets.only(left: 16, right: 16,top: 16),
                     child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>RestaurantPage(restaurant)));
                          },
                          child: Container(
                         height: 100,
                         width: screenWidth,
                         child: Card(
                           child: Row(mainAxisAlignment: MainAxisAlignment.start,

                                    children: <Widget>[
                                        Placeholder(fallbackWidth: 100,),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0,top:16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("${restaurant.details.name}",style: TextStyle(fontSize:20,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w600)),
                                               
                                               Padding(
                                                 padding: const EdgeInsets.only(top:8.0),
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                   children: <Widget>[

                                                     Icon(Icons.local_dining),
                                                     Text("${restaurant.details.address}",style: TextStyle(fontSize:18,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w400)),
                                                   ],
                                                 ),
                                               ),
                                               
                                            ],

                                          ),
                                        )

                                    ],
                           
                           ),
                         ),
                       ),
                     ),
                   );
}


}



Widget Deals(){

  return
    Stack(
      children: <Widget>[

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 220,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              color: Colors.red,
              child: Column(
                children: <Widget>[
                  Text("hello")
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top:-2,
          left: 18,
          child: Material(
            elevation: 20,
            color: Colors.transparent,

            child: Container(
              width: 180,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
//                                         child:
//                                         Image.asset("assets/images/moneysaving.jpg",fit: BoxFit.cover, )
            ),
          ),
        ),
      ],
    );
}
