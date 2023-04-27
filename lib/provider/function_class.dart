import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/totalfood.dart';

class CartFun extends ChangeNotifier {
  bool _iconchange = false;
  bool get iconchange => _iconchange;

  void change() {
    _iconchange = !_iconchange;
    notifyListeners();
  }

  int _cartval = 0;
  int get cartval => _cartval;

  void increment() {
    if (_iconchange) {
      _cartval++;
    } else {
      _cartval--;
    }

    notifyListeners();
  }

  void onSelectedThali(int index) {
    demo_thali[index].isSelected = !demo_thali[index].isSelected;
    if (demo_thali[index].isSelected) {
      selectedFood.add(
        TotalFood(true,
            image: demo_thali[index].image,
            price: demo_thali[index].price,
            name: demo_thali[index].name,
            itemCount: 0,
            amount: 0),
      );
    }
else {
      selectedFood
          .removeWhere((element) => element.name == demo_thali[index].name);
    }

    notifyListeners();
  }

  List<TotalFood> selectedFood = [];

  void onSelectedFood(int index) {
    totalfood[index].isSelected = !totalfood[index].isSelected;
    if (totalfood[index].isSelected) {
      selectedFood.add(TotalFood(true,
          image: totalfood[index].image,
          name: totalfood[index].name,
          price: totalfood[index].price,
          itemCount: 0,
          amount: 0));
    } else {
      selectedFood
          .removeWhere((element) => element.name == totalfood[index].name);
    }
    notifyListeners();
  }

  void cartIncrement(int index) {
    selectedFood[index].itemCount++;
    // demo_thali[index].itemCount++;
    notifyListeners();
  }

  void cardecrement(int index) {
    if (selectedFood[index].itemCount > 0) {
      selectedFood[index].itemCount--;
    }
    if (demo_thali[index].itemCount > 0) {
      demo_thali[index].itemCount--;
    }

    notifyListeners();
  }

  int totalCost = 0;
  void totalPrice() {
    for (int i = 0; i < selectedFood.length; i++) {
      totalCost +=
          (selectedFood[i].itemCount) * int.parse(selectedFood[i].price);
    }
    notifyListeners();
  }
}
