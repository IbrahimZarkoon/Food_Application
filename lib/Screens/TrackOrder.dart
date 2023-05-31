import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/CustomWidgets/Headings.dart';
import 'package:food_app/Screens/Dashboard.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key? key}) : super(key: key);

  int _currentIndex = 2;

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  // List<StepperData> stepperData = [
  //   StepperData(
  //       title: StepperText(
  //         "Order Placed",
  //         textStyle:  TextStyle(
  //           color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13
  //         ),
  //       ),
  //       subtitle: StepperText("Your order has been placed",textStyle: TextStyle(
  //           color: Colors.black.withOpacity(0.6),fontSize: 12
  //       ),),
  //       iconWidget: Container(
  //         alignment: Alignment.center,
  //         padding: const EdgeInsets.all(2),
  //         decoration: const BoxDecoration(
  //             color: Colors.green,
  //             borderRadius: BorderRadius.all(Radius.circular(30))),
  //         child:  Icon( widget._currentIndex >= 0? Icons.looks_one : Icons.check_circle, color: Colors.white,size: 15,),
  //       )),
  //   StepperData(
  //       title: StepperText("Preparing",textStyle: TextStyle(
  //           color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13
  //       ),),
  //       subtitle: StepperText("Your order is being prepared",textStyle: TextStyle(
  //           color: Colors.black.withOpacity(0.6),fontSize: 12
  //       ),),
  //       iconWidget: Container(
  //         alignment: Alignment.center,
  //         padding: const EdgeInsets.all(2),
  //         decoration: const BoxDecoration(
  //             color: Colors.green,
  //             borderRadius: BorderRadius.all(Radius.circular(30))),
  //         child: const Icon(Icons.looks_two, color: Colors.white,size: 15,),
  //       )),
  //   StepperData(
  //       title: StepperText("Disptached",textStyle: TextStyle(
  //           color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13
  //       ),),
  //       subtitle: StepperText(
  //           "Our delivery executive is on the way to deliver your item",textStyle: TextStyle(
  //           color: Colors.black.withOpacity(0.6),fontSize: 12
  //       ),),
  //       iconWidget: Container(
  //         alignment: Alignment.center,
  //         padding: const EdgeInsets.all(2),
  //         decoration: const BoxDecoration(
  //             color: Colors.green,
  //             borderRadius: BorderRadius.all(Radius.circular(30))),
  //         child: const Icon(Icons.looks_3, color: Colors.white,size: 15,),
  //       )),
  //   StepperData(
  //     title: StepperText("Delivered",
  //         textStyle: TextStyle(
  //             color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13
  //         ),),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      if (widget._currentIndex >= 0)
        StepperData(
            title: StepperText(
              "Order Placed",
              textStyle: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
            subtitle: StepperText(
              "Your order has been placed",
              textStyle:
                  TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
            ),
            iconWidget: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 12,
              ),
            )),
      StepperData(
          title: StepperText(
            "Preparing",
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontWeight: widget._currentIndex >= 1
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 13),
          ),
          subtitle: StepperText(
            "Your order is being prepared",
            textStyle:
                TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
          ),
          iconWidget: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: widget._currentIndex >= 1
                    ? Colors.green
                    : Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: widget._currentIndex >= 1
                ? Icon(
                    widget._currentIndex == 1
                        ? CupertinoIcons.timer
                        : Icons.check_circle,
                    color: Colors.white,
                    size: 12,
                  )
                : Icon(
                    CupertinoIcons.timer,
                    color: Colors.white,
                    size: 12,
                  ),
          )),
      StepperData(
          title: StepperText(
            "Disptached",
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontWeight: widget._currentIndex >= 2
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 13),
          ),
          subtitle: StepperText(
            "Our delivery executive is on the way to deliver your item",
            textStyle:
                TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
          ),
          iconWidget: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: widget._currentIndex >= 2
                    ? Colors.green
                    : Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: widget._currentIndex >= 2
                ? Icon(
                    widget._currentIndex == 2
                        ? Icons.backpack_outlined
                        : Icons.check_circle,
                    color: Colors.white,
                    size: 12,
                  )
                : Icon(
                    Icons.backpack_outlined,
                    color: Colors.white,
                    size: 12,
                  ),
          )),
      StepperData(
          title: StepperText(
            "Delivered",
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontWeight: widget._currentIndex >= 3
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 13),
          ),
          iconWidget: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: widget._currentIndex >= 3
                    ? Colors.green
                    : Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: widget._currentIndex >= 3
                ? Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 12,
                  )
                : Icon(
                    Icons.delivery_dining_outlined,
                    color: Colors.white,
                    size: 12,
                  ),
          )),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 30,
        title: Text(
          "Order Status",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8),
              fontSize: 14),
        ),
        leading: BackButton(
            color: Colors.black.withOpacity(0.8),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) =>
                          DashboardPage(tabindex: 0)));
            }),
      ),
      backgroundColor: Color(0xfffffdf3),
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/GoogleMaps.png"),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
        Positioned(
            left: 0,
            right: 0,bottom: 0,
            top: 0,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(children: [

                //Order Progress Stepper
                Container(
                  margin: EdgeInsets.only(bottom: 20,left: 15,right: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1.5,
                            offset: Offset(0, 0),
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivering to",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Kakkanad, Kerala 682030, Indonesia, COCHIN, COCHIN",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AnotherStepper(
                        activeBarColor: Colors.green,
                        activeIndex: widget._currentIndex,
                        verticalGap: 25,
                        stepperList: stepperData,
                        stepperDirection: Axis.vertical,
                        iconWidth: 20,
                        // Height that will be applied to all the stepper icons
                        iconHeight:
                            20, // Width that will be applied to all the stepper icons
                      ),
                    ],
                  ),
                ),

                //Contact Us Container
                GestureDetector(
                  onTap: ()
                  {
                    launchURL('https://wa.me/03363434322/?text=${Uri.encodeFull("HI\nHow much time will it take to delivery my order?")}');

                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20,left: 15,right: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 1.5,
                              offset: Offset(0, 0),
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xffef4b4b).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)
                              ),
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..scale(-1.0, 1.0, 1.0),
                                  child: Icon(Icons.message_outlined,size: 18,color: Color(0xffef4b4b),),
                                ),),

                            const SizedBox(width: 10,),

                            Text("Contact delivery boy",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13),),
                          ],
                        ),

                        Icon(Icons.keyboard_arrow_right,color: Colors.black.withOpacity(0.8),size: 20,)

                      ],
                    ),
                  ),
                ),

                //Order Details
                Container(
                  margin: EdgeInsets.only(bottom: 20,left: 15,right: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1.5,
                            offset: Offset(0, 0),
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order #124",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        
                        children: [
                          Text(
                            "08:34 pm",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6), fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 5,right: 5),
                            width: 1,
                            height: 15,
                            color: Colors.black.withOpacity(0.2),
                          ),

                          Text(
                            "Payment Mode: Credit Card",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6), fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 5,right: 5),
                            width: 1,
                            height: 15,
                            color: Colors.black.withOpacity(0.2),
                          ),

                          Text(
                            "2 Items",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6), fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      ),

                      const SizedBox(height: 10,),

                      shadowLine(context),

                      const SizedBox(height: 10,),

                      //Qty and Total Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Qty & Item Name",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold, fontSize: 13),
                          ),

                          Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "x1 Non Veg Loaded",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 12),
                          ),

                          Text(
                            "\$ 4.99",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 12),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "x1 Pepper Barbecue Chicken",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 13),
                          ),

                          Text(
                            "\$ 8.99",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      shadowLine(context),

                      const SizedBox(height: 10,),

                      //SubTotal Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Sub Total",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 13),
                          ),

                          Text(
                            "\$ 13.98",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5,),

                      //Discount Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Discount",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 12),
                          ),

                          Text(
                            "\$ 2.99",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 12),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5,),

                      //Tax and other charges Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Tax & Charges",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 13),
                          ),

                          Text(
                            "\$ 1.99",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8), fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      shadowLine(context),

                      const SizedBox(height: 10,),

                      //Grand Total Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Grand Total",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold, fontSize: 14),
                          ),

                          Text(
                            "\$ 12.98",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("How was your ordering experience?", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black.withOpacity(0.8)),),


                        ],
                      ),

                      const SizedBox(height: 15,),

                      AbsorbPointer(
                        absorbing: false,
                        child: RatingBar(
                          glowColor: Color(0xffffc107),
                          initialRating: 0,
                          allowHalfRating: true,
                          itemSize: 35,
                          ratingWidget:
                          RatingWidget(
                              full:
                              const Icon(
                                Icons
                                    .star,
                                color: Color(
                                    0xffffc107),
                              ),
                              half:
                              const Icon(
                                Icons
                                    .star_half,
                                color: Color(
                                    0xffffc107),
                              ),
                              empty:
                              const Icon(
                                Icons
                                    .star_border,
                                color: Color(
                                    0xffffc107),
                              )),
                          onRatingUpdate:
                              (ratings) =>
                              print(
                                  ratings),
                        ),
                      ),
                    ],
                  ),
                ),


              ]),
            ))
      ]),
    );
  }
}
