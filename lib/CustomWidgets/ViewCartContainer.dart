
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/Dashboard.dart';
import 'package:provider/provider.dart';

import '../Modals/CartProvider.dart';
import '../Screens/Cart.dart';

class ViewCartCon extends StatefulWidget {
  const ViewCartCon({Key? key}) : super(key: key);

  @override
  State<ViewCartCon> createState() => _ViewCartConState();
}

class _ViewCartConState extends State<ViewCartCon> {

  bool viewcart = false;

  @override
  Widget build(BuildContext context) {

    var cartProv = Provider.of<CartProvider>(context,listen: false);

    return Container(
      color: Colors.transparent,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [

          GestureDetector(
            onTap: ()
            {
              setState(() {
                viewcart = true;
              });
            },
            child: AnimatedContainer(
              width: viewcart? MediaQuery.of(context).size.width-30 : null ,
              margin: viewcart? EdgeInsets.only(left: 15,right: 15,bottom: 15) : EdgeInsets.only(right: 20,bottom: 20),
              padding: viewcart? EdgeInsets.all(15) : EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffffec00),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1.5,
                    offset: Offset(1,2)
                  )
                ],
                borderRadius: viewcart? BorderRadius.circular(40) : BorderRadius.circular(50)
              ),
              alignment: Alignment.center,

              duration: Duration(milliseconds: 500),
              child: viewcart?
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 2)));
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1500),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      //Cart Length
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffff0000)
                        ),
                        child: Text("${cartProv.cartLength}",style: TextStyle(color: Colors.white,fontSize: 12),),
                      ),

                      //View Cart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(CupertinoIcons.cart_fill,size: 20,color: Colors.black.withOpacity(0.8),),
                          const SizedBox(width: 5,),
                          Text("View Cart",
                            style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)
                        ],
                      ),

                      //Cart Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [

                          Text("PKR ${cartProv.totalPrice}",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)

                        ],
                      )

                    ],
                  ),

                ),
              ) :  Stack(children: [

                Icon(CupertinoIcons.shopping_cart,size: 30,color: Colors.black,),

                Positioned(
                  left: 0,
                  child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 4,right: 4,top: 1,bottom: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffff0000)
                  ),
                  child: Text("${cartProv.cartLength}",style: TextStyle(color: Colors.white,fontSize: 12),),
                ),)
              ]),
            ),
          )
        ],
      )

    );
  }
}

//
// GestureDetector(
// onTap: ()
// {
// Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 2)));
// },
// child: Container(
// margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
// padding: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xffffec00),
// borderRadius: BorderRadius.circular(40)
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
// children: [
//
// //Cart Length
// Container(
// alignment: Alignment.center,
// padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// color: Color(0xffff0000)
// ),
// child: Text("${cartProv.cartLength}",style: TextStyle(color: Colors.white,fontSize: 12),),
// ),
//
// //View Cart
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
//
// Icon(CupertinoIcons.cart_fill,size: 20,color: Colors.black.withOpacity(0.8),),
// const SizedBox(width: 5,),
// Text("View Cart",
// style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)
// ],
// ),
//
// //Cart Price
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
//
// children: [
//
// Text("PKR ${cartProv.totalPrice}",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)
//
// ],
// )
//
// ],
// ),
//
// ),
// )