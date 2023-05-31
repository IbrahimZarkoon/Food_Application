import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/FilterAccordian.dart';
import 'package:food_app/CustomWidgets/Headings.dart';
import 'package:food_app/CustomWidgets/SideonContainer.dart';
import 'package:food_app/CustomWidgets/SubFilterAccordian.dart';
import 'package:food_app/CustomWidgets/SubFilterSideOn.dart';
import 'package:food_app/Modals/CartProvider.dart';
import 'package:food_app/Screens/MenuPage.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  SingleItem(
      {Key? key, required this.title, required this.image, required this.desc, required this.price})
      : super(key: key);

  String title;
  String image;
  String desc;
  String price;

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  FocusNode specialIns = FocusNode();

  String instructions = "Go with merchant recommendation";


  @override
  Widget build(BuildContext context) {

    var cartProv = Provider.of<CartProvider>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    //Image Container
                    Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage("${widget.image}"),
                              fit: BoxFit.cover)),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10,
                              top: MediaQuery.of(context).size.height * 0.05),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 1.5,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1))
                              ],
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.keyboard_arrow_left_outlined,
                            color: Colors.black.withOpacity(0.8),
                            size: 22,
                          ),
                        ),
                      ),
                    ),

                    //const SizedBox(height: 20,),

                    //Title
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, bottom: 10),
                      child: Text(
                        "${widget.title}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),

                    //Description
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 15, bottom: 15),
                      child: Text(
                        "${widget.desc}",
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.6)),
                      ),
                    ),

                    //Shadow Container
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xfff1f1f1),
                        border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5),bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5))
                      ),
                    ),

                    FilterAccordion(title: "Recommended Sides and Apps", content: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          SideOnContainer(title: "6 Mozzarella Sticks", price: "9.99",isLast: false,),

                          SideOnContainer(title: "6 Garlic Rolls", price: "8.99",isLast: false,),

                          SideOnContainer(title: "6 Wings", price: "10.99",isLast: false,),

                          SideOnContainer(title: "French Fries", price: "5.99",isLast: false,),

                          SideOnContainer(title: "Large Mac & Cheese", price: "8.99",isLast: true,),

                        ],
                      ),
                    ), optional: true,limit: 5,),

                    //Shadow Container
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color(0xfff1f1f1),
                          border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5),bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5))
                      ),
                    ),

                    FilterAccordion(title: "Recommended Beverages", content: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          //Can Soda
                          SubFilterAccordian(title: "Can Soda",price: "1.99", content: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                SubFilterSideOn(title: "Coke", price: "9.99",isLast: false,),

                                SubFilterSideOn(title: "Diet Coke", price: "8.99",isLast: false,),

                                SubFilterSideOn(title: "Sprite", price: "10.99",isLast: false,),

                                SubFilterSideOn(title: "Perrier", price: "5.99",isLast: false,),

                                SubFilterSideOn(title: "Redbull", price: "8.99",isLast: true,),

                              ],
                            ),
                          ),),

                          SideOnContainer(title: "Water", price: "1.99",isLast: false,),

                          SideOnContainer(title: "2L Sodas", price: "5.99",isLast: true,),


                        ],
                      ),
                    ), optional: true, limit: 3,),

                    //Shadow Container
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color(0xfff1f1f1),
                          border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5),bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5))
                      ),
                    ),

                    FilterAccordion(title: "Recommended Desserts", content: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          SideOnContainer(title: "Tiramisu", price: "7.99",isLast: false,),


                          SideOnContainer(title: "Regular Cheesecake", price: "7.99",isLast: true,),

                        ],
                      ),
                    ), optional: true,limit: 2,),

                    //Shadow Container
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color(0xfff1f1f1),
                          border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5),bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5))
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 15),
                      child: Text("If item is unavailable",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black.withOpacity(0.2))
                      ),
                      margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                      padding: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
                      child: DropdownButton<String>(
                        elevation: 0,
                        underline: SizedBox(),
                        value: instructions,
                        borderRadius: BorderRadius.circular(5),
                        style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.8)),
                        hint: Text('Select an option'),
                        onChanged: (value) {
                          setState(() {
                            instructions = value!;
                          });
                        },
                        items: <String>['Go with merchant recommendation', 'Contact me', 'Cancel the entire order']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    //Special Instructions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        GestureDetector(
                          onTap: ()
                          {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    child: GestureDetector(
                                      onTap: ()
                                      {
                                        specialIns.unfocus();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
                                        height: specialIns.hasFocus? MediaQuery.of(context).size.height*.6 : MediaQuery.of(context).size.height*.3,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.2),
                                                offset: const Offset(0, -10),
                                                blurRadius: 15,
                                                spreadRadius: 1,
                                              )
                                            ],
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Colors.white),
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            children: [

                                              Headings(context, "Add special instructions"),

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
                                                  focusNode: specialIns,
                                                  onTap: () {
                                                    specialIns.requestFocus();


                                                  },
                                                  cursorColor: Color(0xff444444),
                                                  maxLines: 5,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                      EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                                      border: InputBorder.none,
                                                      hintText: 'Special item instructions',
                                                      hintStyle: TextStyle(fontSize: 12)),
                                                ),
                                              ),

                                              //Save Container
                                              Container(
                                                margin: const EdgeInsets.only(top: 0,bottom: 20,left: 15,right: 15),
                                                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 0),
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    //border: Border.all(width: 2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: const Offset(0, 0),
                                                        color: Colors.black.withOpacity(0.1),
                                                        blurRadius: 5,
                                                      )
                                                    ],
                                                    color: const Color(0xffffec00)
                                                ),

                                                child: GestureDetector(
                                                  onTap: ()
                                                  {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                      padding: const EdgeInsets.only(left: 0,top: 5,bottom: 5),
                                                      child: const Text("Save",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15),)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                            margin: EdgeInsets.only(top: 20,bottom: 20),
                            decoration: BoxDecoration(
                                color: Color(0xfff1f1f1),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..scale(-1.0, 1.0, 1.0),
                                  child: Icon(Icons.message_outlined,size: 18,color: Colors.black.withOpacity(0.8),),
                                ),
                                const SizedBox(width: 10,),
                                Text("Special Instructions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black.withOpacity(0.8)),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ),

          Positioned(
              left: 0,right: 0,bottom: 0,
              child: Container(
            color: Colors.transparent,

            child: GestureDetector(
              onTap: ()
              {
                cartProv.cartLength += 1;
                cartProv.totalPrice += double.parse("${widget.price}");

                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xffffec00),
                    borderRadius: BorderRadius.circular(40)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Icon(Icons.shopping_cart,color: Colors.black.withOpacity(0.8),size: 20,),
                        const SizedBox(width: 10,),
                        //Add to Cart
                        Text("Add to cart",
                          style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),),
                      ],
                    ),

                    //Cart Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        Text("\$ ${widget.price}",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)

                      ],
                    )

                  ],
                ),

              ),
            ),

          ))
        ]));
  }
}
