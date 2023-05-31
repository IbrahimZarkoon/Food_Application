import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/Screens/HomePage.dart';
import 'package:food_app/Screens/MenuPage.dart';
import 'package:food_app/Screens/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'Modals/CartProvider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => CartProvider(length: 0, price: 0),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food_App',
        theme: ThemeData(
          //primarySwatch: Colors.blue,
        ),
        home: const SplashScr(),
      ),
    );
  }
}

