import 'package:flutter/material.dart';
import 'package:food_app/CustomWidgets/Headings.dart';
import 'package:food_app/CustomWidgets/TimeSelectionCon.dart';

class EditReservationSheet extends StatefulWidget {
  EditReservationSheet(
      {Key? key,
      required this.image,
      required this.title,
      required this.date,
      required this.time,
      required this.guests})
      : super(key: key);

  String image;
  String title;
  String date;
  String time;
  int guests;

  @override
  State<EditReservationSheet> createState() => _EditReservationSheetState();
}

class _EditReservationSheetState extends State<EditReservationSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            children: [

              //Image Container
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.cover)),
              ),

              //Details Container
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.people_alt_outlined,
                              size: 20,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${widget.guests}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      "Features: Outdoor Dine in, table 3 by the window.",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.6)),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    shadowLine(context),



                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      "Day: ${widget.date}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.8)),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Time Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Text(
                          "Time: ${widget.time}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.8)),
                        ),


                        GestureDetector(
                          onTap: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 12, minute: 60),
                            );
                            if (picked != null && picked != widget.time) {
                              setState(() {
                                var time = picked.toString();
                                widget.time = time.substring(10,15);
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 7, right: 7,top: 4,bottom: 4),
                            //height: 25,
                            //margin: EdgeInsets.only(right: 15),
                            //width: MediaQuery.of(context).size.width*0.31,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2), width: 0.5),
                              //color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.edit_note,size: 15,color: Colors.black.withOpacity(0.8),),

                                const SizedBox(width: 28,),

                                Text("${widget.time}",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 12),),

                              ],
                            )
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //Guests Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Number of guests:",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.8)),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          height: 25,
                          //margin: EdgeInsets.only(right: 15),
                          //width: MediaQuery.of(context).size.width*0.31,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2), width: 0.5),
                            //color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onLongPress: () {
                                  if (widget.guests > 0) {
                                    setState(() {
                                      widget.guests = 1;
                                    });
                                  }
                                },
                                onTap: () {
                                  if (widget.guests > 0) {
                                    if (widget.guests != 1) {
                                      setState(() {
                                        widget.guests--;
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       color: Colors.black.withOpacity(0.1),
                                    //       offset: Offset(0,0),
                                    //       blurRadius: 1,
                                    //       spreadRadius: 1
                                    //   )
                                    // ],
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                width: 5,
                              ),

                              //Product Count Container
                              Container(
                                  alignment: Alignment.center,
                                  //height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       color: Colors.black.withOpacity(0.1),
                                    //       offset: Offset(0,0),
                                    //       blurRadius: 1,
                                    //       spreadRadius: 1
                                    //   )
                                    // ]
                                  ),
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: Text('${widget.guests}')),

                              const SizedBox(
                                width: 5,
                              ),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.guests++;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       color: Colors.black.withOpacity(0.1),
                                    //       offset: Offset(0,0),
                                    //       blurRadius: 1,
                                    //       spreadRadius: 1
                                    //   )
                                    // ],
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      "Addressed to: Ibrahim Khan Zarkoon",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.8)),
                    ),

                  ],
                ),
              ),
            ],
          ),

          GestureDetector(
            onTap: ()
            {

              Navigator.pop(context);

            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xfffcc817),
                borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 1,
                        offset: Offset(0, 1),
                        blurRadius: 1)
                  ]
              ),

              child: Text("Save",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 14,fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
    );
  }
}
