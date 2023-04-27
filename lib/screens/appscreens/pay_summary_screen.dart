import 'package:flutter/material.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:food_app/screens/appscreens/selectedcart_screen.dart';
import 'package:food_app/screens/appscreens/totalfood_screen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/pay_summary_card.dart';

class PaySummaryScreen extends StatelessWidget {
  const PaySummaryScreen({super.key, required this.totalCost});

  final int totalCost;

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
                  builder: (context) => const SelectedCartScreen(),
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
              "Total items",
              style: GoogleFonts.aclonica(
                  color: const Color.fromARGB(255, 245, 59, 2),
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
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                  child: Text(
                      context.watch<CartFun>().selectedFood.length.toString())),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemExtent: 50,
              primary: false,
              shrinkWrap: true,
              itemCount: context.read<CartFun>().selectedFood.length,
              itemBuilder: ((BuildContext context, index) => PaySummaryCard(
                    dishname: context.read<CartFun>().selectedFood[index].name,
                    number: context
                        .watch<CartFun>()
                        .selectedFood[index]
                        .itemCount
                        .toString(),
                    amount: int.parse(
                        context.watch<CartFun>().selectedFood[index].price),
                    index: index,
                  )),
            ),
          ),
          InkWell(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const PaySummaryScreen()));
            // },
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: Card(
                surfaceTintColor: Colors.black,
                shadowColor: Colors.black,
                // color: const Color.fromARGB(255, 249, 148, 90),
                color: const Color.fromARGB(255, 255, 85, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "PAY",
                        style: GoogleFonts.aclonica(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          const Text(
                            "₹",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            totalCost.toString(),
                            style: GoogleFonts.aclonica(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "/-",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Only",
                        style: GoogleFonts.aclonica(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
