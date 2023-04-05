import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool loading,
    @Default(false) bool done,
    @Default(AsyncLoading()) AsyncValue<List<Data>> datas,
  }) = _HomeState;
}
