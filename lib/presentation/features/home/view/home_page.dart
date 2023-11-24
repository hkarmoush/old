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
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
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

  ListView buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: 1000,
      prototypeItem: const TrackCell(isPlaying: false),
      itemBuilder: (context, index) {
        return TrackCell(
          key: Key('TRACK_CELL_$index'),
          isPlaying: Random().nextBool(),
        );
      },
    );
  }
}
