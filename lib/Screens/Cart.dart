import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/ConfirmPaymentAddressCon.dart';
import 'package:food_app/CustomWidgets/Headings.dart';
import 'package:food_app/Screens/AddressBook.dart';
import 'package:food_app/Screens/Dashboard.dart';
import 'package:food_app/Screens/PaymentMethods.dart';
import 'package:provider/provider.dart';

import '../Modals/CartProvider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  int productCount = 1;


  @override
  Widget build(BuildContext context) {

    var cartProv = Provider.of<CartProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        leadingWidth: 25,
        leading: BackButton(color: Colors.black.withOpacity(0.8),onPressed: ()=> Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 0)))),
        title: GestureDetector(
          onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 0))),
          child: Row(
            children: [
              Text("Cart",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
      body: cartProv.cartLength != 0? Stack(
        children:[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //My Cart Heading
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: Row(
                      children: [
                        Text("My cart",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                  ),

                  //1st Item
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.05), width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //image title delete Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Image Container
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.optp.biz:3000/23babc90-c2f5-11ed-b690-19a95b5a1898-THEHOTGUNBAG-2023-03-15054924.jpg"),
                                          fit: BoxFit.cover)),
                                ),

                                //Title and Cost Column
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "The HotGun Bag x 3",
                                      style: TextStyle(
                                          color: Color(0xffd50a0a),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "PKR 7050",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      height: 25,
                                      //margin: EdgeInsets.only(right: 15),
                                      //width: MediaQuery.of(context).size.width*0.31,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            width: 0.5),
                                        //color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onLongPress: () {
                                              if (productCount > 0) {
                                                setState(() {
                                                  productCount = 1;
                                                });
                                              }
                                            },
                                            onTap: () {
                                              if (productCount > 0) {
                                                if (productCount != 1) {
                                                  setState(() {
                                                    productCount--;
                                                  });
                                                }
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       color: Colors.black.withOpacity(0.1),
                                                //       offset: Offset(0,0),
                                                //       blurRadius: 1,
                                                //       spreadRadius: 1
                                                //   )
                                                // ],
                                                color: Colors.white,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(
                                            width: 5,
                                          ),

                                          //Product Count Container
                                          Container(
                                              alignment: Alignment.center,
                                              //height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       color: Colors.black.withOpacity(0.1),
                                                //       offset: Offset(0,0),
                                                //       blurRadius: 1,
                                                //       spreadRadius: 1
                                                //   )
                                                // ]
                                              ),
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text('$productCount')),

                                          const SizedBox(
                                            width: 5,
                                          ),

                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                productCount++;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       color: Colors.black.withOpacity(0.1),
                                                //       offset: Offset(0,0),
                                                //       blurRadius: 1,
                                                //       spreadRadius: 1
                                                //   )
                                                // ],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.delete,
                              color: Color(0xfff8090a),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //Details List
                        ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            //1st Detail
                            itemDetailsRow(
                                context, "Nashville Hot(Nashville Hot) * 6"),

                            //2nd Detail
                            itemDetailsRow(context, "The ShotGun(ShotGun) * 6"),

                            itemDetailsRow(
                                context, "The ShotGun(Spicy ShotGun) * 0"),

                            itemDetailsRow(
                                context, "Coke 1 litre(1 Litre) * 3"),

                            itemDetailsRow(context, "Plain Fries(Large) * 3")
                          ],
                        ),
                      ],
                    ),
                  ),

                  //2nd Item
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.05), width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //image title delete Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Image Container
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.optp.biz:3000/23babc90-c2f5-11ed-b690-19a95b5a1898-THEHOTGUNBAG-2023-03-15054924.jpg"),
                                          fit: BoxFit.cover)),
                                ),

                                //Title and Cost Column
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "The ShotGun Bag x 1",
                                      style: TextStyle(
                                          color: Color(0xffd50a0a),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "PKR 1050",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      height: 25,
                                      //margin: EdgeInsets.only(right: 15),
                                      //width: MediaQuery.of(context).size.width*0.31,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            width: 0.5),
                                        //color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onLongPress: () {
                                              if (productCount > 0) {
                                                setState(() {
                                                  productCount = 1;
                                                });
                                              }
                                            },
                                            onTap: () {
                                              if (productCount > 0) {
                                                if (productCount != 1) {
                                                  setState(() {
                                                    productCount--;
                                                  });
                                                }
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       color: Colors.black.withOpacity(0.1),
                                                //       offset: Offset(0,0),
                                                //       blurRadius: 1,
                                                //       spreadRadius: 1
                                                //   )
                                                // ],
                                                color: Colors.white,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(
                                            width: 5,
                                          ),

                                          //Product Count Container
                                          Container(
                                              alignment: Alignment.center,
                                              //height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       color: Colors.black.withOpacity(0.1),
                                                //       offset: Offset(0,0),
                                                //       blurRadius: 1,
                                                //       spreadRadius: 1
                                                //   )
                                                // ]
                                              ),
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text('$productCount')),

                                          const SizedBox(
                                            width: 5,
                                          ),

                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                productCount++;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       color: Colors.black.withOpacity(0.1),
                                                //       offset: Offset(0,0),
                                                //       blurRadius: 1,
                                                //       spreadRadius: 1
                                                //   )
                                                // ],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.delete,
                              color: Color(0xfff8090a),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //Details List
                        ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            //1st Detail
                            itemDetailsRow(context, "The ShotGun(ShotGun) * 4"),

                            itemDetailsRow(
                                context, "The ShotGun(Spicy ShotGun) * 0"),

                            itemDetailsRow(context, "Plain Fries(Jumbo) * 1")
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Special Instructions Heading
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Special Instructions",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        Text("Optional",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 12)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 10, left: 15, right: 15),
                    child: Text(
                      "Any specific preferences? Let us know",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 12),
                    ),
                  ),

                  //Text Field
                  Container(
                    margin: const EdgeInsets.only(
                        top: 0, bottom: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      onTap: () {},
                      cursorColor: Color(0xff444444),
                      maxLines: 4,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          border: InputBorder.none,
                          hintText: 'Special delivery instructions',
                          hintStyle: TextStyle(fontSize: 12)),
                    ),
                  ),

                  //Apply Coupon Heading
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Apply Coupon",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                  ),

                  //Apply Coupon TextField
                  Container(
                    margin: const EdgeInsets.only(
                        top: 0, bottom: 10, left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onTap: () {},
                            cursorColor: Color(0xff444444),
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              border: InputBorder.none,
                              hintText: 'Enter coupon code',
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2, bottom: 2, right: 5),
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xfffdc70d)),
                          alignment: Alignment.center,
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("PKR 9000",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 12)),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Fee",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("PKR 80",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 12)),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Incl. Tax",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("PKR 428.57",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 12)),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GST",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("5 %",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 12)),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Grand Total",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text("PKR 9080",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              )),
        ),

          Positioned(
              left: 0,right: 0,bottom: 0,
              child: ConfirmPaymentAddressCon())
      ]
      )
      :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              size: 80,
              color: Colors.black.withOpacity(0.4),
            ),
            SizedBox(height: 16),
            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemDetailsRow(BuildContext context,String D)
  {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(Icons.circle,size: 5,color: Colors.black.withOpacity(0.6)),
          const SizedBox(width: 5,),
          Text(D,style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),
        ],
      ),
    );
  }
}
