import 'package:flutter/material.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:food_app/screens/appscreens/pay_summary_screen.dart';
import 'package:food_app/screens/appscreens/totalfood_screen.dart';
import 'package:food_app/screens/components/selected_in_cart_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedCartScreen extends StatelessWidget {
  const SelectedCartScreen({super.key});
  //final totalFoodController = Get.put(TotalFoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 255, 115, 34),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TotalFoodScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.arrow_back_sharp,
            )),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Choose Food",
              style: GoogleFonts.aclonica(
                  color: const Color.fromARGB(255, 245, 59, 2),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // actions: [
        //   Row(
        //     children: [
        //       IconButton(
        //         visualDensity: VisualDensity.compact,
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const PaySummaryScreen()));
        //         },
        //         icon: const Icon(
        //           Icons.shopping_cart,
        //           color: Colors.black,
        //         ),
        //       ),
        //       Padding(
        //           padding:
        //               const EdgeInsets.only(top: 10, right: 10, bottom: 10),
        //           child: Text(
        //               context.watch<CartFun>().selectedFood.length.toString())),
        //     ],
        //   ),
        // ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemExtent: 160,
            primary: false,
            shrinkWrap: true,
            itemCount: context.read<CartFun>().selectedFood.length,
            itemBuilder: ((BuildContext context, index) {
              return SelectedInCart(
                  image: context.read<CartFun>().selectedFood[index].image,
                  name: context.read<CartFun>().selectedFood[index].name,
                  price: context.read<CartFun>().selectedFood[index].price,
                  index: index);
            }),
          ),
        ),
        InkWell(
          onTap: () {
            int totalCost = 0;
            for (int i = 0;
                i < context.read<CartFun>().selectedFood.length;
                i++) {
              totalCost += (context.read<CartFun>().selectedFood[i].itemCount) *
                  int.parse(context.read<CartFun>().selectedFood[i].price);
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaySummaryScreen(
                          totalCost: totalCost,
                        )));
          },
          child: SizedBox(
            height: 70,
            width: double.infinity,
            child: Card(
              surfaceTintColor: Colors.black,
              shadowColor: Colors.black,
              // color: const Color.fromARGB(255, 249, 148, 90),
              color: const Color.fromARGB(255, 255, 85, 0),
              child: Center(
                child: Text(
                  "NEXT",
                  style: GoogleFonts.aclonica(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
