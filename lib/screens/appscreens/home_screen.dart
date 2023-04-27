import 'package:flutter/material.dart';
import 'package:food_app/models/constants.dart';
import 'package:food_app/screens/appscreens/book_screen.dart';
import 'package:food_app/screens/appscreens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/second_container.dart';
import '../components/first_containers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Color.fromARGB(255, 234, 169, 95),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 153, 0),
          leading: ElevatedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  ),
              child: const Icon(Icons.menu)),
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
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                children: const [
                  FirstContainer(
                    title: "List",
                    color: Color(0xff2A3C3F),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookScreen()));
              },
              child: const SecondContainer(
                image: "assets/images/indian.jpg",
                address: "Near Gurudwara Tahil Sahib,Hoshiarpur",
                name: "Eat Indain",
                distance: "16.5",
              ),
            ),
            const SecondContainer(
              image: "assets/images/sandwiches.jpg",
              address: "Near Ganta Ghar,Hoshiarpur",
              name: "The Italian Way",
              distance: "12.0",
            ),
            const SecondContainer(
              image: "assets/images/chinese.jpg",
              address: "Near,Miraj mall,Hoshiarpur",
              name: "The China Town",
              distance: "8.5",
            ),
            const SecondContainer(
              image: "assets/images/dessert.jpg",
              address: "Near Bus Stand,Hoshiarpur",
              name: "The Sweets Garden",
              distance: "3.O",
            ),
          ]),
        ));
  }
}
