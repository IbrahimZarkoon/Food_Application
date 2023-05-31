import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/Headings.dart';
import 'package:food_app/Modals/CartProvider.dart';
import 'package:food_app/Screens/OrderPlacedScreen.dart';
import 'package:provider/provider.dart';

import 'AddressBook.dart';
import 'Dashboard.dart';
import 'PaymentMethods.dart';

class PaymentAddressPage extends StatefulWidget {
  const PaymentAddressPage({Key? key}) : super(key: key);

  @override
  State<PaymentAddressPage> createState() => _PaymentAddressPageState();
}

class _PaymentAddressPageState extends State<PaymentAddressPage> {
  @override
  Widget build(BuildContext context) {
    var cartProv = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        leadingWidth: 25,
        leading: BackButton(
            color: Colors.black.withOpacity(0.8),
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        DashboardPage(tabindex: 2)))),
        title: GestureDetector(
          onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) =>
                      DashboardPage(tabindex: 2))),
          child: Row(
            children: [
              Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Delivery Address Container
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            //spreadRadius: 1,
                            blurRadius: 1.5,
                            offset: Offset(0, 1))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 25,
                                color: Color(0xffef4b4b),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Delivery address",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ],
                          ),
                          GestureDetector(
                              onTap: () async {
                                await showModalBottomSheet(
                                    useSafeArea: true,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return AddressBook();
                                    });
                              },
                              child: Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Color(0xffef4b4b),
                                size: 20,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/GoogleMaps.png"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      shadowLine(context),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "85-K P.E.C.H.S Block-2",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Karachi, Sindh",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 12),
                      ),
                    ],
                  ),
                ),

                //Delivery Options
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            //spreadRadius: 1,
                            blurRadius: 1.5,
                            offset: Offset(0, 1))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery options",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Color(0xffef4b4b), width: 1.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Standard",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "20 mins",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 11),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //Payment method
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            //spreadRadius: 1,
                            blurRadius: 1.5,
                            offset: Offset(0, 1))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.creditcard,
                                size: 20,
                                color: Color(0xffef4b4b),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Payment method",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ],
                          ),
                          GestureDetector(
                              onTap: () async {
                                await showModalBottomSheet(
                                    useSafeArea: true,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return PaymentMethods();
                                    });
                              },
                              child: Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Color(0xffef4b4b),
                                size: 20,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Image Container
                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 0),
                                  width: 40,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://media.wired.com/photos/5926dea98d4ebc5ab806bc20/master/w_1600%2Cc_limit/Mastercard2-1.jpg"),
                                          fit: BoxFit.cover)),
                                ),

                                //Details Column
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mastercard",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "**** 6008",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "\$ ${cartProv.totalPrice}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 13),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //Order Summary Container
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            //spreadRadius: 1,
                            blurRadius: 1.5,
                            offset: Offset(0, 1))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Headings row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 20,
                            color: Color(0xffef4b4b),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Order summary",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "x3 HotGun Bag",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12),
                                ),
                                Text(
                                  "\$ 7050",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "x1 ShotGun Bag",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12),
                                ),
                                Text(
                                  "\$ 1050",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            shadowLine(context),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12)),
                                Text("PKR 9000",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Fee",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12)),
                                Text("PKR 80",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Incl. Tax",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12)),
                                Text("PKR 428.57",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Text(
                        "By completing this order, I agree to all ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 10),
                      ),
                      Text(
                        "terms & conditions. ",
                        style:
                            TextStyle(color: Color(0xffef4b4b), fontSize: 10),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),

                //
                // //Address Container
                // GestureDetector(
                //   onTap: () async
                //   {
                //     await showModalBottomSheet(
                //         useSafeArea: true,
                //         context: context,
                //         isScrollControlled: true,
                //         builder: (BuildContext context) {
                //           return AddressBook();
                //         });
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.only(
                //         top: 0, bottom: 10, left: 15, right: 15),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(15),
                //       border: Border.all(
                //         color: Colors.grey,
                //         width: 1,
                //       ),
                //     ),
                //     child: Row(
                //       children: [
                //         Expanded(
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                //               child: Text("Select address",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),
                //             )
                //         ),
                //         Container(
                //             margin: EdgeInsets.only(top: 4, bottom: 4, right: 5),
                //             padding: EdgeInsets.only(
                //                 left: 20, right: 20, top: 10, bottom: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 color: Color(0xfffdc70d)),
                //             alignment: Alignment.center,
                //             child: Icon(CupertinoIcons.add,size: 18,)
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //
                // //Payment Heading
                // Container(
                //   padding: const EdgeInsets.only(
                //       top: 0, bottom: 10, left: 15, right: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text("Payment method *",
                //           overflow: TextOverflow.ellipsis,
                //           style: TextStyle(
                //               color: Colors.black.withOpacity(0.8),
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16)),
                //     ],
                //   ),
                // ),
                //
                // //Payment Container
                // GestureDetector(
                //   onTap: () async
                //   {
                //     await showModalBottomSheet(
                //         useSafeArea: true,
                //         context: context,
                //         isScrollControlled: true,
                //         builder: (BuildContext context) {
                //           return PaymentMethods();
                //         });
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.only(
                //         top: 0, bottom: 10, left: 15, right: 15),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(15),
                //       border: Border.all(
                //         color: Colors.grey,
                //         width: 1,
                //       ),
                //     ),
                //     child: Row(
                //       children: [
                //         Expanded(
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                //               child: Text("Select payment method",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),
                //             )
                //         ),
                //         Container(
                //             margin: EdgeInsets.only(top: 4, bottom: 4, right: 5),
                //             padding: EdgeInsets.only(
                //                 left: 20, right: 20, top: 10, bottom: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 color: Color(0xfffdc70d)),
                //             alignment: Alignment.center,
                //             child: Icon(CupertinoIcons.add,size: 18,)
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),

        Positioned(

            left: 0,right: 0,bottom: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1.5,
                    offset: Offset(0,-1),
                    spreadRadius: 1
                  )
                ]
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  //Total Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Total ",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),),
                          Text("(incl. VAT)",style: TextStyle(color: Colors.black.withOpacity(0.5),fontWeight: FontWeight.bold,fontSize: 11),),
                        ],
                      ),

                      Text("\$ ${cartProv.totalPrice}",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)


                    ],
                  ),

                  const SizedBox(height: 10,),

                  GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        Provider.of<CartProvider>(context,listen: false).totalPrice = 0;
                        Provider.of<CartProvider>(context,listen: false).cartLength = 0;
                      });
                      Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => OrderPlacedScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffffec00),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 1,
                              blurRadius: 1.5,
                              offset: Offset(0,1)
                          )
                        ],
                      ),

                      child: Text("Place order",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
