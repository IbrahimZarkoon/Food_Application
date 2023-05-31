import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'SplashScreen.dart';

class BookedScreen extends StatefulWidget {
  @override
  _BookedScreenState createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 5000)); // Delay for 3 seconds to simulate a long operation
    Navigator.pushReplacement(context, FadeRoute(page: DashboardPage(tabindex: 0,))); // Navigate to home page
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
    navigateToHome();
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

    return Container(
      alignment: Alignment.center,

      child: FadeTransition(
        opacity: _fadeInAnimation,
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.green,
              ),
              SizedBox(height: 16),
              Text(
                'Your booking has been done. You will receive a confirmation via email in 24 hours',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}