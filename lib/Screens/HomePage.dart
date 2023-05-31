import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/CustomDrawer.dart';
import 'package:food_app/CustomWidgets/Headings.dart';
import 'package:food_app/CustomWidgets/ViewCartContainer.dart';
import 'package:food_app/CustomWidgets/addToCartDialog.dart';
import 'package:food_app/CustomWidgets/customAppBar.dart';
import 'package:food_app/Screens/Dashboard.dart';
import 'package:food_app/Screens/MenuPage.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Modals/CartProvider.dart';
import 'SingleItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  bool delivery = true;
  bool collect = false;

  final paginationController =
      PageController(viewportFraction: 0.8, keepPage: true);

  void updateHomePageState() {
    setState(() {
      // Update the state of the homepage here
    });
  }

  // bool dialogResult = false;

  // void _showDialog() async {
  //   final result = await showDialog<bool>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return MyDialog();
  //     },
  //   );
  //
  //   if (result != null) {
  //     setState(() {
  //       dialogResult = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    var cartProv = Provider.of<CartProvider>(context,listen: false);

    return Scaffold(

      drawer: customDrawer(context),

        backgroundColor: Color(0xffffffff),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: customAppBar()),
        body: Stack(
          children: [

            Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                      labelColor: Color(0xffda291c),
                      indicatorColor: Color(0xffda291c),
                      unselectedLabelColor: Colors.black.withOpacity(0.5),
                      tabs: [

                        //Delivery Tab
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              delivery = true;
                              collect = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.delivery_dining_outlined,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Delivery"),
                              ],
                            ),
                          ),
                        ),

                        //Collect Tab
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              delivery = false;
                              collect = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    CupertinoIcons.gift_alt,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Click & Collect"),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  Expanded(
                    child:
                        TabBarView(physics: NeverScrollableScrollPhysics(), children: [
                      DeliveryTab(context),
                      CollectTab(context),
                    ]),
                  )
                ],
              ),
            ),
          ),

            Positioned(
                left: 0,right: 0,bottom: 0,
                child: ViewCartCon())

          ]
        )

    );
  }

  DeliveryTab(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            latestDealsCarousel(context),

            Headings(context, "Order Again"),
            orderAgainSlider(context),

            //Categories Heading
            Padding(
              padding: EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   Text("Categories",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: Container(
                        decoration: BoxDecoration(
                            //border: Border(bottom: BorderSide(color: Colors.white,width: 1.0))
                        ),
                        child: Row(
                          children: [
                             Text("See all",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.8)),),

                            const SizedBox(width: 3,),

                             Icon(Icons.keyboard_arrow_right,color: Colors.black.withOpacity(0.8),size: 18,)
                          ],
                        )),
                  ),
                ],
              ),
            ),
            categoriesSlider(context),

            //Menu Container
            GestureDetector(
              onTap: ()
              {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => MenuPage()));
              },
              child: Stack(
                children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 60),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Color(0xff9b0000),
                      ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Our Menu",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xffffec00)),
                        child: Text(
                          "View Full Menu",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),

                  Positioned(
                      top: 15,bottom: 10,right: 0,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(

                            image: DecorationImage(image: NetworkImage("https://www.optp.biz/assets/images/menu.png"),
                            fit: BoxFit.scaleDown,filterQuality: FilterQuality.high)
                        ),
                      ))
              ]
              ),
            ),

            Headings(context, "Top Selling"),
            topSellingGrid(context),

            Headings(context, "Your daily deals"),
            yourDealsSlider(context),

            //Refer a friend Container
            Stack(
              children: [Shimmer.fromColors(period: Duration(milliseconds: 5000),highlightColor: Color(0xfffcc817).withOpacity(0.0), baseColor: Color(0xfffcc817),
                child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 30,bottom: 30,left: 15,right: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xfffcc817).withOpacity(0.75)
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text("",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

                    const SizedBox(height: 5,),

                    Text("",style: TextStyle(color: Colors.white,fontSize: 12
                    ),)

                  ],
                ),
              ),),

                Positioned(
                    
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 30,bottom: 30,left: 15,right: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      //color: Color(0xfffcc817)
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Refer a Friend",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.4)),),

                      const SizedBox(height: 5,),

                      Text("and both get a discount",style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 12
                      ),)

                    ],
                  ),
                ))

              ]
            ),

          ],
        ),
      ),
    );
  }

  CollectTab(BuildContext context) {
    return Container();
  }

  Widget latestDealsCarousel(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: MediaQuery.of(context).size.height * 0.275,
      child: Column(
        children: [
          CarouselSlider(
              items: [
                
                
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //         const SingleCategory(
                    //             tag: "latestdeals")));
                  },
                  child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5,left: 5,bottom: 5),
                      //padding: const EdgeInsets.only(
                      //top: 25, bottom: 25, left: 25, right: 15),
                      width: MediaQuery.of(context).size.width,
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // gradient: LinearGradient(
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter,
                        //     colors: [
                        //       Colors.black.withOpacity(0.65),
                        //       Colors.black.withOpacity(0.65)
                        //     ]),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffffffff),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://www.optp.biz:3000/e1c11a80-e82b-11ed-a233-5589b363f9b5-b91f76d0-d25a-11ed-a7ba-c32813026f3f-1083x547-web-banner_hero_image-2023-04-03200421_hero_image-2023-05-01142428.jpg"),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1.5,
                                offset: const Offset(2, 2))
                          ]),
                    ),
                    // Positioned(
                    //   left: 20,
                    //   right: 0,
                    //   top: 20,
                    //   bottom: 20,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Icon(
                    //             Icons.av_timer_outlined,
                    //             color: Colors.white,
                    //             size: 20,
                    //           ),
                    //           const SizedBox(
                    //             width: 5,
                    //           ),
                    //           Text("Ends 26 May",
                    //               style: TextStyle(
                    //                   color: Colors.white.withOpacity(0.9),
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 13)),
                    //         ],
                    //       ),
                    //
                    //       //const SizedBox(height: 10,),
                    //
                    //       Text(
                    //         "20% OFF ENTIRE FAST FOOD MENU",
                    //         maxLines: 3,
                    //         style: TextStyle(
                    //             color: Colors.white.withOpacity(0.9),
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 26),
                    //       ),
                    //
                    //       //const SizedBox(height: 10,),
                    //
                    //       Text("Shop now",
                    //           style: TextStyle(
                    //               color: Colors.white.withOpacity(0.9),
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 14,
                    //               decoration: TextDecoration.underline)),
                    //     ],
                    //   ),
                    // )
                  ]),
                )
              ],
              options: CarouselOptions(
                padEnds: true,
                height: MediaQuery.of(context).size.height * 0.25,
                viewportFraction: 0.9,
                enlargeCenterPage: false,
                initialPage: 0,
                scrollPhysics: BouncingScrollPhysics(),
              )),

          const SizedBox(
            height: 10,
          ),

          //Pagination
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                    radius: 10,
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: Color(0xff000000).withOpacity(0.8),
                    dotColor: Color(0xffd2d2d2)),
                count: 3,
                controller: paginationController,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget orderAgainSlider(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15,),
      height: MediaQuery.of(context).size.height * 0.225,
      //color: Colors.red,
      child: ListView(
        padding: const EdgeInsets.only(left: 2, right: 0, bottom: 2, top: 0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [

          //1st Item
          productCon(context, "Krunch Burger",
              "Crunchy chicken fillet, spicy mayo, lettuce, sandwiched",
              "250",
              "https://e1.pxfuel.com/desktop-wallpaper/547/640/desktop-wallpaper-burger-24-zinger-burger.jpg"),

          //2nd Item
          productCon(context, "Midnight Deal 3",
              "2 Mighty Zinger + regular fries",
              "640",
              "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-SHOTGUNFIESTA(1)-2023-03-15054929.jpg"),

          //3rd Item
          productCon(context, "Krunch Burger",
              "Crunchy chicken fillet, spicy mayo, lettuce, sandwiched",
              "250",
              "https://e1.pxfuel.com/desktop-wallpaper/547/640/desktop-wallpaper-burger-24-zinger-burger.jpg"),

          //4th Item
          productCon(context, "Midnight Deal 3", "2 Mighty Zinger + regular fries", "640", "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-SHOTGUNFIESTA(1)-2023-03-15054929.jpg")

        ],
      ),
    );
  }
  
  Widget yourDealsSlider(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15,),
      height: MediaQuery.of(context).size.height * 0.225,
      //color: Colors.red,
      child: ListView(
        padding: const EdgeInsets.only(left: 2, right: 0, bottom: 2, top: 0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          
          //1st Item
          dailyDealsCon(context, "https://images.deliveryhero.io/image/fd-pk/campaign-assets/aa2e9960-e07d-11ed-8abe-aed94c5ee6da/mobile_tile_EnOLGF.jpg?height=352&quality=95&width=288&"),

          //2nd Item
          dailyDealsCon(context, "https://images.deliveryhero.io/image/fd-pk/campaign-assets/f1a71ebf-dabf-11ed-ae1b-5e0bed0827dc/mobile_tile_EnsJTT.jpg?height=352&quality=95&width=288&"),

          //3rd Item
          dailyDealsCon(context, "https://images.deliveryhero.io/image/fd-pk/campaign-assets/ec474bb5-a45c-11ed-8838-6ee248fe5e12/mobile_tile_EnULog.png?height=352&quality=95&width=288&"),

          //4th Item
          dailyDealsCon(context, "https://images.deliveryhero.io/image/fd-pk/campaign-assets/de5c6ee1-b2a9-11ed-9724-c6236a2956fd/mobile_tile_Enkusg.jpg?height=352&quality=95&width=288&"),

          //5th Item
          dailyDealsCon(context, "https://images.deliveryhero.io/image/fd-pk/campaign-assets/0e999edc-ec7c-11ec-bc99-7697bf3a3447/mobile_tile_EnWUNe.png?height=352&quality=95&width=288&")

        ],
      ),
    );
  }

  Widget dailyDealsCon(BuildContext context,String image)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width/2.75,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1.5,
                spreadRadius: 1,
                offset: Offset(0,0)
            )
          ],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(image),
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover)
      ),
    );
  }

  Widget topSellingGrid(BuildContext context)
  {
    return Container(

      child: GridView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 15,bottom: 0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 0
        ),

        children: [

          //1st Item
          topSellingProductCon(context, "Krunch Burger",
              "Crunchy chicken fillet, spicy mayo, lettuce, sandwiched",
              "250",
              "https://e1.pxfuel.com/desktop-wallpaper/547/640/desktop-wallpaper-burger-24-zinger-burger.jpg"),

          //2nd Item
          topSellingProductCon(context, "Midnight Deal 3",
              "2 Mighty Zinger + regular fries",
              "640",
              "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-SHOTGUNFIESTA(1)-2023-03-15054929.jpg"),

          //3rd Item
          topSellingProductCon(context, "Krunch Burger",
              "Crunchy chicken fillet, spicy mayo, lettuce, sandwiched",
              "250",
              "https://e1.pxfuel.com/desktop-wallpaper/547/640/desktop-wallpaper-burger-24-zinger-burger.jpg"),

          //4th Item
          topSellingProductCon(context, "Midnight Deal 3", "2 Mighty Zinger + regular fries", "640", "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-SHOTGUNFIESTA(1)-2023-03-15054929.jpg")


        ],


      ),
    );
  }

  Widget productCon(BuildContext context,String productTitle,String productDesc,String price,String image)
  {
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<bool>(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            context: context,
            builder: (BuildContext context) => SingleItem(
              title: productTitle,
              price: price,
              image: image,
              desc: productDesc,
            ));

        if (result != false) {
          setState(() {
            //dialogResult = result;
          });
        }
      },
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 25,right: 15),
          width: MediaQuery.of(context).size.width / 2.25,
          padding:
          EdgeInsets.only(left: 15, bottom: 15, right: 15, top: 45),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 1.5,
                offset: Offset(0, 0)
              )
            ],
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffffffff)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productTitle,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productDesc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xffb7b7b7),fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                        color: Color(0xffffffff)
                    ),
                    child: Text("Rs. $price",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xfffcc817)
                    ),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 20,
                      color: Color(0xffffffff),
                    ),
                  )
                ],
              )
            ],
          ),
        ),

        Positioned(
          top: 0,
          left: 35,right: 35+15,
          child: Container(
            height: 60,
            foregroundDecoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),

              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.15)
                  ]),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),

                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.15)
                    ]),
                image: DecorationImage(image: NetworkImage(image),
                    fit: BoxFit.cover)
            ),
          ),
        )
      ]),
    );
  }

  Widget topSellingProductCon(BuildContext context,String productTitle,String productDesc,String price,String image)
  {
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<bool>(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            context: context,
            builder: (BuildContext context) => SingleItem(
              title: productTitle,
              price: price,
              image: image,
              desc: productDesc,
            ));

        if (result != false) {
          setState(() {
            //dialogResult = result;
          });
        }
      },
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 25,right: 0),
          width: MediaQuery.of(context).size.width / 2.25,
          padding:
          EdgeInsets.only(left: 15, bottom: 15, right: 15, top: 45),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 1.5,
                    offset: Offset(0, 0)
                )
              ],
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffffffff)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productTitle,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productDesc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xffb7b7b7),fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color(0xffffffff)
                    ),
                    child: Text("Rs. $price",
                        overflow: TextOverflow.ellipsis,
                        style:  TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xfffcc817)
                    ),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 20,
                      color: Color(0xffffffff),
                    ),
                  )
                ],
              )
            ],
          ),
        ),

        Positioned(
          top: 0,
          left: 35,right: 35+15,
          child: Container(
            height: 60,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.15)
                  ]),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(0.1)),

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.15)
                    ]),
                image: DecorationImage(image: NetworkImage(image),
                    fit: BoxFit.fitWidth)
            ),
          ),
        )
      ]),
    );
  }

  Widget categoriesSlider(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15,),
      height: MediaQuery.of(context).size.height * 0.1,
      //color: Colors.red,
      child: ListView(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [

          //1st Item
          categoriesProductCon(context, "Everyday Value", "https://images.deliveryhero.io/image/fd-pk/LH/u4kn-hero.jpg"),

          //2nd Item
          categoriesProductCon(context, "Ala Carte & Combos", "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHppbmdlciUyMGJ1cmdlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),

          //3rd Item
          categoriesProductCon(context, "Signature Boxes", "https://c1.wallpaperflare.com/preview/458/257/193/lunch-box-food-bob-side-dish-food-photography-delicious.jpg"),

          //4th Item
          categoriesProductCon(context, "Snacks & Beverages", "https://media.istockphoto.com/id/1149135424/photo/group-of-sweet-and-salty-snacks-perfect-for-binge-watching.jpg?s=170667a&w=0&k=20&c=_viaQkd-y80qTkDQ5d7jJEq-aCCsvbvPZCvu-_ZJWPU="),

          //5th Item
          categoriesProductCon(context, "Everyday Value", "https://images.deliveryhero.io/image/fd-pk/LH/u4kn-hero.jpg"),

          //6th Item
          categoriesProductCon(context, "Ala Carte & Combos", "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHppbmdlciUyMGJ1cmdlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),

          //7th Item
          categoriesProductCon(context, "Signature Boxes", "https://c1.wallpaperflare.com/preview/458/257/193/lunch-box-food-bob-side-dish-food-photography-delicious.jpg"),

          //8th Item
          categoriesProductCon(context, "Snacks & Beverages", "https://media.istockphoto.com/id/1149135424/photo/group-of-sweet-and-salty-snacks-perfect-for-binge-watching.jpg?s=170667a&w=0&k=20&c=_viaQkd-y80qTkDQ5d7jJEq-aCCsvbvPZCvu-_ZJWPU="),

        ],
      ),
    );
  }

  Widget categoriesProductCon(BuildContext context,String title,String image)
  {
    return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width/2.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    stops: [0.01,0.8],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xffffdb71),
                      Colors.white
                    ]
                )
            ),
            padding: EdgeInsets.only(left: 10,bottom: 10,top: 30,right: 65),
            child: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black.withOpacity(0.5)),),
          ),

          Positioned(
              right: 0+20,top: 10,bottom: 10,
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    image: DecorationImage(image: NetworkImage(image),
                        fit: BoxFit.cover)
                ),
              ))
        ]
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
}

