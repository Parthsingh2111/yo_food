import 'package:flutter/material.dart';
import 'package:food_app/screens/appscreens/totalfood_screen.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height * 0.3,
      width: _size.width / 2,
      child: InkWell(
        onTap: () {
          Future.delayed(const Duration(seconds: 5));

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TotalFoodScreen()));
        },
        child: Card(
          elevation: 4,
          surfaceTintColor: Colors.black,
          shadowColor: Colors.black,
          // color: const Color.fromARGB(255, 249, 148, 90),
          color: Color.fromARGB(255, 255, 85, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 10,
              shadowColor: const Color.fromRGBO(0, 0, 0, 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  image,
                  // cacheHeight: 300,
                  // cacheWidth: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
