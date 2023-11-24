import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/di.dart';
import 'package:old/domain/entities/track_entity.dart';
import 'package:old/domain/usecases/imp/search_usecase.dart';
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
        print(currentIndex);
        return MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (_) {
                return HomeBloc(
                  searchUseCase: di.get<SearchUseCaseImpl>(),
                );
              },
              lazy: false,
            ),
            BlocProvider<SearchBloc>(create: (_) => SearchBloc()),
            BlocProvider<PodcastsBloc>(create: (_) => PodcastsBloc()),
            BlocProvider<SettingsBloc>(create: (_) => SettingsBloc()),
          ],
          child: Scaffold(
            body: Stack(
              children: [
                _buildBody(currentIndex),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _miniPlayer(context),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                final event = _getNavigationEvent(index);
                context.read<NavigationBloc>().add(event);
              },
              items: [
                _bottomNavigationBarItem(
                  icon: const $AssetsIconsGen().home,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: const $AssetsIconsGen().magnifier,
                  label: 'Search',
                ),
                _bottomNavigationBarItem(
                  icon: const $AssetsIconsGen().playArrow,
                  label: 'Player',
                ),
                _bottomNavigationBarItem(
                  icon: const $AssetsIconsGen().podcast,
                  label: 'Podcasts',
                ),
                _bottomNavigationBarItem(
                  icon: const $AssetsIconsGen().gear,
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _miniPlayer(BuildContext context) {
    final playerBloc = context.read<PlayerBloc>();
    return StreamBuilder<TrackEntity?>(
      stream: playerBloc.playingTrackStream,
      initialData: playerBloc.playingTrack,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.data != null,
          child: ClipRect(
            child: Container(
              height: 72,
              decoration: const BoxDecoration(
                color: Color(0xFF303033),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                child: Container(
                  color: Colors.white.withOpacity(0.12),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: snapshot.data?.album.cover != null
                            ? Image.network(
                                snapshot.data!.album.cover,
                              )
                            : null,
                      ),
                      Text(
                        snapshot.data?.title ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => context
                            .read<PlayerBloc>()
                            .add(const PlayerEvent.pause()),
                        child: SvgPicture.asset(
                          $AssetsIconsGen().pause,
                          height: 32,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () => context
                            .read<PlayerBloc>()
                            .add(const PlayerEvent.resume()),
                        child: SvgPicture.asset(
                          $AssetsIconsGen().playArrow,
                          height: 32,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
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
        return const SizedBox.expand();
    }
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: SvgPicture.asset(
        icon,
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
