import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/constants.dart';

// import '../constants.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({
    Key? key,
    required this.image,
    required this.name,
    required this.address,
    required this.distance,
  }) : super(key: key);

  final String image;

  final String name, address, distance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 213, 145, 43),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(defaultBorderRadius / 2),
                    topLeft: Radius.circular(defaultBorderRadius / 2),
                  ),
                  child: Image.asset(
                    image,
                    height: 100,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: SvgPicture.asset(
                    "assets/icons/heart_svg.svg",
                    height: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: defaultPadding / 2,
                  bottom: defaultPadding / 2,
                  left: defaultPadding),
              child: Text(
                name,
                style: GoogleFonts.aclonica(
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontSize: 23),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding / 3),
                  child: SvgPicture.asset(
                    "assets/icons/location_svg.svg",
                    height: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Text(
                    address,
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding / 3),
                  child: SvgPicture.asset(
                    "assets/icons/distance_svg.svg",
                    height: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding / 2),
                  child: Text(
                    "16.5 km",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 2),
              child: Divider(
                thickness: 4,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  top: defaultPadding / 2,
                  bottom: defaultPadding,
                  left: defaultPadding / 2),
              child: Text(
                "Open until 11:00 PM",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
