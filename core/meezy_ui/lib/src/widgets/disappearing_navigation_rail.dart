import 'package:flutter/material.dart';

import '../animations/animations.dart';
import '../transitions/nav_rail_transition.dart';
import 'disappearing_bottom_navigation_bar.dart';

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail({
    required this.railAnimation,
    required this.backgroundColor,
    required this.selectedIndex,
    required this.destinations,
    super.key,
    this.onDestinationSelected,
  });

  final RailAnimation railAnimation;
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    return DrawerNavTransition(
      animation: railAnimation,
      backgroundColor: const Color(0xff3A384A),
      child: NavigationRail(
        selectedIndex: selectedIndex,
        backgroundColor: const Color(0xff3A384A),
        onDestinationSelected: onDestinationSelected,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        groupAlignment: -0.95,
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
    // ... to here.
  }
}
