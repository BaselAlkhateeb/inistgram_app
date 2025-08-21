import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/png/message.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_down),
                ),
                Text(
                  'Instagram',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.w100,
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

