import 'package:flutter/material.dart';
import 'package:widget_experiments/src/animation/top_up_animation.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TopUpCard(),
          ],
        ),
      ),
    );
  }
}
