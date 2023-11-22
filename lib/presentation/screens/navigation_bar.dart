import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old/presentation/blocs/navigation.dart';
import 'package:old/presentation/features/home/bloc/home_bloc.dart';
import 'package:old/presentation/features/home/view/home_page.dart';
import 'package:old/presentation/features/player/player.dart';
import 'package:old/presentation/features/podcasts/podcasts.dart';
import 'package:old/presentation/features/search/search.dart';
import 'package:old/presentation/features/settings/settings.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, currentIndex) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
            BlocProvider<SearchBloc>(create: (_) => SearchBloc()),
            BlocProvider<PlayerBloc>(create: (_) => PlayerBloc()),
            BlocProvider<PodcastsBloc>(create: (_) => PodcastsBloc()),
            BlocProvider<SettingsBloc>(create: (_) => SettingsBloc()),
          ],
          child: Scaffold(
            body: _buildBody(currentIndex),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                final NavigationEvent event;
                if (index == 0) {
                  event = NavigateToHomeEvent();
                } else if (index == 1) {
                  event = NavigateToSearchEvent();
                } else if (index == 2) {
                  event = NavigateToPlayerEvent();
                } else if (index == 3) {
                  event = NavigateToPodcastsEvent();
                } else {
                  event = NavigateToSettingsEvent();
                }
                context.read<NavigationBloc>().add(event);
              },
              items: [
                _bottomNavigationBarItem(
                  icon: Icons.home,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.search,
                  label: 'Search',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.home,
                  label: 'Player',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.podcasts,
                  label: 'Podcasts',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.settings,
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const PlayerPage();
      case 3:
        return const PodcastsPage();
      case 4:
        return const SettingsPage();
      default:
        return Container();
    }
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: Icon(icon),
      label: label,
    );
  }

  Widget _coloredScaffold(Color color) {
    return Scaffold(
      backgroundColor: color,
    );
  }
}
