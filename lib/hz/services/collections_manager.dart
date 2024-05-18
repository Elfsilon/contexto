import 'dart:math';

import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/collections/kana_collection.dart';
import 'package:cringe/hz/services/collections/models.dart';
import 'package:cringe/hz/services/collections/word_collection.dart';

extension SwappableList<E> on List<E> {
  (E, int) rnd() {
    final index = Random().nextInt(length);
    return (this[index], index);
  }
}

class CollectionsManager {
  final Task? prevTask = null;
  final collections = {
    0: createWordCollection(),
    1: createKanaCollection(),
  };

  Task getTask(int collectionID) {
    if (!collections.containsKey(collectionID)) throw Exception();
    final collection = collections[collectionID]!;
    final (taskType, _) = TaskType.values.rnd();

    Task task;
    do {
      task = generateTask(taskType, collectionID, collection);
    } while (task == prevTask);

    return task;
  }

  Task generateTask(TaskType type, int collectionID, List<CollectionItem> collection) {
    final taskVariants = <Task>[];
    final (targetItem, targetItemIndex) = collection.rnd();
    final targetField = targetItem.target;
    final (otherField, otherFieldIndex) = targetItem.fields.rnd();

    if (type == TaskType.def || type == TaskType.connect) {
      final targetOtherSet = [targetField, otherField];
      final otherTargetSet = [otherField, targetField];

      final trainingsSets = switch (otherField.mode) {
        TrainingMode.target => [targetOtherSet],
        TrainingMode.field => [otherTargetSet],
        TrainingMode.both => [targetOtherSet, otherTargetSet],
        _ => throw Exception("'Gen default task' - unexpected training mode: ${otherField.mode}"),
      };

      for (final trainingSet in trainingsSets) {
        final task = Task(
          collectionID: collectionID,
          itemID: targetItemIndex,
          type: type,
          title: trainingSet[0].name,
          targets: [trainingSet[0].value],
          variants: [trainingSet[1].value],
          answers: {0: 0},
        );
        taskVariants.add(task);
      }
    } else if (type == TaskType.pickOne) {
      // Select all elements with existing non-nullable picked field
      var additionalItems = <CollectionItem>[];
      for (int i = 0; i < collection.length; i++) {
        final item = collection[i];
        if (i != targetItemIndex && item.fields.length > otherFieldIndex) {
          additionalItems.add(item);
        }
      }

      additionalItems.shuffle();
      if (additionalItems.length > 4) {
        additionalItems = additionalItems.take(4).toList();
      }

      final SelectableField target;
      final List<String> options;
      final Function(List<String> values) getRightAnswerIndex;

      if (otherField.mode == TrainingMode.target || otherField.mode == TrainingMode.both) {
        target = targetField;
        options = <String>[
          otherField.value,
          ...additionalItems.map((i) => i.fields[otherFieldIndex].value),
        ];
        getRightAnswerIndex = (values) => values.indexOf(otherField.value);
      } else if (otherField.mode == TrainingMode.field) {
        target = otherField;
        options = <String>[
          targetField.value,
          ...additionalItems.map((i) => i.target.value),
        ];
        getRightAnswerIndex = (values) => values.indexOf(targetField.value);
      } else {
        throw Exception("'Gen pick one task' - unexpected training mode: ${otherField.mode}");
      }

      options.shuffle();

      final task = Task(
        collectionID: collectionID,
        itemID: targetItemIndex,
        type: type,
        title: target.name,
        targets: [target.value],
        variants: options,
        answers: {0: getRightAnswerIndex(options)},
      );
      taskVariants.add(task);
    }

    return taskVariants.rnd().$1;
  }
}

class ContextCollection {}

class KanaCollection {}
