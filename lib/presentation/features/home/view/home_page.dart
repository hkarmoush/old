import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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

  Widget buildBody(BuildContext context) {
    return Container();
  }
}
