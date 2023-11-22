import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old/presentation/blocs/navigation.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: _buildBody(currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              final event = index == 0
                  ? NavigateToHomeEvent()
                  : NavigateToSettingsEvent();
              context.read<NavigationBloc>().add(event);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Scaffold(
          backgroundColor: Colors.red,
        );
      case 1:
        return const Scaffold(
          backgroundColor: Colors.green,
        );
      default:
        return Container();
    }
  }
}
