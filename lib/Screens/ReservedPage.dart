import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:food_app/CustomWidgets/TimeSelectionCon.dart';
import 'package:food_app/Screens/BookedScreen.dart';
import 'Dashboard.dart';

class ReservedPage extends StatefulWidget {
  const ReservedPage({Key? key}) : super(key: key);

  @override
  State<ReservedPage> createState() => _ReservedPageState();
}

class _ReservedPageState extends State<ReservedPage> with TickerProviderStateMixin{
  final List<String> tabTitles = ['Day', 'Time', 'Guests', 'Table'];

  int tabIndex = 0;

  int _guestCount = 1;

  String selectedDate = "Select date";

  List<bool> tableToggle = [true,false];

  List<bool> tables = [false,false,false,false,false,false,false,false,false];
  
  bool booked = false;

  List<DateTime?> _dialogCalendarPickerValue = [
    // DateTime(2021, 8, 10),
    // DateTime(2021, 8, 13),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Change the length to match the number of tabs you have
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        leading: BackButton(
          onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) =>
                      DashboardPage(tabindex: 0))),
          color: Colors.black.withOpacity(0.8),
        ),
        title: Text(
          "Reservation",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8),
              fontSize: 14),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: DefaultTabController(
            initialIndex: tabIndex,
            length: 3,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(
                    controller: _tabController,
                    onTap: (index) {
                      setState(() {
                        tabIndex = index;
                      });
                    },
                    labelColor: const Color(0xfffcc817),
                    unselectedLabelColor: Colors.black.withOpacity(0.6),
                    indicatorColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    splashBorderRadius: BorderRadius.circular(5),
                    tabs: [
                      Container(
                        width: (MediaQuery.of(context).size.width) ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: tabIndex == 0
                                ? Border.all(color: Color(0xfffcc817), width: 1)
                                : Border(),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1.5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 0))
                            ]),
                        child: Tab(
                          text: "Day & Time",
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width / 4,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //       color: Colors.white,
                      //       border: tabIndex == 1
                      //           ? Border.all(color: Color(0xfffcc817), width: 1)
                      //           : Border(),
                      //       boxShadow: [
                      //         BoxShadow(
                      //             color: Colors.black.withOpacity(0.1),
                      //             blurRadius: 1.5,
                      //             spreadRadius: 1,
                      //             offset: Offset(0, 0))
                      //       ]),
                      //   child: Tab(
                      //     text: "Time",
                      //     icon: Icon(
                      //       Icons.access_time_outlined,
                      //       size: 20,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: tabIndex == 1
                                ? Border.all(color: Color(0xfffcc817), width: 1)
                                : Border(),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1.5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 0))
                            ]),
                        child: Tab(
                          text: "Guests",
                          icon: Icon(
                            Icons.people_alt_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: tabIndex == 2
                                ? Border.all(color: Color(0xfffcc817), width: 1)
                                : Border(),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1.5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 0))
                            ]),
                        child: Tab(
                          text: "Table",
                          icon: Icon(
                            Icons.table_bar_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [



                      //Day and Time Tab
                      dayTimeTab(context),

                      // Guests Tab Content
                      guestTab(context),

                      // Table Tab Content
                      tableTab(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        booked? SizedBox() : Positioned(
            left: 0,right: 0,bottom: 0,
            child: Container(
          color: Colors.transparent,

          child: GestureDetector(
            onTap: ()
            {

              if(tabIndex == 2)
                {
                  setState(() {
                    booked = true;
                  });
                }

              if(tabIndex <= 1) {
                setState(() {
                tabIndex +=1;
                _tabController.animateTo(tabIndex);
              });
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffffec00),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1.5,
                      offset: Offset(0,1)
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  // Cart Length
                  // Container(
                  //   alignment: Alignment.center,
                  //   padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(50),
                  //       color: Color(0xffff0000)
                  //   ),
                  //   child: Text("${cartProv.cartLength}",style: TextStyle(color: Colors.white,fontSize: 12),),
                  // ),

                  //View Cart
                  // Icon(CupertinoIcons.cart_fill,size: 20,color: Colors.black.withOpacity(0.8),),
                  // const SizedBox(width: 5,),
                  Text(tabIndex ==2? "Book now" : "Next",
                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),),

                  // //Cart Price
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //
                  //   children: [
                  //
                  //     Text("PKR ${cartProv.totalPrice}",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),)
                  //
                  //   ],
                  // )

                ],
              ),

            ),
          ),

        ))
      ]),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  _buildCalendarDialogButton() {
    const dayTextStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    final weekendTextStyle =
        TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final config = CalendarDatePicker2WithActionButtonsConfig(
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Color(0xfffcc817),
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
          textStyle = anniversaryTextStyle;
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    MaterialLocalizations.of(context).formatDecimal(date.day),
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.5),
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected == true
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: textStyle,
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return InkWell(
        onTap: () async {
          final values = await showCalendarDatePicker2Dialog(
            context: context,
            config: config,
            dialogSize: const Size(325, 400),
            borderRadius: BorderRadius.circular(15),
            value: _dialogCalendarPickerValue,
            dialogBackgroundColor: Colors.white,
          );
          if (values != null) {
            // ignore: avoid_print
            print(_getValueText(
              config.calendarType,
              values,
            ));
            setState(() {
              _dialogCalendarPickerValue = values;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 2, bottom: 2, right: 5),
          padding: EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xfffdc70d)),
          alignment: Alignment.center,
          child: Text(
            "Select",
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ));
  }

  Widget dayTimeTab(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        //Name Heading
        Container(
          padding: const EdgeInsets.only(
              top: 0, bottom: 10, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Please enter your name",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),

        //Name Container
        Container(
          height: 45,
          margin: const EdgeInsets.only(
              top: 0, bottom: 15, left: 15, right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Row(

            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 5),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: "Please enter your name",
                        border: InputBorder.none
                    ),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Day Tab Content
        dayTab(context),

        // Time Tab Content
        TimeSelectionContainer(),


      ],
    );
  }

  Widget dayTab(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Date Reserved Heading
        Container(
          padding: const EdgeInsets.only(
              top: 0, bottom: 10, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reservation for",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),

        //Date Reserved Container
        Container(
          margin: const EdgeInsets.only(
              top: 0, bottom: 15, left: 15, right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    _dialogCalendarPickerValue.isEmpty
                        ? "Select date"
                        : "${_dialogCalendarPickerValue[0]?.day ?? ""}-${_dialogCalendarPickerValue[0]?.month ?? ""}-${_dialogCalendarPickerValue[0]?.year ?? ""}",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ),
              _buildCalendarDialogButton()
            ],
          ),
        ),
      ],
    );
  }
  
  Widget guestTab(BuildContext context)
  {
    return Container(
      margin: const EdgeInsets.only(
          top: 0, bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select number of guest(s):',
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              DropdownButton<int>(
                underline: SizedBox(),
                borderRadius: BorderRadius.circular(5),

                menuMaxHeight: MediaQuery.of(context).size.height*0.5,
                iconEnabledColor: Color(0xfffcc817),
                icon: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Icon(Icons.people_alt_outlined)),
                elevation: 0,
                value: _guestCount,
                onChanged: (newValue) {
                  setState(() {
                    _guestCount = newValue!;
                  });
                },
                items: List.generate(10, (index) {
                  return DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text((index + 1).toString()),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tableTab(BuildContext context)
  {
    return Container(
      margin: const EdgeInsets.only(
          top: 0, bottom: 15, left: 15, right: 15),
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: booked?
      BookedScreen()
          :
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          ToggleButtons(
            //disabledColor: Colors.red,
            textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
            fillColor: Color(0xfffcc817),
            highlightColor: Color(0xfffcc817),
            selectedColor: Colors.black.withOpacity(0.8),
            disabledColor: Colors.black.withOpacity(0.6),
            isSelected: tableToggle,
            selectedBorderColor: Color(0xfffcc817),
            disabledBorderColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            onPressed: (index) {
              setState(() {
                for (int i = 0; i < tableToggle.length; i++) {
                  tableToggle[i] = i == index;
                }
              });
            },
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                child: Text('Indoor dine in'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                child: Text('Outdoor dine in'),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 20,bottom: 20),

            child: GridView.builder(
              padding: EdgeInsets.all(15),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 15,crossAxisSpacing: 15),
              scrollDirection: Axis.vertical,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      for (int i = 0; i < tables.length; i++) {
                        tables[i] = i == index;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: tables[index]? Color(0xfffcc817) : Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(index >=6 ? "Vip Table ${index-5}" : "Table${index+1}"),
                  ),
                );
              },

            ),
          ),


        ],
      ),
    );
  }
}
