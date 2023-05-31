import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modals/CartProvider.dart';

class SubFilterSideOn extends StatefulWidget {
  SubFilterSideOn({Key? key, required this.title,  this.price, required this.isLast}) : super(key: key);

  String title;
  String? price;
  bool isLast;

  @override
  State<SubFilterSideOn> createState() => _SubFilterSideOnState();
}

class _SubFilterSideOnState extends State<SubFilterSideOn> {
  bool check = false;


  @override
  Widget build(BuildContext context) {

    var cartProv = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        setState(() {
          check = !check;

          if(check == true)
          {
            //cartProv. += double.parse("${widget.price}");
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: widget.isLast? 0:  10),
        decoration: BoxDecoration(
            border: widget.isLast? Border() : Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5))
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: widget.isLast? 0:  10, right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${widget.title}",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            Icon(
              check ? Icons.check_circle : Icons.circle_outlined,
              size: 22,
              color: check ? Colors.black.withOpacity(0.7) : Colors.black.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
