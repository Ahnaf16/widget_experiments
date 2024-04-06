// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DragDrop extends StatefulWidget {
  const DragDrop({super.key});

  @override
  State<DragDrop> createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  late DropzoneViewController dropCtrl;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropperBox(
              height: double.maxFinite,
              onCreated: (ctrl) => dropCtrl = ctrl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => dropCtrl.pickFiles(),
                    icon: const Icon(Icons.image_search_rounded),
                    label: const Text('Pick Image'),
                  ),
                  Wrap(
                    children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        .map((e) => Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(10),
                              color: Colors.grey,
                              child: Text(e.toString()),
                            ))
                        .toList(),
                  ),
                ],
              ),
              onDrop: (ev) {
                log(ev.toString());
              },
            ),
          );
        },
      ),
      icon: const Icon(Icons.image_search_rounded),
      label: const Text('Upload Image'),
    );
  }
}

class DropperBox extends StatefulWidget {
  const DropperBox({
    super.key,
    required this.child,
    this.height = 200,
    this.width = double.maxFinite,
    this.onCreated,
    this.onDrop,
    this.onDropMultiple,
    this.onLoaded,
  });

  final Function(DropzoneViewController)? onCreated;
  final Function(dynamic)? onDrop;
  final Function(List<dynamic>?)? onDropMultiple;
  final Function()? onLoaded;
  final double? height;
  final double? width;
  final Widget child;

  @override
  State<DropperBox> createState() => _DropperBoxState();
}

class _DropperBoxState extends State<DropperBox> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          // height: widget.height,
          // width: widget.width,
          child: DropzoneView(
            onCreated: widget.onCreated,
            onDrop: widget.onDrop,
            onDropMultiple: widget.onDropMultiple,
            onHover: () {
              setState(() => hovering = true);
            },
            onLeave: () {
              setState(() => hovering = false);
            },
            onLoaded: widget.onLoaded,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: widget.child,
        ),
        if (hovering)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey.withOpacity(.7),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            // height: widget.height,
            // width: widget.width,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_upload_rounded),
                Text('Drop File Here'),
              ],
            ),
          ),
      ],
    );
  }
}
