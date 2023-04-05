import 'dart:async';

import 'package:iap_interface/iap_interface.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../main.dart';
import '../../models/data.dart';
import '../../utils/utils.dart';
import 'home_state.dart';

part 'home_providers.g.dart';

@Riverpod(keepAlive: true)
class Home extends _$Home {
  StreamSubscription? _dataStream;

  @override
  HomeState build() {
    _dataStream?.cancel();
    _dataStream = db.datas.where().watch().listen((event) => state = state.copyWith(datas: AsyncData(event)));
    ref.onDispose(() {
      _dataStream?.cancel();
    });
    Future(loadData);
    return const HomeState();
  }

  Future<void> loadData() async {
    state = state.copyWith(datas: const AsyncLoading());
    state = state.copyWith(datas: await AsyncValue.guard(() => db.datas.where().findAll()));
  }

  Future<bool> checkPurchase() async {
    if (!showTypeDiamond) {
      return true;
    }
    if (ref.read(iapProvider).diamonds < coinsSpend) {
      final purchase = await ref.read(iapProvider.notifier).checkPurchase();
      if (!purchase) {
        return false;
      }
    }
    return true;
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

  Future<void> clear() async {
    await db.writeTxn(() async => db.datas.where().deleteAll());
    loadData();
  }

  Future<void> remove(Data data) async {
    await db.writeTxn(() async => db.datas.delete(data.id));
    loadData();
  }

  Future<void> update(Data data) async {
    await db.writeTxn(() async => db.datas.put(data));
    loadData();
  }
}
