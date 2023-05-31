import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/PaymentAddressPage.dart';
import 'package:provider/provider.dart';

import '../Modals/CartProvider.dart';
import '../Screens/Dashboard.dart';

class ConfirmPaymentAddressCon extends StatefulWidget {
  const ConfirmPaymentAddressCon({Key? key}) : super(key: key);

  @override
  State<ConfirmPaymentAddressCon> createState() => _ConfirmPaymentAddressConState();
}

class _ConfirmPaymentAddressConState extends State<ConfirmPaymentAddressCon> {
  @override
  Widget build(BuildContext context) {
    var cartProv = Provider.of<CartProvider>(context,listen: false);

    return Container(
      color: Colors.transparent,

      child: GestureDetector(
        onTap: ()
        {
          Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PaymentAddressPage()));
        },
        child: Container(
          margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color(0xffffec00),
              borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1.5,
                  offset: Offset(0,1)
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // Cart Length
              // Container(
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50),
              //       color: Color(0xffff0000)
              //   ),
              //   child: Text("${cartProv.cartLength}",style: TextStyle(color: Colors.white,fontSize: 12),),
              // ),

              //View Cart
              // Icon(CupertinoIcons.cart_fill,size: 20,color: Colors.black.withOpacity(0.8),),
              // const SizedBox(width: 5,),
              Text("Confirm payment and address",
                style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),),

              // //Cart Price
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //
              //   children: [
              //
              //     Text("PKR ${cartProv.totalPrice}",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)
              //
              //   ],
              // )

            ],
          ),

        ),
      ),

    );
  }
}
