import 'package:flutter/material.dart';
import 'package:old/presentation/screens/navigation_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      home: const Root(key: Key('ROOT_WIDGET')),
    );
  }
}
