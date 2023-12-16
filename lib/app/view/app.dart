import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old/l10n/l10n.dart';
import 'package:old/presentation/blocs/navigation.dart';
import 'package:old/presentation/features/player/bloc/player_bloc.dart';
import 'package:old/presentation/navigation_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
          displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
          displaySmall: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Color(0xFFFFFFFF),
          ),
          bodyMedium: TextStyle(
            //lato, regular
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xFFFFFFFF),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        scaffoldBackgroundColor: const Color(0xFF212A32),
        primaryColor: const Color(0xFFF75191),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
          BlocProvider<PlayerBloc>(
            create: (_) => PlayerBloc(),
          ),
        ],
        child: const Root(
          key: Key('ROOT_WIDGET'),
        ),
      ),
    );
  }
}
