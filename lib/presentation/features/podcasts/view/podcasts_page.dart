import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:old/presentation/features/podcasts/podcasts.dart';

class PodcastsPage extends StatelessWidget {
  const PodcastsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PodcastsBloc(),
      child: const PodcastsView(),
    );
  }
}

class PodcastsView extends StatelessWidget {
  const PodcastsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodcastsBloc, PodcastsState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
