import 'package:flutter/material.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedInCart extends StatelessWidget {
  const SelectedInCart({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    //  required this.isSelected,
    required this.index,
  });

  final String image, name;
  final String price;
  // final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height * 0.2,
      width: _size.width,
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
                height: _size.height * 1.1,
                width: _size.width / 2.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        name,
                        style: GoogleFonts.aclonica(
                            fontSize: 23,
                            color: const Color.fromARGB(255, 135, 37, 30)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 132),
                      child: Text(
                        context
                            .watch<CartFun>()
                            .selectedFood[index]
                            .itemCount
                            .toString(),
                        style: GoogleFonts.aclonica(
                            fontSize: 23,
                            color: const Color.fromARGB(255, 135, 37, 30)),
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
                                  fontSize: 23,
                                  color:
                                      const Color.fromARGB(255, 135, 37, 30)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(50),
                                  right: Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    context.read<CartFun>().cardecrement(index);
                                    
                                  },
                                  icon: const Icon(Icons.remove)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(50),
                                  right: Radius.circular(50),
                                ),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartFun>()
                                        .cartIncrement(index);
                                    
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  )),
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
