// import 'package:ai_universe_fe/core/ui_kit/src/styles/app_text_styles.dart';
// import 'package:ai_universe_fe/core/ui_kit/src/theme/app_theme.dart';
// import 'package:ai_universe_fe/generated/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// const double iconSize = 28;
//
// class NotificationWidget extends StatelessWidget {
//   final NotifyType type;
//   final String title;
//
//   const NotificationWidget({
//     required this.type,
//     required this.title,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _getBackgroundColor(type),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 42),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   Assets.svg.infoCircle,
//                   color: _getIconColor(type),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Flexible(
//                   child: Text(
//                     title,
//                     style: AppTextStyles.body2Regular.copyWith(
//                         overflow: TextOverflow.visible,
//                         color: _getTextColor(type)),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Color? _getTextColor(NotifyType type) {
//     if (type == NotifyType.alert) {
//       return MainColors.textBlack;
//     } else {
//       return null;
//     }
//   }
//
//   Color? _getIconColor(NotifyType type) {
//     if (type == NotifyType.alert) {
//       return MainColors.textBlack;
//     } else {
//       return null;
//     }
//   }
//
//   ///TODO: write for every type
//   Color _getBackgroundColor(NotifyType type) {
//     if (type == NotifyType.failure) {
//       return MainColors.snackbarError;
//     } else if (type == NotifyType.alert) {
//       return MainColors.accent;
//     } else if (type == NotifyType.warning) {
//       return MainColors.secondary;
//     } else {
//       return Colors.white;
//     }
//   }
// }
