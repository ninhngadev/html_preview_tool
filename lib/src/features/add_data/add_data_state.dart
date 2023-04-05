import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_data_state.freezed.dart';
part 'add_data_state.g.dart';

@freezed
class AddDataState with _$AddDataState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AddDataState({
    @Default('') String id,
    @Default(false) bool loading,
    @Default(false) bool done,
    String? image,
  }) = _AddDataState;

  factory AddDataState.fromJson(Map<String, dynamic> json) => _$AddDataStateFromJson(json);
}
