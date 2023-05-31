import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {

  bool keyboard = false;
  TextEditingController fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xfffcc817),
          automaticallyImplyLeading: false,
          leading: BackButton(
            onPressed: () => Navigator.pop(context), color: Colors.black.withOpacity(0.8),),
          leadingWidth: 30,
          centerTitle: true,
          title: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text("Account Details", style: TextStyle(color: Colors.black.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),)),
        ),

        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Column(

            children: [

              Container(
                padding: const EdgeInsets.only(top: 20,bottom: 20 , left:15 , right:15),
                child: Row(
                  children:  [

                    Text("Payment Methods",overflow: TextOverflow.ellipsis,
                        style:
                        const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold, fontSize: 20)),
                  ],
                ),
              ),

              //Payment1 Container
              Stack(
                  children: [

                    Container(
                      padding: EdgeInsets.only(top: 5,bottom: 5),

                      margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Image Container
                              Container(
                                margin: EdgeInsets.only(right: 10,top: 0),
                                width: 40,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(image: NetworkImage("https://media.wired.com/photos/5926dea98d4ebc5ab806bc20/master/w_1600%2Cc_limit/Mastercard2-1.jpg"),
                                        fit: BoxFit.cover)
                                ),
                              ),

                              //Details Column
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [

                                  Text("Mastercard",style: TextStyle(fontWeight: FontWeight.bold),),

                                  const SizedBox(height: 10,),

                                  Text("**** 7179",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),)

                                ],
                              ),
                            ],
                          ),

                          Icon(Icons.keyboard_arrow_right_outlined,color: Color(
                              0xffec4040),)

                        ],
                      ),

                    ),

                    Positioned(
                        top: 31,
                        right: 75,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff1f1f1),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
                          child: Text("Primary",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Color(
                              0xff7c7c7c)),),
                        ))
                  ]
              ),

              //Payment2 Container
              Container(
                padding: EdgeInsets.only(top: 5,bottom: 5),

                margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Container(
                          margin: EdgeInsets.only(right: 10,top: 0),
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(image: NetworkImage("https://www.investopedia.com/thmb/3H96L9iC_VUhvsqmnypxfEQW4UA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/full-color-800x450-cee226a48bed4177b90351075b332227.jpg"),
                                  fit: BoxFit.cover)
                          ),
                        ),

                        //Details Column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text("Visacard",style: TextStyle(fontWeight: FontWeight.bold),),

                            const SizedBox(height: 10,),

                            Text("**** 6008",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),)

                          ],
                        ),
                      ],
                    ),

                    Icon(Icons.keyboard_arrow_right_outlined,color: Color(
                        0xffec4040),)

                  ],
                ),

              ),

              //Payment3 Container
              Container(
                padding: EdgeInsets.only(top: 5,bottom: 5),

                margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Container(
                          margin: EdgeInsets.only(right: 10,top: 0),
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(image: NetworkImage("https://media.wired.com/photos/5926dea98d4ebc5ab806bc20/master/w_1600%2Cc_limit/Mastercard2-1.jpg"),
                                  fit: BoxFit.cover)
                          ),
                        ),

                        //Details Column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text("Mastercard",style: TextStyle(fontWeight: FontWeight.bold),),

                            const SizedBox(height: 10,),

                            Text("**** 3662",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),)

                          ],
                        ),
                      ],
                    ),

                    Icon(Icons.keyboard_arrow_right_outlined,color: Color(
                        0xffec4040),)

                  ],
                ),

              ),

              //Payment4 Container
              Container(
                padding: EdgeInsets.only(top: 5,bottom: 5),

                margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Container(
                          margin: EdgeInsets.only(right: 10,top: 0),
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(image: NetworkImage("https://www.investopedia.com/thmb/3H96L9iC_VUhvsqmnypxfEQW4UA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/full-color-800x450-cee226a48bed4177b90351075b332227.jpg"),
                                  fit: BoxFit.contain)
                          ),
                        ),

                        //Details Column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text("Visacard",style: TextStyle(fontWeight: FontWeight.bold),),

                            const SizedBox(height: 10,),

                            Text("**** 6252",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),)

                          ],
                        ),
                      ],
                    ),

                    Icon(Icons.keyboard_arrow_right_outlined,color: Color(
                        0xffec4040),)

                  ],
                ),

              ),

            ],
          ),
        ),

        bottomNavigationBar: Container(

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 1.5,
                    offset: Offset(0,0)
                )
              ]
          ),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.45,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,

                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0,-5),
                              blurRadius: 10,
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white
                      ),

                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            //Headings Container
                            Container(
                                margin: const EdgeInsets.only(bottom: 0),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20, left: 15, right: 15),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Add a new payment method",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    ],
                                  ),
                                )),

                            //Name on Card Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 15,right: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 1,
                                        spreadRadius: 0.5,
                                        offset: Offset(0,0)
                                    )
                                  ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0, left: 15, right: 15),
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          keyboard = true;
                                        });
                                      },
                                      //controller: fullName,
                                      cursorHeight: 20,
                                      style: TextStyle(
                                          height: 1,
                                          color: Colors.black.withOpacity(0.6), fontSize: 17),
                                      decoration: const InputDecoration(

                                        hintText: "Full name on card",
                                        hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            //Card Number Container
                            Container(
                              width: MediaQuery.of(context).size.width,

                              margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 1,
                                        spreadRadius: 0.5,
                                        offset: Offset(0,0)
                                    )
                                  ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0, left: 15, right: 15),
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          keyboard = true;
                                        });
                                      },
                                      controller: fullName,
                                      cursorHeight: 20,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9,+]')),
                                      ],
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                          height: 1,
                                          color: Colors.black.withOpacity(0.6), fontSize: 17),
                                      decoration: const InputDecoration(

                                        hintText: "**** **** **** ****",
                                        hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),


                            //Expiration Date Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 1,
                                        spreadRadius: 0.5,
                                        offset: Offset(0,0)
                                    )
                                  ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0, left: 15, right: 15),
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          keyboard = true;
                                        });
                                      },
                                      //controller: fullName,
                                      cursorHeight: 20,
                                      style: TextStyle(
                                          height: 1,
                                          color: Colors.black.withOpacity(0.6), fontSize: 17),
                                      decoration: const InputDecoration(

                                        hintText: "MM/YYYY",
                                        hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            //CVV Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 1,
                                        spreadRadius: 0.5,
                                        offset: Offset(0,0)
                                    )
                                  ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0, left: 15, right: 15),
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          keyboard = true;
                                        });
                                      },
                                      //controller: fullName,
                                      cursorHeight: 20,
                                      style: TextStyle(
                                          height: 1,
                                          color: Colors.black.withOpacity(0.6), fontSize: 17),
                                      decoration: const InputDecoration(

                                        hintText: "CVV",
                                        hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            const SizedBox(height: 15,),

                            Container(
                              height: MediaQuery.of(context).size.height*0.06,
                              margin: EdgeInsets.only(
                                  bottom: 15, top: 15, right: 15, left: 15),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10, top: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xfffcc817)
                              ),

                              child: Text("Save", style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.06,
              margin: EdgeInsets.only(
                  bottom: 15, top: 15, right: 15, left: 15),
              padding: EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xfffcc817)
              ),

              child: Text("Add a new payment method", style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),),
            ),
          ),
        )
    );
  }
}