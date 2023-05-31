import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Modals/CartProvider.dart';
import 'package:food_app/Screens/MenuPage.dart';
import 'package:food_app/Screens/TrackOrder.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'HomePage.dart';
import 'ReservedPage.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {

  var tabindex;
  DashboardPage({Key? key,required this.tabindex}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  int _selectedIndex = 0;
  bool user = true;

  final tabs = [
    const HomePage(), // 0
    const MenuPage(), //1
    const Cart(), //2
     TrackOrder(),
    const ReservedPage()
  ];

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = widget.tabindex;


    return SafeArea(
        child: Scaffold(
            body: Center(
              child: tabs[widget.tabindex],
            ),

            bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: CupertinoTabBar(

                  height: 50,
                  border: Border(top: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5)),
                  backgroundColor: Colors.black,
                  currentIndex: _selectedIndex,
                  activeColor: const Color(0xffffffff),
                  inactiveColor: const Color(0xff797979),
                  onTap: (index) {
                    setState(() {
                      widget.tabindex = index;
                      _selectedIndex = index;
                    });
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      activeIcon: Icon(CupertinoIcons.house_fill, size: 24,),
                      icon: Icon(CupertinoIcons.house_fill, size: 20,),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(CupertinoIcons.doc, size: 24,),
                      icon: Icon(CupertinoIcons.doc, size: 20,),
                      label: 'Menu',
                    ),
                    BottomNavigationBarItem(
                        activeIcon: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text("Cart", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),),
                        ),
                        icon: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text("Cart", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),),
                    ), label: ""),
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.delivery_dining, size: 24,),
                        icon: Icon(Icons.delivery_dining, size: 20,),
                        label: 'Track Order'),
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.restaurant_menu_outlined, size: 24,),
                        icon: Icon(Icons.restaurant_menu_outlined, size: 20,),
                        label: 'Reserved'),
                    // BottomNavigationBarItem(
                    //   icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
                    //   label: 'Keypad',
                    // ),
                  ],))));
  }
}

launchURL(String URL) async {
  final url = URL;
  final uri = Uri.parse(url);

  await launchUrl(uri, mode: LaunchMode.externalApplication);
}