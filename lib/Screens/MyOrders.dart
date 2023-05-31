import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/ReOrderContainer.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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
                  "My Orders",
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
                      text: "Pending",
                    ),

                    //History Tab
                    Tab(text: "Completed")
                  ]),
              Expanded(
                  child: TabBarView(

                physics: BouncingScrollPhysics(),
                children: [
                  //Pending Tab
                  pendingTab(context),

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

  Widget pendingTab(BuildContext context) {
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

                //1st Order
                orderCon(context, "https://media-cdn.tripadvisor.com/media/photo-s/12/89/53/ed/20180403-194423-largejpg.jpg",
                    "Meaty Pizza", "19.99", "Expected to arrive: 8:32 PM, 30 May", "Kyiv's Home","Preparing"),

                //2nd Order
                orderCon(context, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAKgW7AnRMIh-nNmnq3d0PLYYg0YkbwiuTeQ&usqp=CAU",
                    "Hawaiian Pizza", "21.20", "Expected to arrive: now, 30 May", "Home", "Dispatched")


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

                //1st Order
                orderCon(context, "https://www.optp.biz:3000/47873a10-96f2-11ed-b451-b39edbbe2639-LargePlain-Fries_variant_0-2023-01-18053804.jpg",
                    "Plain Fries", "3.99", "Delivered: 10:32 PM, 27 May", "Kyiv's Home","Delivered"),

                //2nd Order
                orderCon(context, "https://www.optp.biz:3000/26b69770-c2f5-11ed-b5f0-b5de063cb7eb-NASHVILLEHOT_variant_0-2023-03-15054929.jpg",
                    "NASHVILLE HOT", "7.99", "Date: 10:15 PM, 27 May", "Kyiv's Home", "Cancelled"),

                //3rd Order
                orderCon(context, "https://media-cdn.tripadvisor.com/media/photo-s/12/89/53/ed/20180403-194423-largejpg.jpg",
                    "Meaty Pizza", "19.99", "Delivered: 8:00 PM, 25 May", "Home","Delivered"),

                //4th Order
                orderCon(context, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAKgW7AnRMIh-nNmnq3d0PLYYg0YkbwiuTeQ&usqp=CAU",
                    "Hawaiian Pizza", "21.20", "Date: 12:00 PM, 30 May", "Home", "Cancelled")


              ],
            )
          ],
        ),
      ),
    );
  }

  Widget orderCon(BuildContext context, String image, String title,
      String price, String timeDate, String location,String status) {

    return GestureDetector(
      onTap: ()
      {

        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context)
        {
          return ReOrder(image: image,title: title,price: price,timeDate: timeDate,location: location,status: status,);
        }
        );
      },
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(bottom: 15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                    blurRadius: 1.5)
              ]),
          child: Column(
            children: [
              //Image Container
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  image: DecorationImage(
                      image: NetworkImage(
                          image),
                      fit: BoxFit.cover),
                ),
              ),
              //const SizedBox(height: 10,),

              //Details Container
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Title & Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Title
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8)),
                        ),

                        //Price
                        Text("\$ $price",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.bold),)
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Title
                        Text(
                          timeDate,
                          style: TextStyle(
                              fontSize: 12, color: Colors.black.withOpacity(0.8)),
                        ),

                        //Ratings
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 18,
                              color: Color(0xffff5252),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              location,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              //ReOrder Container
              Container(
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                padding: EdgeInsets.only(top: 8,bottom: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffffec00),
                  borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          offset: Offset(0, 0),
                          blurRadius: 1)
                    ]
                ),
                child: Text("Select items to reorder",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 12),),
              )
            ],
          ),
        ),

        Positioned(
          top: 15,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffff5252),
                borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
              ),
              child: Text(status,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 11),),
            )
        )
      ]),
    );
  }
}
