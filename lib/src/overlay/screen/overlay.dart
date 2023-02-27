import 'package:flutter/material.dart';
import 'package:widget_experiments/src/overlay/services/overlay_api.dart';

class OverlayPage extends StatefulWidget {
  const OverlayPage({Key? key}) : super(key: key);

  @override
  State<OverlayPage> createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  @override
  Widget build(BuildContext context) {
    final overlay = OverlayApi(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Show Overlay'),
                onPressed: () => overlay.show('loading'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Dismiss'),
                onPressed: () => overlay.dismiss(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
