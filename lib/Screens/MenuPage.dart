import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/Headings.dart';
import 'package:food_app/CustomWidgets/SearchBar.dart';
import 'package:food_app/CustomWidgets/customAppBar.dart';
import 'package:food_app/CustomWidgets/toggleButton.dart';
import 'package:food_app/Modals/CartProvider.dart';
import 'package:food_app/Screens/Dashboard.dart';
import 'package:provider/provider.dart';

import '../CustomWidgets/ViewCartContainer.dart';
import '../CustomWidgets/addToCartDialog.dart';
import 'SingleItem.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool handCutFries = true;
  bool loadedFries = false;
  bool flatBreads = false;
  bool burgers = false;
  bool deals = false;
  bool dips = false;

  bool catList = false;

  final FocusNode _focusNode = FocusNode();

  ScrollController _sc = ScrollController();

  final GlobalKey C0 = GlobalKey();
  final GlobalKey C1 = GlobalKey();
  final GlobalKey C2 = GlobalKey();
  final GlobalKey C3 = GlobalKey();
  final GlobalKey C4 = GlobalKey();
  final GlobalKey C5 = GlobalKey();
  final GlobalKey C6 = GlobalKey();

  //ScrollController _HeadingSC = ScrollController();

  void scrollToHeading(GlobalKey key) {

    final RenderBox container1RenderBox = key.currentContext!.findRenderObject() as RenderBox;
    final offSet = container1RenderBox.localToGlobal(Offset(0, MediaQuery.of(context).size.height*0.5));

    // RenderObject? headingObject = key.currentContext?.findRenderObject();
    // double? headingOffset = headingObject?.getTransformTo(null)?.getTranslation().y;

    _sc.animateTo(
      offSet.dy + MediaQuery.of(context).size.height*0.2,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,

    );
  }

  _scListener() {
    if (_sc.offset >=
        _sc.position.minScrollExtent +
            MediaQuery.of(context).size.height * 0.15 && catList == false) {
      setState(() {
        catList = true;
      });
    }

    if (_sc.offset <=
        _sc.position.minScrollExtent +
            MediaQuery.of(context).size.height * 0.15 && catList == true) {
      setState(() {
        catList = false;
      });
    }
  }

  @override
  void dispose() {

    _sc.removeListener(_scListener);
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cartProv = Provider.of<CartProvider>(context, listen: false);

    _sc.addListener(_scListener);




    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar:
      PreferredSize(preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.2), child: AnimatedContainer(
        duration: Duration(milliseconds: 750),
        curve: Curves.ease,
        height: catList? MediaQuery.of(context).size.height * 0.1 : 0,
        //color: Colors.red,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1))),
        ),
        child: Row(
          children:[

            const SizedBox(width: 5,),

            GestureDetector(
                onTap: ()
                {
                  setState(() {
                    _focusNode.requestFocus();
                    _sc.animateTo(MediaQuery.of(context).size.height * 0.05, duration: Duration(milliseconds: 500), curve: Curves.ease);
                  });
                },
                child: Icon(CupertinoIcons.search_circle_fill,size: catList? 40 : 0,color: Colors.black.withOpacity(0.9),)),


            Expanded(
              child: ListView(
              physics: const BouncingScrollPhysics(),
              padding:
              const EdgeInsets.only(left: 10, bottom: 15, top: 15),
              scrollDirection: Axis.horizontal,
              children: [



                //HandCut Fries
                GestureDetector(
                  onTap: ()
                {
                  setState(() {
                    handCutFries = !handCutFries;
                    loadedFries = false;
                    flatBreads = false;
                    burgers = false;
                    deals = false;
                    dips = false;
                  });
                },
                  child: horizontalListCon(
                      context, "HandCut Fries", handCutFries,C1),
                ),

                GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      handCutFries = false;
                      loadedFries = !loadedFries;
                      flatBreads = false;
                      burgers = false;
                      deals = false;
                      dips = false;
                    });
                  },
                  child: horizontalListCon(
                      context, "Loaded Fries", loadedFries,C2),
                ),

                GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        handCutFries = false;
                        loadedFries = false;
                        flatBreads = !flatBreads;
                        burgers = false;
                        deals = false;
                        dips = false;
                      });
                    },
                    child: horizontalListCon(context, "Flatbreads", flatBreads,C3)),

                GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        handCutFries = false;
                        loadedFries = false;
                        flatBreads = false;
                        burgers = !burgers;
                        deals = false;
                        dips = false;
                      });
                    },
                    child: horizontalListCon(context, "Burgers", burgers,C4)),

                GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        handCutFries = false;
                        loadedFries = false;
                        flatBreads = false;
                        burgers = false;
                        deals = !deals;
                        dips = false;
                      });
                    },
                    child: horizontalListCon(context, "Deals", deals,C5)),

                GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        handCutFries = false;
                        loadedFries = false;
                        flatBreads = false;
                        burgers = false;
                        deals = false;
                        dips = !dips;
                      });
                    },
                    child: horizontalListCon(context, "Dips & Drinks", dips,C6)),
              ],
          ),
            ),]
        ),
      )),
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            //primary: true,
            controller: _sc,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(children: [

                  //Top Image Container
                  Stack(children: [
                      AnimatedContainer(
                        alignment: Alignment.topLeft,
                        curve: Curves.ease,
                        margin: EdgeInsets.only(bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        duration: Duration(milliseconds: 750),
                        height: catList? 0 : MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=600,height=400,format=auto,quality=80/https://doordash-static.s3.amazonaws.com/media/store/header/62268c22-513d-4dad-9d9a-ac0ed0f3ff7b.png"),
                                fit: BoxFit.cover)),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      DashboardPage(tabindex: 0))),
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.black.withOpacity(0.25),
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
                      Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)),
                                  height: 35,
                                  child: DeliveryPickupToggle()),
                            ],
                          ))
                    ]),


              ListView(
                //controller: _HeadingSC,

                //primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                    top: 15, bottom: 20, left: 0, right: 0),
                physics: BouncingScrollPhysics(),
                children: [



                  //Discount Container
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xfffddb60),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 5, top: 0, bottom: 0),
                            child: Text(
                              "Get \$5 off any order of \$35 or more from our store.",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/414-4146558_png-vector-christmas-gift-box-gift-transparent-png-removebg-preview.png"),
                                  fit: BoxFit.contain)),
                        )
                      ],
                    ),
                  ),

                  //Search Bar
                  SearchBar(context,_focusNode),

                  //Featured Items Headings
                  listHeadings(context, "Featured Items",C0),

                  //Featured Items List
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.31,
                    child: ListView(
                      //controller: _controller,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 5),
                      children: [

                        //1st Item
                        featuredItemsCon(context, "Meat Lovers Pizza", "https://media-cdn.tripadvisor.com/media/photo-s/12/89/53/ed/20180403-194423-largejpg.jpg",
                            "14\"", "17.99"),

                        //2nd Item
                        featuredItemsCon(context, "Hawaiian Pizza", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAKgW7AnRMIh-nNmnq3d0PLYYg0YkbwiuTeQ&usqp=CAU", "18\"", "21.99"),

                        //3rd Item
                        featuredItemsCon(context, "Meat Lovers Pizza", "https://media-cdn.tripadvisor.com/media/photo-s/12/89/53/ed/20180403-194423-largejpg.jpg",
                            "14\"", "17.99"),

                        //4th Item
                        featuredItemsCon(context, "Hawaiian Pizza", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAKgW7AnRMIh-nNmnq3d0PLYYg0YkbwiuTeQ&usqp=CAU", "18\"", "21.99")

                      ],
                    ),
                  ),

                  //HandCut Fries Heading
                  listHeadings(context, "HandCut Fries",C1),

                  //HandCut Fries List
                  Container(
                    child: Column(
                      children: [
                        //1st Item Con
                        itemsCon(
                            context,
                            "Plain Fries",
                            "350",
                            "The true king of hand cut fries is",
                            "https://www.optp.biz:3000/47873a10-96f2-11ed-b451-b39edbbe2639-LargePlain-Fries_variant_0-2023-01-18053804.jpg"),

                        //2nd Item
                        itemsCon(
                            context,
                            "Masala Fries",
                            "350",
                            "The true king of hand cut fries is",
                            "https://www.optp.biz:3000/4eba2ef0-96f2-11ed-9697-bdc067c69a53-LargeMasala-Fries_variant_0-2023-01-18053816.jpg"),

                        //3rd Item
                        itemsCon(
                            context,
                            "Garlic Mayo Fries",
                            "450",
                            "The true king of hand cut fries is",
                            "https://www.optp.biz:3000/47873a10-96f2-11ed-b451-b39edbbe2639-LargeGarlic-Mayo-Fries_variant_0-2023-01-18053804.jpg"),

                        //4th Item
                        itemsCon(
                            context,
                            "Chedder Cheese Fries",
                            "450",
                            "Hand-cut fries tossed in our signat",
                            "https://www.optp.biz:3000/4eba2ef0-96f2-11ed-a3f5-7f4d3a939590-LargeCheddar-Cheese-Fries_variant_0-2023-01-18053816.jpg"),
                      ],
                    ),
                  ),

                  //Loaded Fries Heading
                  listHeadings(context, "Loaded Fries",C2),

                  //Loaded Fries List
                  Container(
                    child: Column(
                      children: [
                        //1st Item
                        itemsCon(
                            context,
                            "Loaded Bomber Fries",
                            "790",
                            "300 gms of natural hand-cut fries a",
                            "https://www.optp.biz:3000/23dbd920-c2f5-11ed-9f53-315352667216-LOADED-BOMBER-FRIES_variant_0-2023-03-15054924.jpg"),

                        //2nd Item
                        itemsCon(
                            context,
                            "Loaded Nashville Fries",
                            "850",
                            "300 gms of natural hand-cut fries ",
                            "https://www.optp.biz:3000/26b69770-c2f5-11ed-b5f0-b5de063cb7eb-loaded-nashville-fries_variant_0-2023-03-15054929.jpg"),
                      ],
                    ),
                  ),

                  listHeadings(context, "Flatbreads",C3),

                  //Flatbreads List
                  Container(
                    child: Column(
                      children: [
                        //1st Item
                        itemsCon(
                            context,
                            "Saudi Chicken Sandwich",
                            "550",
                            "The saudi chicken topped with garlic",
                            "https://www.optp.biz:3000/af959bc0-f2ea-11ed-9e78-3fafbb18e116-SawdiChickenSandwich_variant_0-2023-05-15063530.jpg"),

                        //2nd Item
                        itemsCon(
                            context,
                            "Beef Doner",
                            "590",
                            "Premium lean meat filled with our special",
                            "https://www.optp.biz:3000/26b69770-c2f5-11ed-b5f0-b5de063cb7eb-beefdoner(1)_variant_0-2023-03-15054929.jpg")
                      ],
                    ),
                  ),

                  listHeadings(context, "Burgers",C4),

                  //Burgers List
                  Container(
                    child: Column(
                      children: [
                        //1st Item
                        itemsCon(
                            context,
                            "NASHVILLE HOT",
                            "550",
                            "85gm Fried chicken leg filled & Nas",
                            "https://www.optp.biz:3000/26b69770-c2f5-11ed-b5f0-b5de063cb7eb-NASHVILLEHOT_variant_0-2023-03-15054929.jpg"),

                        //2nd Item
                        itemsCon(
                            context,
                            "SOUTHERN ZING",
                            "750",
                            "Crispy breast fillet of 150 grams ",
                            "https://www.optp.biz:3000/23babc90-c2f5-11ed-b690-19a95b5a1898-SOUTHERNZING_variant_0-2023-03-15054924.jpg"),

                        //3rd Item
                        itemsCon(
                            context,
                            "Smash Beef Double",
                            "890",
                            "A juicy double smash patty topped ",
                            "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-SMASHBEEFDOUBLE_variant_0-2023-03-15054929.jpg")
                      ],
                    ),
                  ),

                  listHeadings(context, "Deals",C5),

                  //Deals List
                  Container(
                    child: Column(
                      children: [
                        //1st Item
                        itemsCon(
                            context,
                            "ShotGun Magic Meal",
                            "590",
                            "Share the magic with ShotGun Magic",
                            "https://www.optp.biz:3000/af959bc0-f2ea-11ed-858c-6580e09b1e33-ShotGun+fries+Drink-2023-05-15063530.jpg"),

                        //2nd Item
                        itemsCon(
                            context,
                            "ShotGun Fiesta",
                            "990",
                            "Get your favorite two Shotgun burgers",
                            "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-SHOTGUNFIESTA(1)-2023-03-15054929.jpg"),
                      ],
                    ),
                  ),

                  listHeadings(context, "Dips & Drinks",C6),

                  //Dips & Drinks List
                  Container(
                    child: Column(
                      children: [
                        //1st Item
                        itemsCon(
                            context,
                            "Coke",
                            "180",
                            "500ml coke for you to quench your thirst",
                            "https://www.optp.biz:3000/23dbd920-c2f5-11ed-9f53-315352667216-COKE_variant_0-2023-03-15054924.jpg"),
                        //2nd Item
                        itemsCon(
                            context,
                            "Sprite",
                            "180",
                            "500ml coke for you to quench your thirst",
                            "https://www.optp.biz:3000/23babc90-c2f5-11ed-b690-19a95b5a1898-SPRITE_variant_0-2023-03-15054924.jpg"),

                        //3rd Item
                        itemsCon(
                            context,
                            "Fanta",
                            "180",
                            "500ml coke for you to quench your thirst",
                            "https://www.optp.biz:3000/26b69770-c2f5-11ed-b5f0-b5de063cb7eb-FANTA_variant_0-2023-03-15054929.jpg"),

                        //4th Item
                        itemsCon(
                            context,
                            "Mineral Water",
                            "90",
                            "Keep yourself hydrated on a busy sunny day",
                            "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-MINERALWATER_variant_0-2023-03-15054929.jpg"),

                        //5th Item
                        itemsCon(
                            context,
                            "Garlic Mayo",
                            "120",
                            "Taste the wonders of sauce world from",
                            "https://www.optp.biz:3000/26b69770-c2f5-11ed-b5f0-b5de063cb7eb-GARLICMAYO_variant_0-2023-03-15054929.jpg"),

                        //6th Item
                        itemsCon(
                            context,
                            "BBQ",
                            "120",
                            "Taste the wonders of sauce world from",
                            "https://www.optp.biz:3000/26b69770-c2f5-11ed-b5f0-b5de063cb7eb-BBQ_variant_0-2023-03-15054929.jpg"),

                        //7th Item
                        itemsCon(
                            context,
                            "Chedder Cheese",
                            "120",
                            "Taste the wonders of sauce world from",
                            "https://www.optp.biz:3000/26e9b560-c2f5-11ed-82a7-67362736daff-CHEDDARCHEESE_variant_0-2023-03-15054929.jpg"),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        if (cartProv.cartLength != 0)
          Positioned(left: 0, right: 0, bottom: 0, child: ViewCartCon())
      ]),
    );
  }

  Widget listHeadings(BuildContext context, String heading,GlobalKey key) {
    return Container(
      key: key,
      padding: const EdgeInsets.only(top: 0, bottom: 20, left: 15, right: 15),
      child: Row(
        children: [
          Text(heading,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ],
      ),
    );
  }

  Widget horizontalListCon(BuildContext context, String title, bool active, GlobalKey key) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   active = !active;
        // });
        if(key == C1) {
          _sc.animateTo(
            MediaQuery.of(context).size.height*0.5,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,

          );
        }
        if(key == C6) {
          _sc.animateTo(
            _sc.position.maxScrollExtent-MediaQuery.of(context).size.height*0.5,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,

          );
        }
        if(key != C1 && key != C6) scrollToHeading(key);

      },
      child: Container(
        alignment: Alignment.center,
        //width: MediaQuery.of(context).size.width*0.25,

        margin: const EdgeInsets.only(right: 15, top: 5, bottom: 5),
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5, top: 5),

        decoration: BoxDecoration(
            color: active? Color(0xfffed301) : Colors.black.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 1,
                  offset: const Offset(0, 0))
            ]),
        child: Text(
          title,
          style: TextStyle(
              color: active ? Colors.black.withOpacity(0.8) : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }

  Widget itemsCon(BuildContext context, String title, String price, String desc,
      String image) {
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
                  title: title,
                  price: price,
                  image: image,
                  desc: desc,
                ));

        if (result != false) {
          setState(() {
            //dialogResult = result;
          });
        }
      },
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.black.withOpacity(0.05), width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon(
              //   Icons.favorite_outline,
              //   color: Color(0xffd50a0a),
              //   size: 30,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 2.25),
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Color(0xffd50a0a),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 2.25),
                child: Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "PKR $price",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          ),
        ),
        Positioned(
            top: 20,
            bottom: 30,
            right: 0,
            child: Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image))),
            )),
        //+ Positioned
        Positioned(
            right: 35,
            bottom: 35,
            child: Container(
              padding: EdgeInsets.all(5),
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
                CupertinoIcons.add,
                color: Colors.black.withOpacity(0.8),
                size: 18,
              ),
            ))
      ]),
    );
  }

  Widget featuredItemsCon(BuildContext context,String title, String image,String desc, String price)
  {
    return GestureDetector(
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
              return Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, -10),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: SingleItem(title: title,image: image,desc: desc,price: price,),
              );
            });
      },
      child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height:
                    MediaQuery.of(context).size.height * 0.2,
                    margin: const EdgeInsets.only(right: 10),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.white,
                    ),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                image),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(
                    textAlign: TextAlign.center,
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(
                    textAlign: TextAlign.center,
                    desc,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(
                    textAlign: TextAlign.center,
                    "\$$price",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black),
                  ),

                ],
              ),
            ),

            Positioned(
                right: 20,
                bottom: 90,
                child: Container(
                  padding: EdgeInsets.all(5),
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
                    CupertinoIcons.add,
                    color: Colors.black.withOpacity(0.8),
                    size: 18,
                  ),
                ))
          ]
      ),
    );
  }
}
