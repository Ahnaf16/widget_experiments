import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:widget_experiments/main.dart';
import 'package:widget_experiments/src/drop_zone/drag_drop.dart';
import 'package:widget_experiments/src/drop_zone/photo_picker_ui.dart';

class Route {
  const Route({required this.path, required this.page});

  final String path;
  final Widget page;

  push(BuildContext context) {
    Routemaster.of(context).push(path);
  }

  String get getName {
    if (path != '/') {
      List<String> words =
          path.replaceAll('_', ' ').replaceAll('/', '').split(" ");

      String capitalizedText = "";

      for (int i = 0; i < words.length; i++) {
        capitalizedText += words[i][0].toUpperCase() + words[i].substring(1);
        if (i < words.length - 1) {
          capitalizedText += " ";
        }
      }
      return capitalizedText;
    } else {
      return 'Home';
    }
  }
}

class RouteNames {
  static const Route homePage = Route(
    path: '/',
    page: WidgetCatalog(),
  );
  static Route photoPicker = const Route(
    path: '/photo_picker',
    page: PhotoPickerPopUp(),
  );

  static Route dragDrop = const Route(
    path: '/drag_drop',
    page: DragDrop(),
  );

  static final allRoutes = [
    photoPicker,
  ];
}
