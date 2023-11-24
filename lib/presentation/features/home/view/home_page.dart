import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/gen/assets.gen.dart';
import 'package:old/presentation/features/home/bloc/home_bloc.dart';
import 'package:old/presentation/widgets/track_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(const HomeEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: buildBody(context, state),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'ALL SONGS',
        style: Theme.of(context).textTheme.displayLarge,
      ),
      actions: [
        buildSearchIcon(),
      ],
    );
  }

  Padding buildSearchIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SvgPicture.asset(
        const $AssetsIconsGen().magnifier,
      ),
    );
  }

  Widget buildBody(BuildContext context, HomeState state) {
    return state.map(
      initial: (_) {
        return ListView();
      },
      loading: (_) {
        return const Center(child: CircularProgressIndicator());
      },
      searchSuccess: (state) {
        final searchResult = state.searchResult;
        return ListView.builder(
          itemCount: searchResult.data.length,
          itemBuilder: (context, index) {
            final track = searchResult.data[index];
            return TrackCell(
              track: track,
              key: Key('TRACK_CELL_$index'),
              isPlaying: Random().nextBool(),
            );
          },
        );
      },
      searchError: (searchErrorState) {
        return Center(
          child: Text('Error: ${searchErrorState.errorMessage}'),
        );
      },
    );
  }
}
