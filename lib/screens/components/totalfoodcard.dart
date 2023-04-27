import 'package:flutter/material.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TotalFoodCard extends StatelessWidget {
  const TotalFoodCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.isSelected,
    required this.index,
  });

  final String image, name;
  final String price;
  final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: Card(
        elevation: 10,
        surfaceTintColor: Colors.black,
        shadowColor: Colors.black,
        color: Colors.white.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                height: size.height * 1.3,
                width: size.width / 2.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    image,
                    cacheHeight: 300,
                    cacheWidth: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 10),
                      child: Text(
                        name,
                        style: GoogleFonts.aclonica(
                            fontSize: 23,
                            color: Color.fromARGB(255, 135, 37, 30)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "₹$price",
                              style: GoogleFonts.aclonica(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 135, 37, 30)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 249, 148, 90),
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(50),
                                        right: Radius.circular(50))),
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<CartFun>()
                                          .onSelectedFood(index);
                                    },
                                    icon: Icon(isSelected
                                        ? Icons.check
                                        : Icons
                                            .shopping_cart_checkout_outlined)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
