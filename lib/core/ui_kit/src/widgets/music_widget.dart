import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

class MusicTileWidget extends StatelessWidget {
  const MusicTileWidget({super.key, this.order});

  final int? order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (order != null) Text('${order.toString()}.'),
        Expanded(
          child: ListTile(
            leading: SizedBox(
              width: 48,
              height: 48,
              child: CachedNetworkImage(
                imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb5ef1c5ae2f22bee7b3fb14b2',
              ),
            ),
            title: const Text('title'),
            subtitle: Text(
              'song',
              style: AppTextStyles.body16SB,
            ),
            trailing: const Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }
}
