import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/EditReservationSheet.dart';

import '../CustomWidgets/Headings.dart';

class MyReservations extends StatefulWidget {
  const MyReservations({Key? key}) : super(key: key);

  @override
  State<MyReservations> createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black.withOpacity(0.8),
                  size: 22,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "My Reservations",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 16),
                ),
              ],
            ),
            leadingWidth: 0,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TabBar(
                  indicatorColor: Color(0xfffcc817),
                  labelColor: Colors.black.withOpacity(0.8),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.black.withOpacity(0.6),
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal),
                  tabs: const [
                    //Upcoming Tab
                    Tab(
                      text: "Upcoming",
                    ),

                    //History Tab
                    Tab(
                      text: "History"
                          "",
                    )
                  ]),
              Expanded(
                  child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  //UpComing Tab
                  upComingTab(context),

                  //History Tab
                  historyTab(context)
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget upComingTab(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
              children: [
                //1st Reservation
                reserveCon(
                    context,
                    "https://images.pexels.com/photos/3534750/pexels-photo-3534750.jpeg?cs=srgb&dl=pexels-adrien-olichon-3534750.jpg&fm=jpg",
                    "Meat & Cheese Branch",
                    "1 June",
                    "18:00",
                    "4"),

                //2nd Reservation
                reserveCon(
                    context,
                    "https://e0.pxfuel.com/wallpapers/529/408/desktop-wallpaper-fine-dining-restaurant-fine-cuisine.jpg",
                    "FENIX Branch",
                    "23 July",
                    "20:00",
                    "2"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget historyTab(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
              children: [
                //1st Reservation
                expiredCon(
                    context,
                    "https://images.pexels.com/photos/3534750/pexels-photo-3534750.jpeg?cs=srgb&dl=pexels-adrien-olichon-3534750.jpg&fm=jpg",
                    "Meat & Cheese Branch",
                    "1 June",
                    "18:00",
                    "4"),

                //2nd Reservation
                expiredCon(
                    context,
                    "https://e0.pxfuel.com/wallpapers/529/408/desktop-wallpaper-fine-dining-restaurant-fine-cuisine.jpg",
                    "FENIX Branch",
                    "23 July",
                    "20:00",
                    "2"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget reserveCon(BuildContext context, String image, String title,
      String date, String time, String guests) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                offset: Offset(0, 1),
                blurRadius: 1.5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image & Details Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Image Container
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 130,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),

              //Details Container
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.8)),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Date Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //People Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_alt_outlined,
                        size: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        guests,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),

          //Edit / Cancel Container
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Edit Container
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return EditReservationSheet(image: image, title: title, date: date, time: time, guests: int.parse(guests));
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xfffcc817),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                spreadRadius: 1,
                                offset: Offset(0, 0),
                                blurRadius: 1)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Edit",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 15,
                ),

                //Cancel Container
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xfffcc817),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 1,
                              offset: Offset(0, 0),
                              blurRadius: 1)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.delete,
                          size: 16,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget expiredCon(BuildContext context, String image, String title,
      String date, String time, String guests) {

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                offset: Offset(0, 1),
                blurRadius: 1.5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image & Details Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Image Container
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 130,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),

              //Details Container
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.8)),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Date Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //People Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_alt_outlined,
                        size: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        guests,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),

          //Edit / Cancel Container
          GestureDetector(
            onTap: ()
            {
              showModalBottomSheet(
                isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [

                              //Image Container
                              Container(
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(image), fit: BoxFit.cover)),
                              ),

                              //Details Container
                              Container(
                                padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(0.8),
                                              fontSize: 18),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.people_alt_outlined,
                                              size: 20,
                                              color: Colors.black.withOpacity(0.8),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              guests,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.black.withOpacity(0.8)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    Text(
                                      "Features: Outdoor Dine in, table 3 by the window.",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black.withOpacity(0.6)),
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    shadowLine(context),



                                    const SizedBox(
                                      height: 15,
                                    ),

                                    Text(
                                      "Day: $date",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.8)),
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    //Time Row
                                    Text(
                                      "Time: $time",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.8)),
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    //Guests Row
                                    Text(
                                      "Number of guests: $guests",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.8)),
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    Text(
                                      "Addressed to: Ibrahim Khan Zarkoon",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(0.8)),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: ()
                          {
                            Navigator.pop(context);
                          },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xfffcc817),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        spreadRadius: 1,
                                        offset: Offset(0, 1),
                                        blurRadius: 1)
                                  ]
                              ),

                              child: Text("Done",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 14,fontWeight: FontWeight.bold),),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xfffcc817),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                        blurRadius: 1)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.info,
                    size: 16,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "View Details",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
