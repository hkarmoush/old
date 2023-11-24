import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/domain/entities/track_entity.dart';
import 'package:old/gen/assets.gen.dart';

class TrackCell extends StatelessWidget {
  const TrackCell({
    required this.track,
    required this.isPlaying,
    super.key,
  });

  final bool isPlaying;
  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _leading(context),
      title: _title(context),
      subtitle: _subtitle(context),
      trailing: _duration(context),
    );
  }

  CircleAvatar _leading(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          isPlaying ? $AssetsIconsGen().pause : $AssetsIconsGen().playArrow,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      track.title,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Text _subtitle(BuildContext context) {
    return Text(
      track.artist.name,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  Text _duration(BuildContext context) {
    return Text(
      '3:23',
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
