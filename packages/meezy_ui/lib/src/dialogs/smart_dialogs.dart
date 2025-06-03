// import 'package:ai_universe_fe/core/ui_kit/src/theme/app_theme.dart';
// import 'package:ai_universe_fe/core/ui_kit/src/widgets/notification_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
//
// typedef IconBuilder = Widget Function(Color color, double size);
//
// class SmartDialogs {
//   const SmartDialogs._();
//
//   static Future<void> showLoading(
//     String? tag, {
//     Color? spinnerColor,
//   }) async {
//     return SmartDialog.show(
//         backDismiss: false,
//         clickMaskDismiss: false,
//         debounce: true,
//         tag: tag,
//         maskColor: const Color.fromRGBO(0, 0, 0, 0.46),
//         builder: (_) => Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//                 color: MainColors.background,
//                 borderRadius: BorderRadius.circular(16)),
//             child: CupertinoActivityIndicator(
//               radius: 20,
//               color: MainColors.accent,
//             )));
//   }
//
//   static Future<void> showNotify(
//       {required String msg, required NotifyType notifyType}) async {
//     return SmartDialog.show(
//       debounce: true,
//       tag: 'error_msg',
//       alignment: Alignment.bottomCenter,
//       displayTime: const Duration(seconds: 2),
//       builder: (context) => NotificationWidget(
//         title: msg,
//         type: notifyType,
//       ),
//     );
//   }
//
//   static Future<void> dismiss(String? tag) async {
//     return SmartDialog.dismiss<void>(tag: tag);
//   }
// }
