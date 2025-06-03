import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:chatbot_core/chatbot_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../../../../domain/domain.dart';

// Maximum allowed number of image attachments.
const int _maxImagesLimit = 4;
// Shared preference key to check if onboarding message was shown.
const String _onboardingMessageKey = 'onboarding_message';

/// Main chat input field widget.
class ChatInputField extends StatefulWidget {
  final bool isSubscribed;
  final FocusNode? focusNode;
  final Widget? analysisWidget;
  final bool isLoading;

  const ChatInputField({
    super.key,
    required this.isSubscribed,
    this.focusNode,
    this.analysisWidget,
    this.isLoading = false,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  // Text controller and notifier for the input field.
  final TextEditingController _textController = TextEditingController();
  final ValueNotifier<String> _textValueNotifier = ValueNotifier<String>("");
  // Global key for obtaining the text field position.
  final GlobalKey _textFieldKey = GlobalKey();

  // List of available cameras.
  List<CameraDescription> cameras = [];
  bool isSubscribed = false;
  bool _isOnboardingMessageShown = true;

  @override
  void initState() {
    super.initState();
    _initializeTextController();
    _initializeCameras();
    _checkOnboardingMessage();
  }

  /// Initialize the text controller to update the notifier on changes.
  void _initializeTextController() {
    _textController.addListener(() {
      _textValueNotifier.value = _textController.text;
    });
  }

  /// Retrieve the available cameras.
  void _initializeCameras() {
    availableCameras().then((value) => cameras = value);
  }

  /// Check if the onboarding message has already been shown.
  void _checkOnboardingMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sharedPref = context.read<CoreDependencies>().sharedPreferences;
      final isShown = sharedPref.getBool(_onboardingMessageKey);
      if (isShown == null) {
        setState(() {
          _isOnboardingMessageShown = false;
        });
        sharedPref.setBool(_onboardingMessageKey, true);
      }
    });
  }

  @override
  void didChangeDependencies() {
    // Uncomment or adjust if you have a subscription model.
    // isSubscribed = SubscriptionStatusScopeModel.of(context)?.isSubscribed ?? false;
    isSubscribed = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          // Blurred background behind the onboarding message.
          if (!_isOnboardingMessageShown) _buildOnboardingBackdrop(),
          Column(
            children: [
              // Onboarding message bubble.
              if (!_isOnboardingMessageShown) _buildOnboardingMessage(),
              // Main input area.
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.tertiaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: _buildInputArea(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build a blurred backdrop for the onboarding message.
  Widget _buildOnboardingBackdrop() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Container(color: Colors.transparent),
    );
  }

  /// Build the onboarding message widget.
  Widget _buildOnboardingMessage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: TapRegion(
        onTapOutside: (event) {
          setState(() {
            _isOnboardingMessageShown = true;
          });
        },
        child: const MessageBubbleWidget(),
      ),
    );
  }

  /// Build the main input area containing attachments preview, text field, and buttons.
  Widget _buildInputArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8.0),
        _buildTextFieldWithAttachments([]),
        const SizedBox(height: 8.0),
      ],
    );
  }

  /// Combine attachments preview (if any) and the input row.
  Widget _buildTextFieldWithAttachments(List<ChatAttachment> attachments) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (attachments.isNotEmpty) ...[
            _buildAttachmentsPreview(attachments),
            const SizedBox(height: 8.0),
          ],
          _buildInputRow(attachments),
        ],
      ),
    );
  }

  /// Build the horizontal list of attachments preview.
  Widget _buildAttachmentsPreview(List<ChatAttachment> attachments) {
    return Padding(
      padding: EdgeInsets.only(left: _getDxPositionOfInputField() ?? 0.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 80),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: attachments.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemBuilder: (context, index) {
            final attachment = attachments[index];
            // Choose widget based on attachment type.
            switch (attachment.type) {
              case ContentFileType.image:
                return ImageWidget(
                  width: 80,
                  height: 80,
                  isLoading: attachment.isLoading,
                  isRemovable: true,
                  attachment: FileMessageEntity(
                    bytes: attachment.bytes,
                    path: attachment.path,
                    fileType: attachment.type,
                  ),
                );
              case ContentFileType.file:
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 255),
                  child: FileWidget(
                    attachment: FileMessageEntity(
                      fileType: attachment.type,
                      fileName: attachment.fileName,
                    ),
                    isLoading: attachment.isLoading,
                    isRemovable: true,
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  /// Retrieve the global x-coordinate of the text field.
  double? _getDxPositionOfInputField() {
    final RenderBox? box = _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final Offset position = box.localToGlobal(Offset.zero);
      return position.dx;
    }
    return null;
  }

  /// Build the row with the attachment button, text input, and send button.
  Widget _buildInputRow(List<ChatAttachment> attachments) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildMessageTextField(),
          const SizedBox(height: 16.0),
          // Button to add attachments.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.analysisWidget ?? const SizedBox(),
              // Row(
              //   children: [
              //     InputFieldCircleButton(
              //       onTap: () => _takeCameraPicture(
              //         context.read<ChatInputCubit>().uploadFiles,
              //         attachments.length,
              //       ),
              //       color: Colors.transparent,
              //       child: const Icon(CupertinoIcons.camera),
              //     ),
              //     const SizedBox(width: 8.0),
              //     InputFieldCircleButton(
              //       onTap: () => _uploadImages(
              //         context.read<ChatInputCubit>().uploadFiles,
              //         attachments.length,
              //       ),
              //       color: Colors.transparent,
              //       child: const Icon(CupertinoIcons.photo),
              //     ),
              //     const SizedBox(width: 8.0),
              //     InputFieldCircleButton(
              //       onTap: () => _uploadFiles(
              //         context.read<ChatInputCubit>().uploadFiles,
              //       ),
              //       color: Colors.transparent,
              //       child: const Icon(CupertinoIcons.doc),
              //     ),
              //   ],
              // ),
              _buildSendButton(attachments),
            ],
          )
        ],
      ),
    );
  }

  /// Build the message text input field.
  Widget _buildMessageTextField() {
    return TextField(
      key: _textFieldKey,
      controller: _textController,
      focusNode: widget.focusNode,
      keyboardAppearance: Brightness.dark,
      selectionControls: CustomColorSelectionHandle(Colors.blue),
      maxLines: 8,
      minLines: 1,
      style: context.textStyles.bodyLarge,
      cursorColor: context.colorScheme.onPrimary,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colorScheme.tertiaryBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(10.0),
        hintText: 'Type your message here',
        hintStyle: context.textStyles.bodyLarge?.copyWith(
          color: context.colorScheme.onPrimary.withValues(alpha: 0.5),
        ),
      ),
      textCapitalization: TextCapitalization.sentences,
    );
  }

  /// Build the send button which disables itself based on state.
  Widget _buildSendButton(List<ChatAttachment> attachments) {
    return ValueListenableBuilder<String>(
      valueListenable: _textValueNotifier,
      builder: (context, value, child) {
        final isButtonDisabled =
            widget.isLoading || (value.isEmpty && !attachments.any((element) => !element.isLoading));
        return InputFieldCircleButton(
          onTap: isButtonDisabled
              ? null
              : () {
                  context.analytics.reportEvent(const SendMessageEvent());
                  _send();
                },
          color: context.colorScheme.primaryFixed,
          child: !widget.isLoading
              ? Icon(
                  CupertinoIcons.arrow_right,
                  color: context.colorScheme.onPrimary,
                )
              : SpinKitSpinningLines(
                  itemCount: 2,
                  lineWidth: 4,
                  size: 25,
                  color: context.colorScheme.onPrimary,
                ).animate().fadeIn(),
        );
      },
    );
  }

  /// Show a bottom sheet with options for camera, photos, and files.
  void _showAttachOptionsBottomSheet(BuildContext context, List<ChatAttachment> attachments) {
    FlexibleBottomSheet.show<void>(
      context,
      arguments: FlexibleBottomSheetArguments(
        center: ListTileOptionsWidget(
          tiles: [
            TileData(
              iconPath: const Icon(CupertinoIcons.camera),
              title: 'Camera',
              onTap: () {
                context.analytics.reportEvent(const ButtonNextEvent(nameElement: 'camera_attachments'));
                if (cameras.isEmpty) return;
                Navigator.of(context).pop();
              },
            ),
            TileData(
              iconPath: const Icon(CupertinoIcons.rectangle_stack_person_crop),
              title: 'Photos',
              onTap: () {
                context.analytics.reportEvent(const ButtonNextEvent(nameElement: 'photos_attachments'));
                Navigator.of(context).pop();
              },
            ),
            TileData(
              iconPath: const Icon(CupertinoIcons.doc_fill),
              title: 'Files',
              onTap: () {
                context.analytics.reportEvent(const ButtonNextEvent(nameElement: 'files_attachments'));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Handle taking a picture from the camera.
  Future<void> _takeCameraPicture(void Function(List<ChatAttachment>) onFilesUpload, int attachmentsLength) async {
    final accessStatus = await Permission.camera.status;

    if (accessStatus == PermissionStatus.denied) {
      final status = await Permission.camera.request();
      if (status == PermissionStatus.permanentlyDenied) return;
    } else if (accessStatus == PermissionStatus.permanentlyDenied) {
      PlatformDialog.show(context, content: 'You must enable camera access to take a photo from camera');
      return;
    }

    final XFile? file = await Navigator.push<XFile?>(
      context,
      MaterialPageRoute(
        builder: (_) => CameraScreen(),
      ),
    );

    if (file == null) return;
    context.analytics.reportEvent(const PhotoAddedEvent(type: 'camera'));
    final bytes = await file.readAsBytes();
    onFilesUpload([
      ChatAttachment(
        bytes: bytes.buffer.asUint8List(),
        path: file.path,
        type: ContentFileType.image,
      )
    ]);
  }

  /// Handle file upload from the file picker.
  Future<int?> _uploadFiles(void Function(List<ChatAttachment>) onFilesUpload) async {
    final result = await FilePicker.platform.pickFiles();
    final attachments = <ChatAttachment>[];
    if (result == null) return null;

    for (final file in result.xFiles) {
      final bytes = await file.readAsBytes();
      attachments.add(ChatAttachment(
        bytes: bytes.buffer.asUint8List(),
        path: file.path,
        fileName: file.name,
        type: ContentFileType.file,
      ));
    }
    context.analytics.reportEvent(const PhotoAddedEvent(type: 'file'));
    onFilesUpload(attachments);
    return attachments.length;
  }

  /// Handle image upload from the gallery.
  Future<int?> _uploadImages(void Function(List<ChatAttachment>) onFilesUpload, int attachmentLength) async {
    final accessStatus = await Permission.photos.status;

    if (accessStatus == PermissionStatus.denied) {
      final status = await Permission.photos.request();
      if (status == PermissionStatus.permanentlyDenied) return null;
    } else if (accessStatus == PermissionStatus.permanentlyDenied) {
      PlatformDialog.show(context, content: 'You must enable photo library access to attach pictures');
      return null;
    }

    final files = await AppImagePicker().pickMultipleImages(
      attachmentLength >= _maxImagesLimit ? 0 : _maxImagesLimit - attachmentLength,
    );
    final attachments = <ChatAttachment>[];

    for (final file in files) {
      if (file == null) continue;
      final bytes = await file.readAsBytes();
      attachments.add(ChatAttachment(
        bytes: bytes.buffer.asUint8List(),
        path: file.path,
        type: ContentFileType.image,
      ));
    }
    context.analytics.reportEvent(const PhotoAddedEvent(type: 'gallery'));
    onFilesUpload(attachments);
    return attachments.length;
  }

  /// Send the chat message.
  void _send() {
    context.chatBloc.add(
      ChatEvent.sendMessage(
        content: _textController.text,
      ),
    );

    // Clear the input field and attachments.
    _textController.clear();
    ChatScreenViewModelInherited.of(context).onScrollToBottom();
  }

  @override
  void dispose() {
    _textValueNotifier.dispose();
    _textController.dispose();
    super.dispose();
  }
}
