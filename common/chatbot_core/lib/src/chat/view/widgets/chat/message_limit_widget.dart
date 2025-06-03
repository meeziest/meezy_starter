import 'package:chatbot_core/src/chat/view/widgets/limits/message_limited_widget.dart';
import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../../../../domain/domain.dart';

class MessageLimitWidget extends StatelessWidget {
  const MessageLimitWidget({
    required this.placementId,
    super.key,
  });

  final String placementId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.analytics.reportEvent(
              ClickGetPremium(location: AnalyticsScreenName.mainScreen.screenName),
            );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            alignment: Alignment.center,
          ),
          child: Text(
            'Get Premium',
            style: context.textStyles.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  void _showMessageLimitedBottomSheet(BuildContext context, DateTime renewTime) {
    context.analytics.reportEvent(const ViewElementEvent(nameElement: 'free_messages_over'));
    FlexibleBottomSheet.show<void>(
      context,
      arguments: FlexibleBottomSheetArguments(
        onClose: () {
          context.analytics.reportEvent(const CloseLimitedWidget(nameElement: 'free_messages_over'));
        },
        center: MessageLimitedWidget(
          renewTime: renewTime,
          placementId: placementId,
          location: AnalyticsScreenName.removeLimitsPopUp,
          paywallLocation: AnalyticsScreenName.removeLimitsPopUp,
          onTimerEnd: () {
            context.router.maybePop();
          },
        ),
      ),
    );
  }
}
