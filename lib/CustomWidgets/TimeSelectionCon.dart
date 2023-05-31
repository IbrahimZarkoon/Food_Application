import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TimeSelectionContainer extends StatefulWidget {
  @override
  _TimeSelectionContainerState createState() => _TimeSelectionContainerState();
}

class _TimeSelectionContainerState extends State<TimeSelectionContainer> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(

      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(

        children: [
          Text(
            'Selected Time:',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            _selectedTime.format(context),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),

          GestureDetector(
            onTap: () => _selectTime(context),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xfffcc817),
              ),
              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              child: Text('Select reservation time')),
          )
        ],
      ),
    );
  }
}