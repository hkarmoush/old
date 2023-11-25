import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/core/services/audio_service.dart';
import 'package:old/di.dart';
import 'package:old/domain/entities/track_entity.dart';
import 'package:old/gen/assets.gen.dart';
import 'package:old/presentation/features/player/player.dart';

class TrackCell extends StatefulWidget {
  const TrackCell({
    required this.track,
    super.key,
  });

  final TrackEntity track;

  @override
  State<TrackCell> createState() => _TrackCellState();
}

class _TrackCellState extends State<TrackCell> {
  bool _paused = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        final bloc = context.read<PlayerBloc>();
        log(bloc.toString());
        Navigator.push(
          context,
          MaterialPageRoute<PlayerPage>(
            builder: (context) => BlocProvider.value(
              value: bloc,
              child: const PlayerPage(),
            ),
          ),
        );
      },
      leading: _leading(context),
      title: _title(context),
      subtitle: _subtitle(context),
      trailing: _duration(context),
    );
  }

  Widget _leading(BuildContext context) {
    final playerBloc = context.read<PlayerBloc>();

    return StreamBuilder<TrackEntity?>(
      stream: playerBloc.playingTrackStream,
      initialData: playerBloc.playingTrack,
      builder: (context, snapshot) {
        final playingUrl = snapshot.data;
        final isPlaying = playingUrl != widget.track;
        return InkWell(
          onTap: () {
            if (_paused) {
              playerBloc.add(const PlayerEvent.resume());
              setState(() {
                _paused = false;
              });
            } else {
              if (!isPlaying) {
                playerBloc.add(const PlayerEvent.pause());
                setState(() {
                  _paused = true;
                });
              } else {
                playerBloc.add(PlayerEvent.play(widget.track));
              }
            }
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                isPlaying || _paused
                    ? const $AssetsIconsGen().playArrow
                    : const $AssetsIconsGen().pause,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Text _title(BuildContext context) {
    return Text(
      widget.track.title,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Text _subtitle(BuildContext context) {
    return Text(
      widget.track.artist.name,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  Text _duration(BuildContext context) {
    return Text(
      formatDuration(widget.track.duration),
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
