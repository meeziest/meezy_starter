import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

class PlatformDialog {
  static void show(
    BuildContext context, {
    required String content,
  }) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Platform.isIOS
            ? CupertinoTheme(
                data: const CupertinoThemeData(
                  brightness: Brightness.dark,
                ),
                child: CupertinoAlertDialog(
                  title: const Text('Attention'),
                  content: Text(
                    content,
                  ),
                  actions: [
                    CupertinoDialogAction(
                        child: Text('No, thanks', style: TextStyle(color: context.colorScheme.success)),
                        onPressed: () {
                          dialogContext.maybePop();
                        }),
                    CupertinoDialogAction(
                        child: Text('Settings', style: TextStyle(color: context.colorScheme.success)),
                        onPressed: () {
                          dialogContext.maybePop();
                          AppSettings.openAppSettings();
                        }),
                  ],
                ),
              )
            : AlertDialog(
                title: const Text('Attention'),
                backgroundColor: const Color(0xff1e1e1e),
                content: const Text('You must enable camera access to take a photo from camera'),
                actions: [
                  TextButton(
                      child: Text('No, thanks', style: TextStyle(color: context.colorScheme.success)),
                      onPressed: () {
                        dialogContext.maybePop();
                      }),
                  TextButton(
                      child: Text('Settings', style: TextStyle(color: context.colorScheme.success)),
                      onPressed: () {
                        dialogContext.maybePop();
                        AppSettings.openAppSettings();
                      }),
                ],
              );
      },
    );
  }
}
