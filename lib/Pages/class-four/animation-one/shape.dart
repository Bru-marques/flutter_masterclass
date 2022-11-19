import 'package:flutter/material.dart';
import 'package:playground/models/animation_one_model.dart';

class ShapeWidget extends StatelessWidget {
  final Shape shape;
  final void Function() onTap;
  const ShapeWidget({
    super.key,
    required this.shape,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: shape.height,
        width: shape.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            shape.borderRadius,
          ),
          color: shape.color,
        ),
      ),
    );
  }
}
