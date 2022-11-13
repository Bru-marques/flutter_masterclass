import 'package:flutter/material.dart';
import 'package:playground/Pages/class-four/animation-two.dart/animatio_class.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;
  final bool isOpen;
  final void Function() onTap;

  const ListItemWidget(
      {super.key,
      required this.listItem,
      required this.onTap,
      required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listItem.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: isOpen ? Colors.blue : Colors.black87),
                ),
                AnimatedRotation(
                  turns: isOpen ? 1.25 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(listItem.icon,
                      size: 14, color: isOpen ? Colors.blue : Colors.black87),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        ClipRRect(
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            heightFactor: isOpen ? 1 : 0,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
              child: Column(
                children: [
                  listItem.image,
                  const SizedBox(height: 20),
                  Text(listItem.description),
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
