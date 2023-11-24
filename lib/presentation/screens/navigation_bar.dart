import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/gen/assets.gen.dart';
import 'package:old/presentation/blocs/navigation.dart';
import 'package:old/presentation/features/home/bloc/home_bloc.dart';
import 'package:old/presentation/features/home/view/home_page.dart';
import 'package:old/presentation/features/player/player.dart';
import 'package:old/presentation/features/podcasts/podcasts.dart';
import 'package:old/presentation/features/search/search.dart';
import 'package:old/presentation/features/settings/settings.dart';

class Root extends StatelessWidget {
  const Root({
    super.key,
  });

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
                final event = _getNavigationEvent(index);
                context.read<NavigationBloc>().add(event);
              },
              items: [
                _bottomNavigationBarItem(
                  assetPath: $AssetsIconsGen().home,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  assetPath: $AssetsIconsGen().magnifier,
                  label: 'Search',
                ),
                _bottomNavigationBarItem(
                  assetPath: $AssetsIconsGen().playArrow,
                  label: 'Player',
                ),
                _bottomNavigationBarItem(
                  assetPath: $AssetsIconsGen().podcast,
                  label: 'Podcasts',
                ),
                _bottomNavigationBarItem(
                  assetPath: $AssetsIconsGen().gear,
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
    required String assetPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: SvgPicture.asset(
        assetPath,
      ),
      label: '',
    );
  }

  NavigationEvent _getNavigationEvent(int index) {
    switch (index) {
      case 0:
        return NavigateToHomeEvent();
      case 1:
        return NavigateToSearchEvent();
      case 2:
        return NavigateToPlayerEvent();
      case 3:
        return NavigateToPodcastsEvent();
      default:
        return NavigateToSettingsEvent();
    }
  }
}
