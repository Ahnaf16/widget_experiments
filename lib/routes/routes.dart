import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:widget_experiments/main.dart';
import 'package:widget_experiments/src/animation/animations.dart';
import 'package:widget_experiments/src/drop_zone/drag_drop.dart';
import 'package:widget_experiments/src/drop_zone/photo_picker_ui.dart';
import 'package:widget_experiments/src/overlay/screen/overlay.dart';
import 'package:widget_experiments/src/responsive/adaptive_scaffold.dart';

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
  static const Route photoPicker = Route(
    path: '/photo_picker',
    page: PhotoPickerPopUp(),
  );

  static const Route dragDrop = Route(
    path: '/drag_drop',
    page: DragDrop(),
  );
  static const Route adaptive = Route(
    path: '/adaptive_page',
    page: AdaptivePage(),
  );
  static const Route animation = Route(
    path: '/animation_page',
    page: Animations(),
  );

  static const Route overlay = Route(
    path: '/overlay_page',
    page: OverlayPage(),
  );

  static final allRoutes = [
    photoPicker,
    adaptive,
    animation,
    overlay,
  ];
}
