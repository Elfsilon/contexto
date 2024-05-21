import 'dart:math';

import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/collections/context_collection.dart';
import 'package:cringe/hz/services/collections/english_context_conllection.dart';
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
    2: createContextCollection(),
    3: createEnglishContextCollection(),
  };

  Task getTask(int collectionID) {
    if (!collections.containsKey(collectionID)) throw Exception('collection does not exist');
    final collection = collections[collectionID]!;

    Task task;
    do {
      task = generateTask(collectionID, collection);
    } while (task == prevTask);

    return task;
  }

  Task generateTask(int collectionID, List<CollectionItem> collection) {
    final (targetItem, targetItemIndex) = collection.rnd();
    final (otherField, otherFieldIndex) = targetItem.fields.rnd();
    final targetField = targetItem.target;

    final (type, _) = otherField.types.isNotEmpty ? otherField.types.rnd() : TaskType.values.rnd();
    final taskVariants = <Task>[];

    if (type == TaskType.def) {
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
          type: TaskType.def, //type,
          title: "Type ${trainingSet[1].name.toLowerCase()} by the given ${trainingSet[0].name.toLowerCase()}",
          targets: [trainingSet[0].value],
          variants: [trainingSet[1].value],
          answers: {0: 0},
        );
        taskVariants.add(task);
      }
    } else if (type == TaskType.pickOne || type == TaskType.connect) {
      // Select all unique elements with existing non-nullable picked field
      var extraItems = <CollectionItem>{};
      for (int i = 0; i < collection.length; i++) {
        final item = collection[i];
        final hasField = i != targetItemIndex && item.fields.length > otherFieldIndex;
        final hasFieldAndUnique = hasField &&
            otherField != item.fields[otherFieldIndex] &&
            extraItems.every((i) => i.fields[otherFieldIndex] != item.fields[otherFieldIndex]);

        if (hasFieldAndUnique) extraItems.add(item);
      }
      extraItems = extraItems.take(4).toSet();

      final SelectableField target;
      final List<String> options;
      final Function(List<String> values) getRightAnswerIndex;

      if (otherField.mode == TrainingMode.target || otherField.mode == TrainingMode.both) {
        target = targetField;
        options = <String>[
          otherField.value,
          ...extraItems.map((i) => i.fields[otherFieldIndex].value),
        ];
        getRightAnswerIndex = (values) => values.indexOf(otherField.value);
      } else if (otherField.mode == TrainingMode.field) {
        target = otherField;
        options = <String>[
          targetField.value,
          ...extraItems.map((i) => i.target.value),
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
        title: "Pick the right option for given ${target.name.toLowerCase()}",
        targets: [target.value],
        variants: options,
        answers: {0: getRightAnswerIndex(options)},
      );
      taskVariants.add(task);
    }

    return taskVariants.rnd().$1;
  }
}
