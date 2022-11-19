import 'package:flutter/material.dart';
import 'package:playground/Pages/class-four/animation-one/shape.dart';
import 'package:playground/models/animation_one_model.dart';

class ControlledAnimationOne extends StatefulWidget {
  const ControlledAnimationOne({super.key});

  @override
  State<ControlledAnimationOne> createState() => _ControlledAnimationOneState();
}

class _ControlledAnimationOneState extends State<ControlledAnimationOne>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late CurvedAnimation curve =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  late final Animation _animatedWidth =
      Tween<double>(begin: 100.0, end: 200.0).animate(curve);
  late final Animation _animatedBorder =
      Tween<double>(begin: 50.0, end: 12.0).animate(curve);
  late final Animation _animatedAlign =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topCenter)
          .animate(curve);
  late final Animation _animatedColor = ColorTween(
    begin: Colors.teal,
    end: Colors.purple,
  ).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      child: Align(
        alignment: _animatedAlign.value,
        child: ShapeWidget(
          shape: GlobalShape(
            height: 100,
            width: _animatedWidth.value,
            borderRadius: _animatedBorder.value,
            color: _animatedColor.value,
          ),
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        ),
      ),
    );
  }
}
