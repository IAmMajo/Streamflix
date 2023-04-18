import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_schemes.g.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks(
        ['Roboto'], await rootBundle.loadString('assets/licenses/Roboto.txt'));
  });
  runApp(const StreamflixApp());
}

class StreamflixApp extends StatelessWidget {
  static final _theme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    fontFamily: 'Roboto',
    splashFactory: kIsWeb ? InkRipple.splashFactory : InkSparkle.splashFactory,
  );

  const StreamflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Navigation(),
      theme: _theme,
      darkTheme: _theme.copyWith(colorScheme: darkColorScheme),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}
