import 'dart:developer' as developer;
import 'dart:io';

import 'package:logger/logger.dart';

/// Default implementation of [LogOutput].
///
/// It sends everything to the system console.
class ConsoleOutput extends LogOutput {
  bool isReleaseMode = bool.fromEnvironment('dart.vm.product');
  @override
  void output(OutputEvent event) {
    if (isReleaseMode || !Platform.isIOS) {
      event.lines.forEach(print);
    } else {
      event.lines.forEach(developer.log);
    }
  }
}
