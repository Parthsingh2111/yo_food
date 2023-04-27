import 'package:flutter/material.dart';
import '../../models/constants.dart';
class FirstContainer extends StatelessWidget {
  const FirstContainer({
    Key? key,
    required this.title,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(defaultBorderRadius / 2)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                title,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
