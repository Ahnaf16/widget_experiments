import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:routemaster/routemaster.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the children to display within the body at different breakpoints.
    final List<Widget> children = <Widget>[
      for (int i = 0; i < 10; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: const Color.fromARGB(255, 255, 201, 197),
            height: 400,
            alignment: Alignment.center,
            child: Text('$i'),
          ),
        )
    ];

    return BottomNavigationBarTheme(
      data: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      child: AdaptiveScaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Routemaster.of(context).pop(),
              icon: const Icon(Icons.arrow_back)),
        ),
        smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
        mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
        largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
        useDrawer: true,

        destinations: const [
          NavigationDestination(icon: Icon(Icons.inbox), label: 'Inbox'),
          NavigationDestination(icon: Icon(Icons.article), label: 'Articles'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.video_call), label: 'Video')
        ],
        body: (_) => GridView.count(crossAxisCount: 2, children: children),
        smallBody: (_) => ListView.builder(
          itemCount: children.length,
          itemBuilder: (_, int idx) => children[idx],
        ),
        // Define a default secondaryBody.
        secondaryBody: (_) =>
            Container(color: const Color.fromARGB(255, 234, 158, 192)),
        // Override the default secondaryBody during the smallBreakpoint to be
        // empty. Must use AdaptiveScaffold.emptyBuilder to ensure it is properly
        // overridden.
        smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
      ),
    );
  }
}
