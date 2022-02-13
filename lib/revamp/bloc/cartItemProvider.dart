


import 'package:foodie/revamp/helperclass/cart_item_wrapper.dart';
import 'package:foodie/revamp/model/product.dart';

class CartItemProvider{

  List<CartItemWrapper> listCartItems = [];


  List<CartItemWrapper> addToList (CartItemWrapper cartItemWrapper){

    // if(cartItemWrapper.product.price == null ){
    //   listCartItems.add(cartItemWrapper);

    // }
    // else{

    //   // if lsit already contains data check for match
    //     if(listCartItems.length > 0){


    //         for(int i =0 ; i < listCartItems.length; i++){

    //           if(listCartItems[i].product.name == cartItemWrapper.product.name){

    //              listCartItems[i].cart_price = cartItemWrapper.cart_price;
    //              listCartItems[i].quantity = cartItemWrapper.quantity;

    //           }
             

    //         }


    //     }
    //     // if the lsit is empty
    //     else{

    //         listCartItems.add(cartItemWrapper);
    //     }

    // }

     listCartItems.add(cartItemWrapper);

  return listCartItems;

  }


   List<CartItemWrapper> updateList (CartItemWrapper cartItemWrapper,int position){

    

      // if lsit already contains data check for match
        if(listCartItems.length > 0){

          listCartItems[position] = cartItemWrapper;
           

        }
       


  return listCartItems;

  }


  List<CartItemWrapper> removeFromList (CartItemWrapper cartItemWrapper,int position){

  
        if(listCartItems.length > 0){


            // for(int i =0 ; i < listCartItems.length; i++){

            //   if(listCartItems[i].product.name == cartItemWrapper.product.name){

            //      listCartItems.removeAt(i);

            //   }
             

            // }

            listCartItems.removeAt(position);

        }
 

  return listCartItems;

  }

  



}





