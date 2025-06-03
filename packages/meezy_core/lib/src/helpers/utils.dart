import 'dart:async';
import 'dart:math';

extension RandomKeyGenerateExtension on Random {
  String generateCryptographicKey(int keyLength) {
    final keyBuffer = StringBuffer();
    for (int i = 0; i < keyLength; i++) {
      keyBuffer.write(nextInt(9).toString());
    }
    return keyBuffer.toString();
  }
}

Future<void> runTasks(
  List<Future<dynamic> Function()> tasks, {
  bool isSafe = false,
}) async {
  int completeTracker = 0;
  final completer = Completer<void>();

  Stream.fromIterable(tasks).forEach(
    (task) async {
      try {
        await task();
        if ((completeTracker++) == tasks.length - 1) {
          completer.complete();
        }
      } on Exception catch (e, stackTrace) {
        if (isSafe) {
          if ((completeTracker++) == tasks.length - 1) {
            completer.complete();
          }
        } else {
          completer.completeError(e, stackTrace);
        }
      }
    },
  );

  /// Wait until all tasks are finished
  await completer.future;
}
