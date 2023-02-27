import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OverlayApi {
  OverlayApi({required this.context});

  final BuildContext context;
  OverlayEntry? overlayEntry;

  void show(String status) async {
    OverlayState overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: OverlayContainer(status: status),
            ),
          ).animate().fadeIn(),
        );
      },
    );
    if (overlayEntry != null) {
      overlayState.insert(overlayEntry!);
    }
  }

  void dismiss() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void dispose() {
    dismiss();
  }
}

class OverlayContainer extends StatelessWidget {
  const OverlayContainer({
    super.key,
    required this.status,
  });

  final String status;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        Text(
          status,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
