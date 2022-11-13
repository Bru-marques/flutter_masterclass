import 'package:flutter/material.dart';

abstract class Shape {
  final double height;
  final double width;
  final double borderRadius;
  final Color color;

  const Shape({
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.color,
  });
}

class Circle extends Shape {
  const Circle({
    required double size,
    required super.color,
  }) : super(
          height: size,
          width: size,
          borderRadius: size / 2,
        );
}

class Rectangle extends Shape {
  const Rectangle({
    required super.height,
    required super.width,
    required super.borderRadius,
    required super.color,
  });
}

class Square extends Shape {
  const Square({
    required double size,
    required super.color,
  }) : super(height: size, width: size, borderRadius: 0);
}
