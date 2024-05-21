import 'package:cringe/hz/models/task.dart';
import 'package:equatable/equatable.dart';

enum TrainingMode { target, field, both, none }

class Tag {
  const Tag(this.name);
  final String name;
}

class PartOfSpeech {
  static const noun = Tag('Noun');
  static const adjective = Tag('Adjective');
  static const irregularVerb = Tag('Irregular verb');
  static const uVerb = Tag('U-Verb');
  static const ruVerb = Tag('Ru-Verb');
  static const particle = Tag('Particle');
}

abstract interface class CollectionModel {
  CollectionItem toCollectionItem();
}

class Field<T> {
  final String name;
  final T value;

  const Field({required this.name, required this.value});
}

class SelectableField extends Equatable {
  const SelectableField({
    required this.mode,
    required this.name,
    required this.value,
    this.types = const [],
  });

  final String name;
  final String value;
  final TrainingMode mode;
  final List<TaskType> types;

  @override
  List<Object> get props => [name, value, mode, types];
}

class CollectionItem extends Equatable {
  const CollectionItem({
    required this.target,
    required this.fields,
  });

  final List<SelectableField> fields;
  final SelectableField target;

  @override
  List<Object> get props => [target, fields];
}
