import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';
import 'package:nps_system/src/view/rate_app_dialog.dart';
import 'package:nps_system/src/view/rate_in_store_dialog.dart';

import '../bloc/nps_system_bloc.dart';

class NpsLogicWrapper extends StatelessWidget {
  const NpsLogicWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NpsSystemBloc, NpsSystemState>(
      listener: (context, state) => state.whenOrNull(
        /// When the survey is loaded, show a modal bottom sheet with the Rate App Dialog.
        loaded: (survey) => showModalBottomSheet(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<NpsSystemBloc>(),
              child: RateAppDialog(survey: survey),
            );
          },
        ),

        /// When the survey result is successfully sent, show a notification thanking the user.
        resultSend: () => showNotify(
          NotificationType.success,
          title: 'Thanks for rating',
          subTitle: 'We appreciate your feedback',
          iconBuilder: (color, size) => Icon(Icons.check, color: color, size: size),
        ),

        /// When a store rating should be shown, display a modal bottom sheet with Rate In Store Dialog.
        showStoreRating: (storeTarget) => showModalBottomSheet(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<NpsSystemBloc>(),
              child: RateInStoreDialog(storeTarget: storeTarget),
            );
          },
        ),
      ),
      child: child,
    );
  }
}
