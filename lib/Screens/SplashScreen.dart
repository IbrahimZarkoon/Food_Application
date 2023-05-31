import 'package:flutter/material.dart';
import 'package:food_app/Screens/HomePage.dart';
import 'package:food_app/Screens/Login.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({Key? key}) : super(key: key);

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // Delay for 3 seconds to simulate a long operation

    // await Provider.of<AllStoresProvider>(context,listen: false).getAllStoresData();
    // await Provider.of<PopStoresProvider>(context,listen: false).getPopStoresData();
    // await Provider.of<AllCatProvider>(context,listen: false).getAllCategoryData();
    // await Provider.of<PopCatProvider>(context,listen: false).getPopCategoryData();
    // await Provider.of<FeaturedStoresProvider>(context,listen: false).getFeaturedStoresData();
    // await Provider.of<LatestCouponsProvider>(context,listen: false).getLatestCouponData();



    Navigator.pushReplacement(context, FadeRoute(page: LoginPage())); // Navigate to home page
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bigcart.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // Center(
          //   child: ScaleTransition(
          //     scale: _animation,
          //     child: Image.asset(
          //       'assets/images/bigcart.png',
          //       width: MediaQuery.of(context).size.width,
          //       height: MediaQuery.of(context).size.height,
          //     ),
          //   ),
          // ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: SizedBox(
                width: 48.0,
                height: 48.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff81cc3d)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//
// bool _showWhiteContainer = false;
//
// @override
// void initState() {
//   super.initState();
//   navigateToHome();
// }
//
// Future<void> navigateToHome() async {
//   await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds to simulate a long operation
//
//   setState(() {
//     _showWhiteContainer = true;
//   });
//
//   await Future.delayed(Duration(milliseconds: 300)); // Wait for 500 milliseconds before navigating to home page
//
//   Navigator.pushReplacement(context,FadeRoute(page: DashboardPage(tabindex: 0,))); // Navigate to home page
// }
//
// @override
// Widget build(BuildContext context) {
//   return Stack(
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/icon/FBV background image purple.png"),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Center(
//           child: Image.asset("assets/icon/FBVLOGO.png"),
//         ),
//       ),
//       AnimatedOpacity(
//         duration: Duration(milliseconds: 300),
//         opacity: _showWhiteContainer ? 1.0 : 0.0,
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/icon/FBV background image purple.png"),
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }
}

// @override
// void initState() {
//   super.initState();
//   navigatetoHome();
// }
//
//
// navigatetoHome() async{
//   await Future.delayed(const Duration(seconds: 2));
//
//   Navigator.of(context).pushReplacement(FadeRoute(page: DashboardPage(tabindex: 0,)));
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.white,
//
//     body: Stack(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/icon/FBV background image purple.png"),
//               fit: BoxFit.fill,
//             ),
//           ),
//           child: Center(
//             child: Image.asset("assets/icon/FBVLOGO.png"),
//           ),
//         ),
//         AnimatedOpacity(
//           duration: Duration(seconds: 1),
//           curve: Curves.easeInOut,
//           opacity: 1.0,
//           onEnd: () => navigatetoHome(),
//           child: Container(
//             color: Colors.white,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//         ),
//       ],
//     ),
//
//     // body: Column(
//     //   crossAxisAlignment: CrossAxisAlignment.stretch,
//     //   //crossAxisAlignment: CrossAxisAlignment.stretch,
//     //   children: [
//     //
//     //     Container(
//     //       width: MediaQuery.of(context).size.width,
//     //       height: MediaQuery.of(context).size.height,
//     //       alignment: Alignment.topCenter,
//     //       margin: const EdgeInsets.all(0),
//     //       decoration: const BoxDecoration(
//     //           image: DecorationImage(image: AssetImage("assets/icon/FBV background image purple.png"),fit: BoxFit.fill),
//     //     ),
//     //     child: Center(
//     //       child: Image.asset("assets/icon/FBVLOGO.png"),
//     //     ),
//     //     ),
//     //
//     //
//     //
//     //     //const CircularProgressIndicator(color: Color(0xFF00a8cc),)
//     //
//     //   ],
//     // )
//   );
// }




class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );}