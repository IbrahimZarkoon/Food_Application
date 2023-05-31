import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/Login.dart';

import 'HomePage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  double positionedTop = -475;

  bool rememberMe = false;

  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(milliseconds: 1000), () { setState(() {
      positionedTop = 0;
    }); });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
            children:[ Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(stops: [0.1,0.3],colors: [Colors.black.withOpacity(0.5),Colors.transparent],begin: Alignment.topCenter,end: Alignment.bottomCenter),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/signUp_BG.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topLeft,
                      filterQuality: FilterQuality.high
                  )
              ),
            ),

              AnimatedPositioned(

                  curve: Curves.easeInOut,
                  left: 0,right: 0,bottom: positionedTop,
                  duration: const Duration(milliseconds: 1000),
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height*0.4,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                    ),
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        //Headings Container
                        Container(
                          padding: const EdgeInsets.only(top: 20,bottom: 20 , left:15 , right:15),
                          child: Row(
                            children:  [

                              Text("Register an account",overflow: TextOverflow.ellipsis,
                                  style:
                                  const TextStyle(color: Color(0xff000000),fontWeight: FontWeight.bold, fontSize: 18)),
                            ],
                          ),
                        ),

                        //Sub Heading Container
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          child: Text("Quickly create an account",style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12
                          ),),
                        ),

                        //Email Container
                        Container(
                          height: MediaQuery.of(context).size.height*0.075,
                          margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black.withOpacity(0.2))
                          ),

                          child: const TextField(

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                              hintText: "Email Address",
                              label: Icon(CupertinoIcons.envelope),
                              //suffixIcon: Icon(CupertinoIcons.eye,color: Colors.black.withOpacity(0.5),)
                              //helperText: "Email Address"
                              //labelText: "Email Address"
                            ),
                          ),
                        ),

                        //Phone Container
                        Container(
                          height: MediaQuery.of(context).size.height*0.075,
                          margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black.withOpacity(0.2))
                          ),

                          child: const TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                              hintText: "Phone Number",
                              label: Icon(CupertinoIcons.phone),
                              //suffixIcon: Icon(CupertinoIcons.eye,color: Colors.black.withOpacity(0.5),)
                              //helperText: "Email Address"
                              //labelText: "Email Address"
                            ),
                          ),
                        ),

                        //Password Container
                        Container(
                          height: MediaQuery.of(context).size.height*0.075,
                          margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black.withOpacity(0.2))
                          ),

                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                contentPadding: EdgeInsets.only(left: 5),
                                hintStyle: TextStyle(

                                ),
                                label: const Icon(CupertinoIcons.lock),
                                suffixIcon: Icon(CupertinoIcons.eye,color: Colors.black.withOpacity(0.5),)
                              //helperText: "Email Address"
                              //labelText: "Email Address"
                            ),
                          ),
                        ),

                        //Confirm Password Container
                        Container(
                          height: MediaQuery.of(context).size.height*0.075,
                          margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black.withOpacity(0.2))
                          ),

                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Re-enter password",
                                contentPadding: EdgeInsets.only(left: 5),
                                hintStyle: TextStyle(

                                ),
                                label: const Icon(CupertinoIcons.lock),
                                suffixIcon: Icon(CupertinoIcons.eye,color: Colors.black.withOpacity(0.5),)
                              //helperText: "Email Address"
                              //labelText: "Email Address"
                            ),
                          ),
                        ),

                        // //Remember me / Forget pass Row
                        // Container(
                        //   padding: EdgeInsets.only(left: 15,right: 15),
                        //
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //
                        //     children: [
                        //
                        //       CupertinoSwitch(
                        //           activeColor: Color(0xff84ce41),
                        //           value: rememberMe, onChanged: (value){
                        //
                        //         setState(() {
                        //           rememberMe = value;
                        //         });
                        //       } ),
                        //
                        //       const SizedBox(width: 3,),
                        //
                        //       Text("Remember me",style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 12),),
                        //
                        //       const Spacer(),
                        //
                        //       Text("Forgot password",style: TextStyle(color: Color(0xff407ec7).withOpacity(0.75),fontWeight: FontWeight.bold),)
                        //     ],
                        //   ),
                        // ),

                        //Register Container
                        GestureDetector(
                          onTap: ()
                          {
                            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => LoginPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                            padding: EdgeInsets.only(top: 20,bottom: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff84ce41).withOpacity(0.2),
                                      blurRadius: 5,
                                      offset: Offset(0,5),
                                      spreadRadius: 1
                                  )
                                ],
                                // gradient: LinearGradient(
                                //     begin: Alignment.centerLeft,
                                //     end: Alignment.centerRight,
                                //     stops: [0.01,0.2],
                                //     colors: [
                                //   Colors.white,
                                //   Color(0xffda291c)
                                // ]),
                                color: Color(0xff84ce41)
                            ),
                            child: Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),

                        //Signup Container
                        GestureDetector(
                          onTap: ()
                          {
                            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => LoginPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 15,bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [

                                Text("Already have an acount? ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                                Text("Login",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))

            ]
        ),
      ),
    );
  }
}
