import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:widget_experiments/routes/routes.dart';

RouteMap routesMasterMaps() {
  return RouteMap(
    routes: {
      RouteNames.homePage.path: (route) => MaterialPage(
            child: RouteNames.homePage.page,
          ),
      RouteNames.photoPicker.path: (route) => MaterialPage(
            child: RouteNames.photoPicker.page,
          )
    },
  );
}
