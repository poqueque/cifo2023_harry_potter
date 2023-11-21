import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.value,
    this.onStarClicked,
  });

  final double value;
  final Function(int)? onStarClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          GestureDetector(
              onTap: () {
                if (onStarClicked != null) onStarClicked!(i);
              },
              child: (value >= i)
                  ? Icon(Icons.star,
                      color: (onStarClicked == null)
                          ? Colors.black
                          : Colors.deepPurple)
                  : Icon(Icons.star_border_sharp,
                      color: (onStarClicked == null)
                          ? Colors.black
                          : Colors.deepPurple))
      ],
    );
  }
}
