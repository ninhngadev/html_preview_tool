import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import '../utils/equatable/equatable.dart';

part 'data.g.dart';

@collection
@CopyWith()
@immutable
class Data extends Equatable {
  final Id id;
  final String title;
  final String content;
  final String? image;

  const Data({this.id = Isar.autoIncrement, required this.title, required this.content, required this.image});

  @ignore
  @override
  List<Object?> get props => [id, title, content, image];
}
