import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/core/services/audio_service.dart';
import 'package:old/di.dart';
import 'package:old/domain/entities/track_entity.dart';
import 'package:old/gen/assets.gen.dart';
import 'package:old/presentation/features/player/player.dart';

class TrackCell extends StatelessWidget {
  const TrackCell({
    required this.track,
    super.key,
  });

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

  InkWell _leading(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PlayerBloc>().add(PlayerEvent.play(track.preview));
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            const $AssetsIconsGen().playArrow,
            color: Theme.of(context).primaryColor,
          ),
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
