import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old/l10n/l10n.dart';
import 'package:old/presentation/blocs/navigation.dart';
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
        ],
        child: const Root(
          key: Key('ROOT_WIDGET'),
        ),
      ),
    );
  }
}
