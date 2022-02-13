
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/revamp/bloc/cartBloc.dart';
import 'package:foodie/revamp/helperclass/cart_item_wrapper.dart';
import 'package:foodie/revamp/model/foodcombo.dart';
import 'package:foodie/revamp/model/menu_items.dart';
import 'package:foodie/revamp/model/product.dart';
import 'package:foodie/revamp/model/product_variation.dart';
import 'package:foodie/revamp/styles/colors.dart';
import 'package:foodie/revamp/styles/text_styles.dart';


class ProductVariationDialog extends StatefulWidget {

  List<MenuItem> menuitems;
  ProductVariation productVariation;
  String productName;
  Product product;
  
  ProductVariationDialog(this.productVariation,this.productName,this.menuitems,this.product);

   _ProductVariationDialogState createState() => _ProductVariationDialogState();

}

class _ProductVariationDialogState extends State<ProductVariationDialog> {
   


   final  CartBloc globalcartBloc =  BlocProvider.getBloc<CartBloc>();
  final  CartBloc cartBloc =  CartBloc();
   CartItemWrapper cartItemWrapper;
   Variation mproductVariation;
   String mproductChoice;
   List productToppings = List();
   int mcartPrice,mtotalPrice = 0;
   //subCartprice is the total price of all selected options,
   //cart price is the total price * quantity/number of plates
   int foodVariationPrice = 0;
   int foodToppingsTotal =0;
   int subCartPrice = 0;
    int mquantity = 1;
   int groupVal =-1;

   @override
  void initState() {

    super.initState();
      // cartItemWrapper = CartItemWrapper(product:widget.product);
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      key: UniqueKey(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){

           

                Navigator.pop(context);

                },
              child: Icon(Icons.clear,size: 32,color: Colors.black,)),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),


        body: Column(
          children: <Widget>[
            Expanded(flex:2 ,
              child:Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),

                      child: Text(widget.productName, style: H4TextStyle,),
                    ),
                    SizedBox(height: 24,),
                     _buildFoodItem(widget.productVariation),
                    
                    


                  ],

                ),
              ),
            ),

            _buildModalPrice(),
          ],
        )




    );
  }

  Widget _buildFoodItem( ProductVariation productVariation){



    if(productVariation.choice.isNotEmpty && productVariation.toppings.isNotEmpty && productVariation.variation.isNotEmpty){
      return  Column(
        children: <Widget>[

          productVariation.variation.isNotEmpty ? _buildFoodVaraition(productVariation.variation): Text('') ,
          // _buildFoodType(foodCombo.list_of_foodType),
          SizedBox(height: 40,),

          productVariation.choice.isNotEmpty ? _buildFoodChoice(productVariation.choice): Text('') ,
          SizedBox(height: 40,),

          productVariation.toppings.isNotEmpty ?  _buildToppings(productVariation.toppings): Text('') ,

          // productVariation.toppings.isNotEmpty ? : ;
          // _buildToppings(foodCombo.list_of_foodToppings),



        ],

      );

    }


    

  }

  Widget _buildToppings( List foodToppings){

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:16.0),
        child: Text("YOUR EXTRAS", style: TextStyle(fontSize: 20),),
      ),

          Padding(
            padding: const EdgeInsets.only(left:10.0,top:12),
            child: Text(" Category", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
          ),

      for(int i =0 ; i< foodToppings.length;i++)
      Builder(builder: (context){
      return subExtra(foodToppings[i],i);
      })
      ],
      );


  


  }

  Widget subExtra(String foodtopping, int position){

    // Toppings foodtopping = Toppings.fromMap(topping);

     MenuItem item =  widget.menuitems.singleWhere(
            (menuitem)=> menuitem.name == foodtopping);

    print('my food toopings : $foodtopping');

    final  CartBloc toppingsBloc = CartBloc();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


        Row(
          children: <Widget>[

            StreamBuilder(
              stream: toppingsBloc.getcheckState,
              initialData: item.onSelect,
              builder: (context, snapshot) {
              return Checkbox(

                activeColor: primaryColor,
                value:snapshot.data, 
                onChanged: (bool value) {
  
                toppingsBloc.changeState(item,value);
                

                if(value){
                  print('slect state former Price $foodToppingsTotal');
                  foodToppingsTotal = foodToppingsTotal + int.parse(item.price);
                  print('select state present Price $foodToppingsTotal');

                  

                if(productToppings.length > 0){

                                for(int i =0 ; i < productToppings.length ; i++){

                                  if(productToppings[i].name != item.name){

                                    print('$subCartPrice + $foodToppingsTotal');
                                   // subCartPrice = subCartPrice + foodToppingsTotal;
                                    productToppings.add(item);
                                    //cartBloc.addTotal(subCartPrice, mquantity);

                                  }

                                }

                              }
                              else{

                                //subCartPrice = subCartPrice + foodToppingsTotal;
                               productToppings.add(item);
                                  
                              //cartBloc.addTotal(subCartPrice, mquantity);
                                
                              }



                   subCartPrice = foodToppingsTotal + foodVariationPrice;
                          
                       cartBloc.addTotal(subCartPrice, mquantity);
                 

                }
                else {

                           
                            print('uncheckformertop Price $foodToppingsTotal');
                            foodToppingsTotal = foodToppingsTotal- int.parse(item.price);
                            subCartPrice = foodVariationPrice + foodToppingsTotal ;
                    
                            print('uncheckpresent top Price $foodToppingsTotal');
                            cartBloc.addTotal(subCartPrice, mquantity); 

                    
                     
                      if(productToppings.length > 0){

                                for(int i =0 ; i < productToppings.length ; i++){

                                  if(productToppings[i].name == item.name){
                                     
                                   productToppings.removeAt(i);
                                  

                                  }

                                }

                              }

                      
                      // subCartPrice = subCartPrice - foodToppingsTotal;
                          
                      //  cartBloc.addTotal(subCartPrice, mquantity);
                      
                      }


                       

            });

            }
            ),
            Text(item.name),
            Text(item.price)
        ],
        ),


    ],
    );
  }



  Widget _buildFoodVaraition(List foodVariations){

      print(' fvlen:${foodVariations}');
     
       return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(left: 16),
    child: Text("CHOOSE ONE OF THE OPTIONS BELOW",style: Body,),
    ),
    for(int i =0 ; i< foodVariations.length;i++)

    Builder(builder: (context){
    return  _buildEachFoodVariation(foodVariations[i],i);

    })
    ],
    );
           

  }



Widget _buildFoodChoice(List foodChoices){

     
     
       return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("CHOOSE ONE OF THE CHOICES BELOW",style: Body,),
                ),
                for(int i =0 ; i< foodChoices.length;i++)

                Builder(builder: (context){
                return  _buildEachFoodChoice(foodChoices[i],i);

                })
                ],
                );
     
     
        

  }

  Widget _buildEachFoodVariation(Map<dynamic,dynamic> variation ,int position){

  //  int groupValue = -1;
    Variation  foodVariation = Variation.fromMap(variation);


    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
       StreamBuilder<int>(
          stream: cartBloc.getRadioState,
          initialData: -1,
          
         builder: (context, snapshot) {
           return Radio(value:position, groupValue: snapshot.data, onChanged: (int e){
                  print(e.toString());

                    
                    if(e == position){

                        print('posotioning: $position');
                        cartBloc.addRadioState(e);
                        // update the food variation in the cart item wrapper
                        mproductVariation = foodVariation;

                        //add the price of the food variation to the subCartPrice/Totalprice
                       foodVariationPrice = int.parse(foodVariation.price);

                       

                    }

                    else{

                          foodVariationPrice = int.parse(foodVariation.price);
                         
                    }
                     subCartPrice = foodToppingsTotal + foodVariationPrice;
                     cartBloc.addTotal(subCartPrice, mquantity);

                },activeColor: primaryColor,);
         }
       ),
        Text( "${foodVariation.name}"),
        
      
          foodVariation.price != null ? Text('${foodVariation.price}'):Text(''),



      ],
    );

  }



  Widget _buildEachFoodChoice(String foodVariation,int position){

//    groupValue = 1;

    
      MenuItem item =  widget.menuitems.singleWhere(
            (menuitem)=> menuitem.name == foodVariation);
        
        print('MyTEst: ${item.price}');


    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
    
          StreamBuilder<int>(
          stream: cartBloc.getchoiceRadioState,
          initialData: -1,
          
         builder: (context, snapshot) {
           return Radio(value:position, groupValue: snapshot.data, onChanged: (int e){
                  print(e.toString());
                    cartBloc.addchoiceRadioState(e);
                   
                   mproductChoice = foodVariation;
                    

                },activeColor: primaryColor,);
         }
       ),
         
     
        Text( "$foodVariation"),
        item.price != null ? Text('${item.price.toString()}'):Text(''),



      ],
    );

  }



  Widget _buildModalPrice(){


      final  CartBloc cartCounterBlok = BlocProvider.getBloc<CartBloc>();
    int btnState ;

    return Padding(

      key: UniqueKey(),
      padding: const EdgeInsets.only(left: 16, right: 16,bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(

            children: <Widget>[

              GestureDetector(
                  onTap: (){
                  
                    mquantity = mquantity +1;
                    cartBloc.addTempCounter(mquantity);
                    cartBloc.addTotal(subCartPrice, mquantity);

                  },
                  child: Icon(Icons.add_box, color: primaryColor,size: 40,)),
              StreamBuilder(
                  stream: cartBloc.tempCounterController,
                  initialData: 1,
                  builder: (context,snapshot){
                   
                    // cartItemWrapper.quantity = snapshot.data;
                    return Text("${snapshot.data}", style: TextStyle(fontSize: 32),);
                  }),

              GestureDetector(
                  onTap: (){
                    btnState =2;
                   
                    if(mquantity > 1) {
                       mquantity = mquantity -1;
                      cartBloc.addTempCounter(mquantity);
                      cartBloc.addTotal(subCartPrice, mquantity);
                    }




                  },
                  child: Icon(Icons.indeterminate_check_box, color: primaryColor,size: 40,)),


            ],
          ),

          Spacer(flex: 1,),
          Expanded(
            flex: 4,
            child: FlatButton(onPressed: (){

              if(foodVariationPrice==null || mproductChoice==null){
                ErrorDialog(context);
              }
              else{
                    cartItemWrapper = CartItemWrapper(product:widget.product,cart_price:subCartPrice*mquantity,
                                        quantity: mquantity,productChoice:mproductChoice,
                                        productToppings:productToppings,productVariation:mproductVariation
                                      );
              
                    print(cartItemWrapper.quantity);
                    globalcartBloc.addToList(cartItemWrapper);
                    Navigator.pop(context);
              }
            
            },
                color: Colors.pinkAccent,
              padding: EdgeInsets.all(16),
              child: StreamBuilder(
                stream: cartBloc.getTotalPrice,
                initialData: 0,
                builder: (context, snapshot) {
                 
                  return Text("ADD TO ORDER #${snapshot.data}",style: TextStyle(color: Colors.white),);
                }
              )
            ),
          )

        ],
      ),
    );

  }



}


Future<bool> ErrorDialog (context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),

          child: Container(
            height: 100,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16,top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Error", style:Theme
                      .of(context)
                      .textTheme
                      .title,),
                  Text("Please select food type", style: Theme
                      .of(context)
                      .textTheme
                      .body1,),
                ],
              ),
            ),
          ),
        );
      });
}




