// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddDataState _$$_AddDataStateFromJson(Map<String, dynamic> json) =>
    _$_AddDataState(
      id: json['id'] as String? ?? '',
      loading: json['loading'] as bool? ?? false,
      done: json['done'] as bool? ?? false,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_AddDataStateToJson(_$_AddDataState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loading': instance.loading,
      'done': instance.done,
      'image': instance.image,
    };
