import 'package:flutter/material.dart';
import 'package:food_app/models/food_type.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:food_app/screens/appscreens/book_screen.dart';
import 'package:food_app/screens/appscreens/selectedcart_screen.dart';
import 'package:food_app/screens/components/foodmenucard.dart';
import 'package:food_app/screens/components/rajasthani_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/totalfood.dart';

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BookScreen()));
            },
            child: const Icon(
              Icons.arrow_back_sharp,
            )),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "FOOD MENU",
              style: GoogleFonts.aclonica(
                  color: const Color.fromARGB(255, 222, 60, 6),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectedCartScreen(),),);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                  child: Text(
                    context.watch<CartFun>().selectedFood.length.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 245, 59, 2),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Grab food Kill hunger",
                  style: GoogleFonts.aclonica(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(foodProduct.length,
                    (index) => FoodCard(image: foodProduct[index].image)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Special",
                  style: GoogleFonts.aclonica(
                      color: const Color.fromARGB(255, 222, 60, 6),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "RAJASTHANI THALI",
                  style: GoogleFonts.aclonica(
                      color: const Color.fromARGB(255, 95, 32, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemExtent: 150,
                  // physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: demo_thali.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RajasthaniCard(
                      index: index,
                      image: demo_thali[index].image,
                      name: demo_thali[index].name,
                      price: demo_thali[index].price,
                      isSelected: demo_thali[index].isSelected,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


//  Padding(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             children: [
//               SizedBox(
//                 height: _size.height * 1.1,
//                 width: _size.width / 2.4,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(150),
//                   child: Image.asset(
//                     image,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: Text(
//                         name,
//                         style: GoogleFonts.aclonica(
//                             fontSize: 25,
//                             color: Color.fromARGB(255, 135, 37, 30)),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "\₹" + price.toString(),
//                               style: GoogleFonts.aclonica(
//                                   fontSize: 25,
//                                   color: Color.fromARGB(255, 135, 37, 30)),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 3),
//                           child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                     color: Colors.orange,
//                                     borderRadius: BorderRadius.horizontal(
//                                         left: Radius.circular(50),
//                                         right: Radius.circular(50))),
//                                 child: IconButton(
//                                     onPressed: () {
//                                       context
//                                           .read<CartFun>()
//                                           .onSelectedFood(index);
//                                     },
//                                     icon: Icon(isSelected
//                                         ? Icons.check
//                                         : Icons
//                                             .shopping_cart_checkout_outlined)),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),