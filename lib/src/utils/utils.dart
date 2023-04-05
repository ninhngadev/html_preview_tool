import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../main.dart';

Future<File> copyFileToLocal(File file) async {
  final appDocDir = await getApplicationSupportDirectory();
  final copiedFile = await file.copy('${appDocDir.path}\\${file.path.split('\\').last}');
  return copiedFile;
}

Future<void> clearAllData() async {
  final appDir = await getApplicationSupportDirectory();
  await File(appDir.path).delete(recursive: true);
}

bool get showTypeDiamond {
  if (isDesktop) {
    return false;
  }
  return currentPaymentType == PurchaseType.diamond;
}
