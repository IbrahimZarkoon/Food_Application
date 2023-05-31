import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/MyOrders.dart';
import 'package:food_app/Screens/MyReservations.dart';

import '../Screens/Dashboard.dart';
import 'Headings.dart';

Widget customDrawer(BuildContext context)
{
  return Drawer(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))),
    elevation: 1,
    child: Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        //Top Container
        Container(
          padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(0)),
            color: Color(0xfffcc817).withOpacity(0.5),

          ),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              //Profile Image Container
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color(0xfffcc817),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Icon(Icons.person),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Welcome",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 12),),
                  const SizedBox(height: 5,),
                  Text("Ibrahim Khan Zarkoon",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 12),),

                ],
              ),

              Spacer(),

              Text("Edit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(
                  0xff947200)),)

            ],
          ),
        ),

        GestureDetector(
            onTap: ()
            {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 1)));
            },
            child: drawerCon(context, "Menu", Icons.menu_book_outlined)),

        GestureDetector(
            onTap: ()
            {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 1)));
            },
            child: drawerCon(context, "Deals & Offers", Icons.local_offer_outlined)),

        shadowLine(context),

        GestureDetector(
            onTap: ()
            {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => MyOrders()));
            },
            child: drawerCon(context, "My Orders", Icons.history)),

        GestureDetector(
            onTap: ()
            {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 3)));
            },
            child: drawerCon(context, "Track Order", Icons.track_changes_outlined)),

        GestureDetector(
            onTap: ()
            {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => MyReservations()));
            },
            child: drawerCon(context, "My Reservations", Icons.bookmarks_outlined)),

        GestureDetector(
            onTap: ()
            {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 4)));
            },
            child: drawerCon(context, "Reserve a table", Icons.bookmark_added_outlined)),

        shadowLine(context),

        drawerCon(context, "Bulk Order", Icons.food_bank_outlined),

        shadowLine(context),

        drawerCon(context, "Feedback", Icons.feedback_outlined),

        drawerCon(context, "Terms & Conditions", Icons.receipt_long_outlined),

        drawerCon(context, "Contact Us", Icons.headphones_outlined),


      ],
    ),
  );
}

Widget drawerCon(BuildContext context,String title,IconData icon)
{
  return Container(
    margin: const EdgeInsets.only(
        top: 10, bottom: 10, left: 0, right: 0),
    padding:
    const EdgeInsets.only(top: 0, bottom: 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      // boxShadow: [
      //   BoxShadow(
      //       offset: const Offset(0, 0),
      //
      //       blurRadius: 1.5,
      //       color: Colors.black.withOpacity(0.2))
      // ],
    ),
    child: Container(
      height: MediaQuery.of(context).size.height *
          0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffffffff),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(5)),
        contentPadding: const EdgeInsets.all(0),

        title: Padding(
          padding: const EdgeInsets.only(
              bottom: 15, left: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
                color:
                Colors.black.withOpacity(0.7),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 12,
                    color: Colors.black
                        .withOpacity(0.75)),
              ),
            ],
          ),
        ),

        // trailing:  Padding(
        //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
        //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
        // ),

        //contentPadding: const EdgeInsets.all(10),

        style: ListTileStyle.drawer,
      ),
    ),
  );
}