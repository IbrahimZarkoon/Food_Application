import 'package:flutter/material.dart';

class SubFilterAccordian extends StatefulWidget {
  final String title;
  final Widget content;
  final String price;

   SubFilterAccordian(
      {Key? key,
        required this.title,
        required this.content,
        required this.price})
      : super(key: key);

  @override
  State<SubFilterAccordian> createState() => _SubFilterAccordianState();
}

class _SubFilterAccordianState extends State<SubFilterAccordian> {
  bool _showContent = false;

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
          _showContent = !_showContent;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 0, bottom: 10, left: 0, right: 0),
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:  Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.75))
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
                //height: MediaQuery.of(context).size.height*0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Color(0xffffffff),

                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  contentPadding: EdgeInsets.all(0),

                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        "+\$ ${widget.price}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),

                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom:0,left: 15,right: 0),
                    child: _showContent? Icon(Icons.keyboard_arrow_up,color: Colors.black.withOpacity(0.8)) : Icon(Icons.keyboard_arrow_down,color: Colors.black.withOpacity(0.8)),
                  ),

                  //contentPadding: const EdgeInsets.all(10),

                  style: ListTileStyle.drawer,

                ),
              ),

              _showContent
                  ?
              AnimatedContainer(
                duration: Duration(milliseconds: 5000),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(left: 0,right: 0),
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
