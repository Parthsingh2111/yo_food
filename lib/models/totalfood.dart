class TotalFood {
  final String image, name;
  final String price;
  bool isSelected;
  int itemCount;
  int amount;

  // final Color bg  Color;

  TotalFood(this.isSelected,
      {required this.image,
      required this.name,
      required this.price,
      required this.itemCount,
      required this.amount

      // required this.isSelected,

      //  this.bgColor = const Color(0xFFEFEFF2),
      });

  toInt(String price) {}
}

List<TotalFood> demo_thali = [
  TotalFood(
    image: "assets/rajthali/raj6.jpeg",
    name: "Raj Manwar",
    price: "1500",
    itemCount: 0,
    false,
    amount: 0,
  ),
  TotalFood(
    image: "assets/rajthali/raj3.jpeg",
    name: "Mewar Estate",
    price: "1400",
    itemCount: 0,
    amount: 0,
    false,
  ),
  TotalFood(
    amount: 0,
    image: "assets/rajthali/raj1.jpeg",
    name: "Rajwada Boj",
    price: "1300",
    itemCount: 0,
    false,
  ),
  TotalFood(
    amount: 0,
    image: "assets/rajthali/raj5.jpeg",
    name: "Thali Rajmahal",
    price: "1200",
    itemCount: 0,
    false,
  ),
  TotalFood(
    amount: 0,
    image: "assets/rajthali/raj4a.jpeg",
    name: "Rangil0 Jiman",
    price: "1400",
    itemCount: 0,
    false,
  ),
  TotalFood(
    amount: 0,
    image: "assets/rajthali/raj2.jpeg",
    name: "Thali Jodhana ",
    price: "1000",
    itemCount: 0,
    false,
  ),
];

List<TotalFood> totalfood = [
  TotalFood(
    amount: 0,
    false,
    image: "assets/foodimages/apple_pie.jpg",
    name: "Apple Pie",
    price: "200", itemCount: 0,

    //  bgColor: const Color(0xFFFEFBF9),
  ),
  TotalFood(false,
      amount: 0,
      image: "assets/foodimages/bakery.jpg",
      name: "Bakery joy",
      price: "200",
      itemCount: 0
      //  bgColor: const Color(0xFFFEFBF9),
      ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/breakfast.jpg",
    name: "Bun and Cake",
    price: "200",
    false,
    itemCount: 0,
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/coffee.jpg",
    name: "Coffee ",
    price: "200",
    itemCount: 0,
    false,
    //  bgColor: const Color(0xFFF8FEFB),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/coffee2.jpg",
    name: "coffee Rambagh",
    price: "200",
    itemCount: 0,
    false,
    // bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/coffee3.jpg",
    name: "Coffee Royal Hope",
    itemCount: 0,
    false,
    price: "200",
    // bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/dessert.jpg",
    name: "Blackforest",
    price: "200",
    itemCount: 0,
    false,
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/dessert2.jpg",
    name: "Desertfrost",
    itemCount: 0,
    false,
    price: "200",
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/dessert3.jpg",
    name: "Bluefrost",
    price: "200",
    itemCount: 0,
    false,
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/dessert4.jpg",
    name: "Rayfrost",
    itemCount: 0,
    false,
    price: "200",
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/dessert5.jpg",
    name: "Cake hunter",
    itemCount: 0,
    price: "200",
    false,
    // bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/hamburger.jpg",
    name: "Burger Bey",
    itemCount: 0,
    price: "200",
    false,
    // bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/hamburger2.jpg",
    name: "Burger Hangover",
    itemCount: 0,
    price: "200",
    false,
    // bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/hamburger3.jpg",
    name: "Hamburger Raylight",
    itemCount: 0,
    price: "200",
    false,
    //   bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/pizza.jpg",
    name: "Pizza jaipuria",
    itemCount: 0,
    price: "200",
    false,
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/pizza2.jpg",
    name: "Pizza jaker",
    itemCount: 0,
    price: "200",
    false,
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    image: "assets/foodimages/pizza3.jpg",
    name: "Pizza Nanital",
    itemCount: 0,
    price: "200",
    false,
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    false,
    image: "assets/foodimages/pizza4.jpg",
    name: "Pizza Jazz",
    itemCount: 0,
    price: "200",
    //  bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    amount: 0,
    false,
    image: "assets/foodimages/rice.jpg",
    name: "Rice Royal gunner",
    itemCount: 0,
    price: "200",
    // bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    false, amount: 0,
    image: "assets/foodimages/western.png",
    name: "Western hound",
    itemCount: 0,
    price: "200",
    // bgColor: const Color(0xFFEEEEED),
  ),
  TotalFood(
    false, amount: 0,
    image: "assets/foodimages/western2.jpg",
    name: "Western wind",
    itemCount: 0,
    price: "200",
    //bgColor: const Color(0xFFEEEEED),
  ),
];
