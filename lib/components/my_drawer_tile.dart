import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        leading: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.yellow[200]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            icon,
            color: Colors.yellow[800],
            size: 25,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
