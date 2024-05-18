import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.g.dart';

enum TaskType {
  @JsonValue("DEFAULT")
  def,
  @JsonValue("PICK_ONE")
  pickOne,
  @JsonValue("CONNECT")
  connect,
}

@JsonSerializable()
class Task {
  Task({
    required this.collectionID,
    required this.itemID,
    required this.type,
    required this.title,
    required this.targets,
    required this.variants,
    required this.answers,
  });

  final int collectionID;
  final int itemID;
  final TaskType type;
  final String title;
  final List<String> targets;
  final List<String> variants;
  final Map<int, int> answers;

  Task.empty()
      : collectionID = 0,
        itemID = 0,
        type = TaskType.def,
        title = "",
        targets = [],
        variants = [],
        answers = {};

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is Task &&
        other.collectionID == collectionID &&
        other.itemID == itemID &&
        other.type == type &&
        other.title == title &&
        other.targets.indexed.every((e) => e.$2 == targets[e.$1]) &&
        other.variants.indexed.every((e) => e.$2 == variants[e.$1]) &&
        other.answers == answers;
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionID, itemID, type, title, targets, variants, answers);
}
