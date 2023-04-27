import 'package:flutter/material.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:food_app/screens/appscreens/food_menu_screen.dart';
import 'package:food_app/screens/appscreens/selectedcart_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/totalfood.dart';
import '../components/totalfoodcard.dart';

class TotalFoodScreen extends StatelessWidget {
  const TotalFoodScreen({super.key});
  //final totalFoodController = Get.put(TotalFoodController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FoodMenuScreen(),
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
                  // color: Color.fromARGB(255, 0, 0, 0),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectedCartScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child: Text(
                  context.watch<CartFun>().selectedFood.length.toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 245, 59, 2),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // for (int index = 0; index < totalfood.length; index++)
          //   FullFoodCard(
          //     index: index,
          //     image: totalfood[index].image,
          //     name: totalfood[index].name,
          //     price: totalfood[index].price,
          //     isSelected: totalfood[index].isSelected,
          //   ),
          Expanded(
            child: ListView.builder(
                itemExtent: 160,
                // physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: totalfood.length,
                itemBuilder: (BuildContext context, int index) {
                  return TotalFoodCard(
                    index: index,
                    image: totalfood[index].image,
                    name: totalfood[index].name,
                    price: totalfood[index].price,
                    isSelected: totalfood[index].isSelected,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
