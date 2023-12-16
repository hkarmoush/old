import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old/domain/entities/track_entity.dart';
import 'package:old/gen/assets.gen.dart';
import 'package:old/presentation/features/player/player.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    required this.track,
    super.key,
  });

  final TrackEntity track;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool _paused = false;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PlayerBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<PlayerBloc, PlayerState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return Column(
            children: [
              _image(bloc),
              _actions(context),
              _info(bloc, context),
              _playerSlider(bloc),
              _playerAction(bloc, context),
            ],
          );
        },
      ),
    );
  }

  Padding _playerAction(PlayerBloc bloc, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(const $AssetsIconsGen().previous),
          InkWell(
            onTap: bloc.audioPlayerService.backward,
            child: SvgPicture.asset(const $AssetsIconsGen().backward),
          ),
          playPause(context),
          InkWell(
            onTap: bloc.audioPlayerService.forward,
            child: SvgPicture.asset(const $AssetsIconsGen().forward),
          ),
          SvgPicture.asset(const $AssetsIconsGen().next),
        ],
      ),
    );
  }

  Widget playPause(BuildContext context) {
    final playerBloc = context.watch<PlayerBloc>();

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
            radius: 32,
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

  StreamBuilder<Duration?> _playerSlider(PlayerBloc bloc) {
    return StreamBuilder<Duration?>(
      stream: bloc.audioPlayerService.onPositionChanged,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bloc.state != const PlayerState.stopped()
                    ? formatDuration(snapshot.data?.inSeconds ?? 0)
                    : '0',
              ),
              Expanded(
                child: Slider(
                  value: bloc.state != const PlayerState.stopped()
                      ? snapshot.data?.inSeconds.toDouble() ?? 0
                      : 0,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (double value) {
                    bloc.audioPlayerService.seek(
                      Duration(seconds: value.toInt()),
                    );
                  },
                  max: bloc.audioPlayerService
                          .getDuration()
                          ?.inSeconds
                          .toDouble() ??
                      0,
                ),
              ),
              Text(
                formatDuration(
                  bloc.audioPlayerService.getDuration()?.inSeconds ?? 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding _info(PlayerBloc bloc, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Text(
            widget.track.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.track.artist.name,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }

  Row _actions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OutlinedButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Follow',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Shuffle',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _image(PlayerBloc bloc) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(
            widget.track.album.cover,
          ),
        ),
      ),
    );
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Column _barebones(PlayerState state, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state == const PlayerState.stopped())
          const CircularProgressIndicator(),
        if (state == const PlayerState.playing()) const Text('Playing'),
        if (state == const PlayerState.paused()) const Text('Paused'),
        if (state == const PlayerState.stopped()) const Text('Stopped'),
        ElevatedButton(
          onPressed: () {
            // context.read<PlayerBloc>().add(
            //       const PlayerEvent.play(
            //         'your_audio_url.mp3',
            //       ),
            //     );
          },
          child: const Text('Play'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<PlayerBloc>().add(const PlayerEvent.pause());
          },
          child: const Text('Pause'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<PlayerBloc>().add(const PlayerEvent.resume());
          },
          child: const Text('Resume'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<PlayerBloc>().add(const PlayerEvent.stop());
          },
          child: const Text('Stop'),
        ),
      ],
    );
  }
}
