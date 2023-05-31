import 'package:flutter/material.dart';

Widget Headings(BuildContext context,String heading){

  String _Heading = heading;
  return Container(
    padding: const EdgeInsets.only(top: 20,bottom: 20 , left:15 , right:15),
    child: Row(
      children:  [

        Text(_Heading,overflow: TextOverflow.ellipsis,
            style:
            const TextStyle(color: Color(0xff000000),fontWeight: FontWeight.bold, fontSize: 18)),
      ],
    ),
  );
}

Widget shadowLine(BuildContext context)
{
  //Shadow Line Container
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 1,
    margin:
    const EdgeInsets.only(left: 0, right: 0),
    decoration: const BoxDecoration(
      color: Color(0xffd0d0d0),
    ),
  );
}