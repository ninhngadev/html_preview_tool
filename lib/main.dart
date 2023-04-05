import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_iap/google_iap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hms_iap/hms_iap.dart';
import 'package:iap_interface/iap_interface.dart';
import 'package:isar/isar.dart';
import 'package:samsung_iap/samsung_iap.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_iap/windows_iap.dart';

import 'src/features/home/home_screen.dart';
import 'src/models/data.dart';

part 'main.g.dart';

@HiveType(typeId: 1)
class HtmlModel {
  @HiveField(0)
  String html;
  @HiveField(1)
  int id;
  HtmlModel({
    required this.html,
    required this.id,
  });
}

class LocalStorage {
  static String boxName = "accountbox";
  static late Box box;
  static init() async {
    box = await Hive.openBox<HtmlModel>(boxName);
  }

  static insert(HtmlModel htmlModel) async {
    await box.put(htmlModel.id, htmlModel);
  }

  static insertAll(List<HtmlModel> listHtml) {
    for (var element in listHtml) {
      insert(element);
    }
  }

  static delete(HtmlModel htmlModel) async {
    await box.delete(htmlModel.id);
  }

  static edit(HtmlModel htmlModel) async {
    await box.put(htmlModel.id, htmlModel);
  }

  static List<HtmlModel> get() {
    var listData = box.values.toList() as List<HtmlModel>;
    return listData;
  }
}

//TODO change coins here
const coinsSpend = 2;
const bannerUrl = 'https://flutter.dev';
late Isar db;

const currentOS = MobileOS.samsung;
const currentPaymentType = PurchaseType.removeAds;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HtmlModelAdapter());
  await LocalStorage.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if (isDesktop) {
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setSize(const Size(1280, 720));
      await windowManager.setMinimumSize(const Size(800, 600));
      await windowManager.center();
      await windowManager.show();
    });
  }
  if (kDebugMode && Platform.isMacOS) {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
  }

  // init Database
  db = await Isar.open([DataSchema]);

  runApp(ProviderScope(overrides: [
    iapProvider.overrideWith(
      (ref) {
        if (isDesktop) {
          return WindowsIapNotifier(ref);
        } else {
          switch (currentOS) {
            case MobileOS.google:
              return GoogleIapNotifier(ref);
            case MobileOS.huawei:
              return HmsIapNotifier(ref);
            case MobileOS.samsung:
              return SamsungIapNotifier(ref);
            case MobileOS.amazon:
              throw Exception('Chua co');
          }
        }
      },
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTML preview tool',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
