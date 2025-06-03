import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meezy_ui/meezy_ui.dart';

class ListTileOptionsWidget extends StatelessWidget {
  final List<TileData> tiles;
  final EdgeInsets? padding;

  const ListTileOptionsWidget({required this.tiles, this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: tiles.length,
        shrinkWrap: true,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        padding: padding,
        itemBuilder: (_, index) => InkWell(
              onTap: () => tiles[index].onTap(),
              borderRadius: BorderRadius.circular(16.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // SvgPicture.asset(tiles[index].iconPath),
                      tiles[index].iconPath,
                      const SizedBox(width: 12),
                      Text(tiles[index].title, style: context.textStyles.bodyMedium)
                    ],
                  ),
                ),
              ),
            ));
  }
}

class TileData {
  final Icon iconPath;
  final String title;
  final Color? iconColor;
  final VoidCallback onTap;

  TileData({required this.iconPath, required this.title, required this.onTap, this.iconColor});
}
