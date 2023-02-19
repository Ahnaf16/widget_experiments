import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:widget_experiments/routes/routes.dart';
import 'package:widget_experiments/routes/routes_config.dart';
import 'package:widget_experiments/theme/colors.dart';
import 'package:widget_experiments/theme/theme_provider.dart';

void main() {
  Routemaster.setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Experiments',
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) => routesMasterMaps(),
      ),
    );
  }
}

class WidgetCatalog extends ConsumerWidget {
  const WidgetCatalog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkTheme);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Widget Catalog'),
        actions: [
          Switch(
            value: isDark,
            onChanged: (v) =>
                ref.read(isDarkTheme.notifier).update((state) => v),
          ),
        ],
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
