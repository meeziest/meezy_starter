import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../bloc/nps_system_bloc.dart';

class RateInStoreDialog extends StatefulWidget {
  const RateInStoreDialog({super.key, required this.storeTarget});

  final StoreTarget storeTarget;

  @override
  State<RateInStoreDialog> createState() => _RateInStoreDialogState();
}

class _RateInStoreDialogState extends State<RateInStoreDialog> with CancelableStreamSubscriptions {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Container(
              width: 36,
              height: 6,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Help others discover us!',
              textAlign: TextAlign.center,
              style: context.textStyles.headlineLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  void pop() => mounted ? Navigator.pop(context) : null;
                  InAppReview.instance.isAvailable().then((value) {
                    if (value) {
                      InAppReview.instance.requestReview().whenComplete(() {
                        if (mounted) pop();
                      }).onError((_, __) {
                        if (mounted) pop();
                      });
                    }
                  });
                },
                child: Text("Rate us in ${widget.storeTarget.nameValue}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
