import 'package:flutter/material.dart';
import 'package:gpa_calculator/info_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'G',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            TextSpan(
              text: 'P',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            TextSpan(
              text: 'A',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            TextSpan(
              text: 'C',
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
            TextSpan(
              text: 'a',
              style: TextStyle(color: Colors.purple, fontSize: 20),
            ),
            TextSpan(
              text: 'l',
              style: TextStyle(color: Colors.pink, fontSize: 20),
            ),
            TextSpan(
              text: 'c',
              style: TextStyle(color: Colors.yellow, fontSize: 20),
            ),
            TextSpan(
              text: 'u',
              style: TextStyle(color: Colors.cyan, fontSize: 20),
            ),
            TextSpan(
              text: 'l',
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            TextSpan(
              text: 'a',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            TextSpan(
              text: 't',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.brown, fontSize: 20),
            ),
            TextSpan(
              text: 'r',
              style: TextStyle(color: Colors.lime, fontSize: 20),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            TextSpan(
              text: 'G',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            TextSpan(
              text: 'P',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            TextSpan(
              text: 'A',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InfoScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
