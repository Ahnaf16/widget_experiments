import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:widget_experiments/routes/routes.dart';
import 'package:widget_experiments/routes/routes_config.dart';
import 'package:widget_experiments/theme/colors.dart';

void main() {
  Routemaster.setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.light,
      title: 'Experiments',
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) => routesMasterMaps(),
      ),
    );
  }
}

class WidgetCatalog extends StatelessWidget {
  const WidgetCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Widget Catalog'),
      ),
      body: ListView.builder(
        itemCount: RouteNames.allRoutes.length,
        itemBuilder: (BuildContext context, int index) {
          final route = RouteNames.allRoutes[index];
          return ListTile(
            title: Text(route.getName),
            onTap: () => route.push(context),
          );
        },
      ),
    );
  }
}
