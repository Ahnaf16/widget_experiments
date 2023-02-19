import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TopUpCard extends StatefulWidget {
  const TopUpCard({super.key});

  @override
  State<TopUpCard> createState() => _TopUpCardState();
}

class _TopUpCardState extends State<TopUpCard> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload;
    return Column(
      children: [
        Text('$tapped'),
        GestureDetector(
            onTap: () => setState(() => tapped = !tapped),
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: 500.milliseconds,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tapped ? 10 : 100),
                    color: Colors.red,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(r'$ 500'),
                  ),
                ),
                AnimatedContainer(
                  duration: 500.milliseconds,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tapped ? 10 : 100),
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text('TOP UP').animate(target: tapped ? 1 : 0),
                  ),
                ).animate(target: tapped ? 1 : 0).slideX(begin: 0),
              ],
            )
            // .elevation(end: 24)
            // .scaleXY(end: 1.5, alignment: const Alignment(0, .7)),
            ),
      ],
    );
  }
}
