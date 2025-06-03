import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';

class CameraScreen extends StatefulWidget {
  final VoidCallback? onMultimediaPressed;

  const CameraScreen({this.onMultimediaPressed, super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription>? cameras;
  XFile? imageFile;
  CameraController? controller;
  bool isRearCameraSelected = true;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      await _initializeCameraController(cameras!.first);
    }
  }

  Future<void> _initializeCameraController(CameraDescription cameraDescription) async {
    controller = CameraController(cameraDescription, ResolutionPreset.high, enableAudio: false);
    try {
      await controller?.initialize();
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      logger.error('Error: ${e.code}\nError Message: ${e.description}');
    }
  }

  void _switchCamera() {
    if (cameras == null || cameras!.isEmpty) return;

    isRearCameraSelected = !isRearCameraSelected;
    final CameraDescription newCamera = isRearCameraSelected
        ? cameras!.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back)
        : cameras!.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);

    _initializeCameraController(newCamera);
  }

  void _toggleFlash() {
    if (controller == null || !controller!.value.isInitialized) return;

    isFlashOn = !isFlashOn;
    controller?.setFlashMode(isFlashOn ? FlashMode.torch : FlashMode.off);
    setState(() {});
  }

  Future<void> _takePicture() async {
    if (controller == null || !controller!.value.isInitialized) return;
    final file = await controller!.takePicture();
    setState(() {
      imageFile = file;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: imageFile != null
              ? Center(
                  child: GestureDetector(
                      onTap: () => setState(() => imageFile = null),
                      child: Text(
                        'Back',
                        style: context.textStyles.bodyMedium
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                      )),
                )
              : IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
          actions: [
            if (imageFile != null)
              SizedBox(
                width: 56,
                height: 56,
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                        context.maybePop(imageFile);
                      },
                      child: Text(
                        'Next',
                        style: context.textStyles.bodyMedium
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                      )),
                ),
              )
            else if (isRearCameraSelected)
              IconButton(
                icon: Icon(isFlashOn ? CupertinoIcons.lightbulb_fill : CupertinoIcons.lightbulb, size: 28),
                onPressed: _toggleFlash,
              ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: controller == null || !controller!.value.isInitialized
            ? const Center(child: CircularProgressIndicator())
            : imageFile != null
                ? Stack(
                    children: [
                      Positioned.fill(child: Container(color: Colors.black)),
                      Positioned.fill(
                        child: Center(
                          child: AspectRatio(
                              aspectRatio: (MediaQuery.of(context).size.width) / 560,
                              child: Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(child: CameraPreview(controller!)), // Предпросмотр камеры
                      ColoredBox(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0) + EdgeInsets.only(bottom: context.safeAreaBottom),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => widget.onMultimediaPressed?.call(),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.colorScheme.primary,
                                  ),
                                  child: const Center(child: Icon(CupertinoIcons.photo_on_rectangle)),
                                ),
                              ),
                              // Кнопка захвата фотографии
                              GestureDetector(
                                onTap: _takePicture,
                                child: CircleAvatar(
                                  radius: 35, // Радиус больше для центральной кнопки
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              // Иконка переключения камеры
                              GestureDetector(
                                onTap: _switchCamera,
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.colorScheme.primary,
                                  ),
                                  child: const Center(child: Icon(CupertinoIcons.repeat)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
  }
}
