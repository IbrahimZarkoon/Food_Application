import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/Modals/CartProvider.dart';
import 'package:food_app/Screens/Dashboard.dart';
import 'package:food_app/Screens/TrackOrder.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:provider/provider.dart';
import 'Login.dart';
import 'SplashScreen.dart';

class OrderPlacedScreen extends StatefulWidget {
  @override
  _OrderPlacedScreenState createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  Future<void> navigateToTrack() async {
    await Future.delayed(const Duration(milliseconds: 2500)); // Delay for 3 seconds to simulate a long operation
    Navigator.pushReplacement(context, FadeRoute(page: DashboardPage(tabindex: 3,))); // Navigate to home page
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),

    );
    navigateToTrack();
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: FadeTransition(
        opacity: _fadeInAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              size: 80,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            Text(
              'Your order has been placed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
          ),
      ),
    );
  }
}
