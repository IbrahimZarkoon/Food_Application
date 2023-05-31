import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/Headings.dart';

class ReOrder extends StatefulWidget {
   ReOrder({Key? key,required this.image, required this.title, required this.price, required this.timeDate, required this.location, required this.status}) : super(key: key);

  String image;
  String title;
  String price;
  String timeDate;
  String location;
  String status;

  @override
  State<ReOrder> createState() => _ReOrderState();
}

class _ReOrderState extends State<ReOrder> {

  List<StepperData> stepperData = [];

  @override
  void initState() {
    // TODO: implement initState
    stepperData = [

      StepperData(
          title: StepperText(
            "Order from",
            textStyle: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
          ),
          subtitle: StepperText(
            "FENIX Branch",
            textStyle: TextStyle(
                color: Color(0xffef4b4b),
                fontWeight: FontWeight.bold,
                fontSize: 13),

          ),
          iconWidget: Container(
            alignment: Alignment.center,
            //padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.location_on_outlined,
              color: Color(0xffef4b4b),
              size: 23,
            ),
          )),

      StepperData(
          title: StepperText(
            "Delivered to",
            textStyle: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
          ),
          subtitle: StepperText(
            "${widget.location}",
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.normal,
                fontSize: 13),

          ),
          iconWidget: Container(
            alignment: Alignment.center,
            //padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.location_on_outlined,
              color: Color(0xffef4b4b),
              size: 23,
            ),
          )),


    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
      Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Image Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover),
              ),
            ),

            //Order Details Container
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              color: Color(0xfff8f8f8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      
                      Text("Order #k5t-2001",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),),

                      const SizedBox(height: 5,),

                     widget.status == "Cancelled"? Text("Cancelled on ${widget.timeDate}",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),) : Text("${widget.timeDate}",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                      AnotherStepper(
                        activeBarColor: Color(0xffef4b4b).withOpacity(0.5),
                        inActiveBarColor: Color(0xffef4b4b).withOpacity(0.5),
                        activeIndex: 0,
                        verticalGap: 20,
                        stepperList: stepperData,
                        stepperDirection: Axis.vertical,
                        iconWidth: 25,
                        // Height that will be applied to all the stepper icons
                        iconHeight:
                        25, // Width that will be applied to all the stepper icons
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Items Container
            Container(
              padding: EdgeInsets.all(15),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [

                          Text("1x ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black.withOpacity(0.8)),),

                          const SizedBox(width: 15,),

                          Text("${widget.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black.withOpacity(0.8)),),
                        ],
                      ),

                      Text("\$ ${widget.price}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black.withOpacity(0.8)),),
                    ],
                  )
                ],
              ),
            ),

            //Shadow line
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: shadowLine(context),
            ),

            //Subtotal Container
            Container(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 5, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.normal,
                          fontSize: 13)),
                  Text("\$ ${widget.price}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 13)),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //Delivery Fee Container
            Container(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 5, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.normal,
                          fontSize: 13)),
                  Text("\$ 2.99",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 13)),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //Total + GST Container
            Container(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 5, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total (incl. GST)",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.normal,
                          fontSize: 13)),
                  Text("\$ ${(double.parse(widget.price) + 2.99).toStringAsFixed(2)}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 13)),
                ],
              ),
            ),

            //Shadow line
            Padding(
              padding: const EdgeInsets.all(15),
              child: shadowLine(context),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Paid with",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13),),

                  const SizedBox(height: 15,),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            height: 25,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://media.wired.com/photos/5926dea98d4ebc5ab806bc20/master/w_1600%2Cc_limit/Mastercard2-1.jpg"),
                                fit: BoxFit.cover
                              )
                            ),
                          ),

                          Text("credit card",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.8)),),
                        ],
                      ),

                      Text("\$ ${(double.parse(widget.price) + 2.99).toStringAsFixed(2)}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14)),
                    ],
                  )

                ],
              ),
            )


          ],
        ),
      ),

        //Back Arrow
        Positioned(
            top: 40,
            left: 15,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                child:  Icon(Icons.arrow_back,color: Colors.black.withOpacity(0.8),),
              ),
            )),

        //Select items Positioned
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


                  const SizedBox(height: 10,),

                  GestureDetector(
                    onTap: ()
                    {

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

                      child: Text("Select items to reorder",style: TextStyle(fontSize: 13,color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ))
    ]
    );
  }
}
