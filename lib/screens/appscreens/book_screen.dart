import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/models/constants.dart';
import 'package:food_app/screens/appscreens/food_menu_screen.dart';
import 'package:food_app/screens/appscreens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});
  final int _currentValue = 3;
   final int _selectedDate = 3;
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {}

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        title: Center(
          child: Text(
            "YOFOOD",
            style: GoogleFonts.aclonica(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(defaultBorderRadius),
                child: Text(
                  "Book a Table",
                  style: GoogleFonts.aclonica(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Stack(
                children: [
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/indian.jpg",
                        //color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, bottom: 1, top: 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Eat Indian",
                            style: GoogleFonts.aclonica(
                                fontSize: 35, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8, bottom: 1, left: 8, right: 8),
                child: Text(
                  "Date",
                  style: GoogleFonts.aclonica(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  // color: Color.fromARGB(255, 114, 133, 255),
                  color: const Color.fromARGB(255, 255, 153, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadius)),
                  child:  Align(
                    alignment: Alignment.centerLeft,
                    // child: Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: CalendarTimeline(
                    //     initialDate: _selectedDate,
                    //     firstDate: DateTime.now(),
                    //     lastDate:
                    //         DateTime.now().add(const Duration(days: 365 * 4)),
                    //     onDateSelected: (date) =>
                    //         setState(() => _selectedDate = date),
                    //     leftMargin: 20,
                    //     monthColor: Color.fromARGB(179, 12, 10, 10),
                    //     dayColor: Colors.black,
                    //     dayNameColor: const Color(0xFF333A47),
                    //     activeDayColor: Colors.white,
                    //     activeBackgroundDayColor:
                    //         Color.fromARGB(255, 133, 163, 179),
                    //     dotsColor: const Color(0xFF333A47),
                    //     selectableDayPredicate: (date) => date.day != 23,
                    //     locale: 'en',
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8, bottom: 1, left: 8, right: 8),
                child: Text(
                  "Time-slot",
                  style: GoogleFonts.aclonica(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return showPicker(
                          isInlinePicker: true,
                          dialogInsetPadding: const EdgeInsets.all(4),
                          elevation: 1,
                          value: _time,
                          onChange: onTimeChanged,
                          minuteInterval: TimePickerInterval.ONE,
                          maxHour: 21,
                          is24HrFormat: false,
                          buttonsSpacing: 1,
                        );
                      });
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    color: const Color.fromARGB(255, 255, 153, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder<Object>(
                            stream: null,
                            builder: (context, snapshot) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 8, right: 0),
                                child: Row(
                                  children: [
                                    Text(
                                      DateFormat.jm().format(DateTime(
                                          0, 0, 0, _time.hour, _time.minute)),
                                      style: GoogleFonts.aclonica(fontSize: 30),
                                    ),
                                    const SizedBox(
                                      width: 140,
                                    ),
                                    SvgPicture.asset(
                                        "assets/icons/icons8-clock.svg")
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8, bottom: 1, left: 8, right: 8),
                child: Text(
                  "Total Guests",
                  style: GoogleFonts.aclonica(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  color: const Color.fromARGB(255, 255, 153, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadius)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 8, right: 0),
                      child: TextField(
                        cursorColor: Colors.black,
                        cursorHeight: 22,
                        textAlign: TextAlign.start,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.man,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Number of guests...",
                          hintStyle: GoogleFonts.aclonica(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.5),
              endIndent: 70,
              indent: 70,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodMenuScreen()));
                      },
                      child: Card(
                        elevation: 10,
                        color: const Color.fromARGB(255, 255, 153, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 27, bottom: 27, left: 8),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Prebook',
                                    style: GoogleFonts.aclonica(fontSize: 23),
                                  ),
                                  Text(
                                    'meal',
                                    style: GoogleFonts.aclonica(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              const Icon(Icons.dining)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Or",
                    style: GoogleFonts.aclonica(),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      //color: Color.fromARGB(255, 253, 194, 100),
                      color: const Color.fromARGB(255, 248, 136, 23),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 27, bottom: 27, left: 8),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Book',
                                  style: GoogleFonts.aclonica(fontSize: 23),
                                ),
                                Text(
                                  'table',
                                  style: GoogleFonts.aclonica(fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(width: 65),
                            const Icon(Icons.table_bar)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
