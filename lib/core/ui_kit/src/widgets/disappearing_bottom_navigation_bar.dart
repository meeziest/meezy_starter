import 'package:flutter/material.dart';

import '../animations/animations.dart';
import '../transitions/bottom_bar_transition.dart'; // Add this import

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.home_outlined, 'Главная'),
  Destination(Icons.playlist_add_check_circle, 'Очередь'),
  Destination(Icons.person, 'Профиль'),
  Destination(Icons.music_note, 'Spotify'),
];

class DisappearingBottomNavigationBar extends StatelessWidget {
  const DisappearingBottomNavigationBar({
    required this.barAnimation,
    required this.selectedIndex,
    required this.destinations,
    this.onDestinationSelected,
  });

  final BarAnimation barAnimation;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: const Color(0xff3A384A),
      child: NavigationBar(
        elevation: 0,
        backgroundColor: const Color(0xff3A384A),
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations.map<NavigationDestination>((d) {
          return NavigationDestination(
            icon: Icon(d.icon),
            label: d.label,
          );
        }).toList(),
      ),
    );
  }
}
