import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterAccordion extends StatefulWidget {
  final String title;
  final Widget content;
  final bool optional;
  final int limit;

  const FilterAccordion(
      {Key? key,
        required this.title,
        required this.content,
        required this.optional,
        required this.limit})
      : super(key: key);

  @override
  _FilterAccordionState createState() => _FilterAccordionState();
}



class _FilterAccordionState extends State<FilterAccordion> {
  bool _showContent = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: () {
        setState(() {
          //_showContent = !_showContent;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 0, left: 15, right: 15),
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: _showContent? Border() : Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.75))
          // boxShadow: [
          //   BoxShadow(
          //       offset: const Offset(0, 0),
          //
          //       blurRadius: 1.5,
          //       color: Colors.black.withOpacity(0.2))
          // ],
        ),
        child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Color(0xffffffff),

                ),
                child: ListTile(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  contentPadding: EdgeInsets.all(0),

                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 0,right: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8),fontSize:15),),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Choose up to ${widget.limit}",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 0,left: 15,right: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xfff1f1f1),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                padding: EdgeInsets.all(5),
                                child: Text("Optional",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // trailing: Padding(
                  //   padding: const EdgeInsets.only(bottom: 15,left: 15,right: 0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Color(0xfff1f1f1),
                  //       borderRadius: BorderRadius.circular(5)
                  //     ),
                  //     padding: EdgeInsets.all(5),
                  //     child: Text("Optional",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),),
                  //   ),
                  // ),

                  //contentPadding: const EdgeInsets.all(10),

                  style: ListTileStyle.drawer,

                ),
              ),

              _showContent
                  ?
              AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  //border:  Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.75)),
                  color: Colors.white,

                ),
                // height: _showContent? MediaQuery.of(context).size.height*0.8 : 100,
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: widget.content,
              )
                  :
              Container()
            ]),
      ),
    );
  }
}