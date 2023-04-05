import 'package:common/common.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iap_interface/iap_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../main.dart';
import '../../models/data.dart';
import '../home/home_providers.dart';
import 'add_data_state.dart';

part 'add_data_providers.g.dart';

@riverpod
class AddData extends _$AddData {
  @override
  AddDataState build() {
    return const AddDataState();
  }

  void load() {
    state = state.copyWith(loading: true);
  }

  void unload() {
    state = state.copyWith(loading: false);
  }

  void done() {
    state = state.copyWith(done: true);
  }

  Future<bool> add(String title, String content) async {
    final purchase = await ref.read(homeProvider.notifier).checkPurchase();
    if (!purchase) {
      return false;
    }

    await db.writeTxn(() async => await db.datas.put(Data(title: title, content: content, image: state.image)));

    if (currentPaymentType == PurchaseType.diamond) {
      ref.read(iapProvider.notifier).useDiamonds(coinsSpend);
    }
    ref.read(homeProvider.notifier).loadData();
    return true;
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'webp'],
    );

    if (result != null) {
      state = state.copyWith(image: result.files.single.path);
    } else {
      // User canceled the picker
    }
  }
}
