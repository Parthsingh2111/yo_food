import 'package:flutter/material.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaySummaryCard extends StatelessWidget {
  const PaySummaryCard({
    super.key,
    required this.dishname,
    required this.number,
    required this.amount,
    required this.index,
  });
  final String dishname, number;
  final int amount;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dishname,
              style: GoogleFonts.aclonica(
                fontSize: 15,
                color: const Color.fromARGB(255, 245, 59, 2),
              ),
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 130),
                  child: Text(
                    number,
                    style: GoogleFonts.aclonica(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      const Text(
                        "₹",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        (amount *
                                context
                                    .watch<CartFun>()
                                    .selectedFood[index]
                                    .itemCount)
                            .toString(),
                        style: GoogleFonts.aclonica(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 11, 20, 4),
                        ),
                      ),
                      const Text(
                        "/-",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
