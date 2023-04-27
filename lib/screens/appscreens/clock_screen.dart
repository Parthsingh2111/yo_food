// import 'package:day_night_time_picker/lib/constants.dart';
// import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
// import 'package:day_night_time_picker/lib/state/time.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:food_app/models/constants.dart';
// import 'package:food_app/screens/appscreens/book.dart';
// import 'package:food_app/screens/appscreens/profile.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:google_fonts/google_fonts.dart';
// //import 'package:food_app/screens/models/first_containers.dart';

// import '../components/app_bar.dart';
// import '../components/second_container.dart';
// // import '../components/app_bar.dart';
// import '../components/first_containers.dart';
// //import 'models/second_container.dart';
// // import '../components/second_container.dart';

// class ClockScreen extends StatefulWidget {
//   const ClockScreen({Key? key}) : super(key: key);

//   @override
//   State<ClockScreen> createState() => _ClockScreenState();
// }

// class _ClockScreenState extends State<ClockScreen> {
//   late DateTime _selectedDate;
//   Time _time = Time(hour: 11, minute: 30, second: 20);
//   bool iosStyle = true;

//   void onTimeChanged(Time newTime) {
//     setState(() {
//       _time = newTime;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:AppBar(
//       backgroundColor: Color.fromARGB(255, 255, 153, 0),
//       leading: ElevatedButton(
//           onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => profilePage(),
//                 ),
//               ),
//           child: Icon(Icons.menu)),
//       //  backgroundColor: Color(0xff2A3C3F),
//       //   backgroundColor: Color.fromARGB(255, 255, 153, 0),
//       title: Center(
//         child: Text(
//           "YOFOOD",
//           style: GoogleFonts.aclonica(
//               color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       actions: [
//         IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.notifications,
//               color: Colors.black,
//             )),
//       ],
//     ),
//         body: Column(children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Container(
//                 //    width: double.infinity,
//                 child: Card(
//                   elevation: 10,
//                   color: Color.fromARGB(255, 253, 194, 100),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(defaultBorderRadius)),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: showPicker(
//                         isInlinePicker: true,
//                         dialogInsetPadding: EdgeInsets.all(4),
//                         elevation: 1,
//                         value: _time,
//                         onChange: onTimeChanged,
//                         minuteInterval: TimePickerInterval.ONE,
//                         maxHour: 21,
//                         is24HrFormat: false,
//                         buttonsSpacing: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ]));
//   }
// }
