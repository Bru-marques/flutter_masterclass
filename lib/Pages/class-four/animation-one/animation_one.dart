import 'package:flutter/material.dart';
import 'package:playground/Pages/class-four/animation-one/animation_class.dart';

class AnimationOne extends StatefulWidget {
  const AnimationOne({super.key});

  @override
  State<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends State<AnimationOne> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio do Botão Flutuante'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: AnimatedAlign(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
        alignment: isAnimated ? Alignment.bottomRight : Alignment.topCenter,
        child: ShapeWidget(
          shape: isAnimated
              ? const Circle(
                  size: 100,
                  color: Colors.blueAccent,
                )
              : const Rectangle(
                  height: 100,
                  width: 200,
                  borderRadius: 0,
                  color: Colors.red,
                ),
          onTap: () {
            setState(() {
              isAnimated = !isAnimated;
            });
          },
        ),
      ),
    );
  }
}

class ShapeWidget extends StatelessWidget {
  final Shape shape;
  final void Function() onTap;
  const ShapeWidget({super.key, required this.shape, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
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
