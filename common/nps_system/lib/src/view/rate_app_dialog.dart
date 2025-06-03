import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';
import 'package:nps_system/nps_system.dart';

class RateAppDialog extends StatefulWidget {
  const RateAppDialog({super.key, required this.survey});

  final QuestionEntity survey;

  @override
  State<RateAppDialog> createState() => _RateAppDialogState();
}

class _RateAppDialogState extends State<RateAppDialog> with CancelableStreamSubscriptions {
  int _selectedStars = 0;
  Size buttonSize = Size.zero;
  late final TextEditingController _commentController = TextEditingController();
  late final FocusNode _commentFocus = FocusNode();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _commentFocus.unfocus(),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              Container(
                width: 36,
                height: 4,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.survey.questionText,
                  textAlign: TextAlign.center,
                  style: context.textStyles.headlineMedium,
                ),
              ),
              const SizedBox(height: 16),
              StarRating(
                itemCount: widget.survey.maxRating,
                initialRating: _selectedStars,
                itemSize: 50,
                onTap: (rating) {
                  setState(() {
                    _selectedStars = rating.toInt();
                    if (_selectedStars == 5) _commentFocus.unfocus();
                  });
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BigInputField(
                  controller: _commentController,
                  focusNode: _commentFocus,
                  fillColor: context.colorScheme.primaryBackground,
                  hintTextStyle: context.textStyles.bodyMedium?.copyWith(
                    color: context.colorScheme.onPrimary.withValues(alpha: 0.5),
                  ),
                  hintText: 'Write your feedback',
                  maxLength: 200,
                ).animate().fadeIn(),
              ),
              Sizer(
                onSizeChanged: (size) => setState(() => buttonSize = size),
                child: BlocBuilder<NpsSystemBloc, NpsSystemState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(orElse: () => false, loading: () => true);
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: FilledButton(
                        onPressed: _selectedStars == 0 || isLoading ? null : _sendSurveyResult,
                        child: const Text("Rate"),
                      ),
                    );
                  },
                ),
              ),
              if (context.keyBoardHeight > buttonSize.height)
                SizedBox(height: context.keyBoardHeight - buttonSize.height),
            ],
          ),
        ),
      ),
    );
  }

  void _sendSurveyResult() {
    context.read<NpsSystemBloc>().add(
          SendNPSResult(
            NPSResult(
              questionID: widget.survey.questionID,
              rating: _selectedStars,
              feedback: _commentController.text,
            ),
            widget.survey.maxRating,
          ),
        );
    Navigator.pop(context);
  }
}
