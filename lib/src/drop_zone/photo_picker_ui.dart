import 'package:flutter/material.dart';
import 'package:widget_experiments/src/drop_zone/drag_drop.dart';

class PhotoPickerPopUp extends StatelessWidget {
  const PhotoPickerPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Picker'),
      ),
      body: const DragDrop(),
    );
  }
}
