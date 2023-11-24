import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old/presentation/features/player/player.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
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
                  context.read<PlayerBloc>().add(
                        const PlayerEvent.play(
                          'your_audio_url.mp3',
                        ),
                      );
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
        },
      ),
    );
  }
}
