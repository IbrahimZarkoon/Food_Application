import 'package:flutter/material.dart';

class DeliveryPickupToggle extends StatefulWidget {
  @override
  _DeliveryPickupToggleState createState() => _DeliveryPickupToggleState();
}

class _DeliveryPickupToggleState extends State<DeliveryPickupToggle> {
  List<bool> isSelected = [true, false]; // Initial selection, true for Delivery and false for Pickup

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      disabledColor: Colors.red,
      textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
      fillColor: Colors.black,
      highlightColor: Colors.black,
      selectedColor: Colors.white,
      isSelected: isSelected,
      selectedBorderColor: Colors.black,
      disabledBorderColor: Colors.white,
      borderRadius: BorderRadius.circular(40),
      onPressed: (index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
          child: Text('Delivery'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
          child: Text('Pickup'),
        ),
      ],
    );
  }
}