import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../../../../domain/domain.dart';
import 'countdown_timer_widget.dart';

class MessageLimitedWidget extends StatelessWidget {
  final DateTime renewTime;
  final bool showIcon;
  final String placementId;
  final VoidCallback onTimerEnd;
  final AnalyticsScreenName location;
  final AnalyticsScreenName paywallLocation;

  const MessageLimitedWidget({
    required this.renewTime,
    required this.placementId,
    required this.onTimerEnd,
    required this.location,
    required this.paywallLocation,
    this.showIcon = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showIcon) const Padding(padding: EdgeInsets.only(bottom: 16), child: Icon(Icons.add_a_photo)),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0, top: 12),
          child: Text(
            'Free messages are over',
            style: context.textStyles.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Text(
            'Return tomorrow for 7 free messages or upgrade to Premium for unlimited access',
            style: context.textStyles.bodySmall?.copyWith(color: context.colorScheme.tertiary),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: context.colorScheme.primaryBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                CountdownTimer(renewTime: renewTime, onTimerEnd: onTimerEnd),
                const SizedBox(height: 2),
                Text(
                  'Until the new messages',
                  style: context.textStyles.bodyMedium?.copyWith(color: context.colorScheme.tertiaryFixed),
                )
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: CustomButton(
              title: 'Remove Limits',
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
              onPressed: () {
                context.analytics.reportEvent(ClickRemoveLimits(location: location.screenName));
              },
            )),
      ],
    );
  }
}
