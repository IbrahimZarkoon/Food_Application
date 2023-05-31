import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/AddressBook.dart';
import 'package:food_app/Screens/LocationScreen.dart';
import 'package:geolocator/geolocator.dart';

import '../Services/GeoLocator.dart';


class customAppBar extends StatefulWidget {
  const customAppBar({Key? key}) : super(key: key);

  @override
  State<customAppBar> createState() => _customAppBarState();
}

class _customAppBarState extends State<customAppBar> {

  String Lat = "Select ";
  String Long = "Location";

  void onCurrentLocation(context) async{
    GeoLocator geoLocator =new GeoLocator();
    Position  position = await geoLocator.determinePosition();

    setState(() {
      Lat = "${position.latitude}";
      Long = "${position.longitude}";

    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xfffcc817),
      leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: ()
              {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(Icons.menu,color: Colors.black.withOpacity(0.8),)
            );
          }
      ),
      centerTitle: true,
      title: //Current location
      GestureDetector(
        onTap: ()
        {
          //onCurrentLocation(context);
          Navigator.push(context, customRoute(AddressBook()));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Icon(Icons.location_on_outlined,color: Color(0xff000000),size: 20,),

              const SizedBox(width: 5,),

              Text("$Lat $Long ",style: TextStyle(color: Colors.black,fontSize: 13),),

              const SizedBox(width: 5,),

              Icon(Icons.keyboard_arrow_down,size: 20,color: Colors.black,)
            ],
          ),
        ),
      ),

      actions: [

        Container(
            margin: EdgeInsets.only(right: 10,bottom: 5,top: 5),
            width: MediaQuery.of(context).size.width/6,
            child: Image.asset("assets/images/png-transparent-kfc-logo-colonel-sanders-kfc-logo-restaurant-chicken-meat-kfc-text-fast-food-restaurant-cartoon-removebg-preview.png")),



      ],
    );
  }
}

Route customRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
