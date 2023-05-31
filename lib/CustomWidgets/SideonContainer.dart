import 'package:flutter/material.dart';
import 'package:food_app/Modals/CartProvider.dart';
import 'package:provider/provider.dart';

class SideOnContainer extends StatefulWidget {
   SideOnContainer({Key? key, required this.title, required this.price, required this.isLast}) : super(key: key);

  String title;
  String price;
  bool isLast;

  @override
  State<SideOnContainer> createState() => _SideOnContainerState();
}

class _SideOnContainerState extends State<SideOnContainer> {

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.title}",
                  style: TextStyle(
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
            Icon(
              check ? Icons.check_box : Icons.check_box_outline_blank_outlined,
              size: 22,
              color: check ? Colors.black.withOpacity(0.7) : Colors.black.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
