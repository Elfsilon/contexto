import 'dart:math';

import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/collections/models.dart';
import 'package:cringe/hz/services/collections/word_collection.dart';

extension SwappableList<E> on List<E> {
  (E, int) rnd() {
    print("Random $this");
    final index = Random().nextInt(length);
    return (this[index], index);
  }
}

class CollectionsManager {
  final wordCollection = createWordCollection();
  final Task? prevTask = null;

  Task getTask(int collectionID) {
    Task task;
    do {
      final (taskType, _) = TaskType.values.rnd();
      task = switch (collectionID) {
        // 1 => wordCollection,
        // 2 => wordCollection,
        _ => fromWords(taskType),
      };
    } while (task == prevTask);

    return task;
  }

  Task fromWords(TaskType type) {
    final variants = <Task>[];

    if (type == TaskType.def || type == TaskType.connect) {
      final (word, index) = wordCollection.rnd();

      variants.add(Task(
        collectionID: 0,
        itemID: index,
        type: type,
        title: "Write down reading of the word",
        targets: [word.target.value],
        variants: [word.reading.value],
        answers: {0: 0},
      ));

      variants.add(Task(
        collectionID: 0,
        itemID: index,
        type: type,
        title: "Write down word by given meaning",
        targets: [word.meanings.value.join(", ")],
        variants: [word.target.value],
        answers: {0: 0},
      ));

      if (word.partOfSpeech.value == PartOfSpeech.verb) {
        if (word.dictionaryForm.value != null) {
          variants.add(Task(
            collectionID: 0,
            itemID: index,
            type: type,
            title: "Write down dictionary form of given verb",
            targets: [word.target.value],
            variants: [word.dictionaryForm.value!],
            answers: {0: 0},
          ));
        }

        if (word.presentAffirmativeForm.value != null) {
          variants.add(Task(
            collectionID: 0,
            itemID: index,
            type: type,
            title: "Write down present affirmative form of given verb",
            targets: [word.target.value],
            variants: [word.presentAffirmativeForm.value!],
            answers: {0: 0},
          ));
        }

        if (word.presentNegativeForm.value != null) {
          variants.add(Task(
            collectionID: 0,
            itemID: index,
            type: type,
            title: "Write down present negative form of given verb",
            targets: [word.target.value],
            variants: [word.presentNegativeForm.value!],
            answers: {0: 0},
          ));
        }
      }
    }

    if (type == TaskType.pickOne) {
      final (word, index) = wordCollection.rnd();
      final wrong = <Word>[];
      final wrongIndexes = <int>[];
      for (int i = 0; i < 3; i++) {
        Word curr;
        int currIndex;

        do {
          (curr, currIndex) = wordCollection.rnd();
        } while (currIndex == index || wrongIndexes.contains(currIndex));

        wrong.add(curr);
        wrongIndexes.add(currIndex);
      }

      // Meanings
      final targetMeanings = word.meanings.value.join(", ");
      List<String> meaningOptions = [targetMeanings, ...wrong.map((e) => e.meanings.value.join(", "))];
      meaningOptions.shuffle(Random());
      variants.add(Task(
        collectionID: 0,
        itemID: index,
        type: type,
        title: "Pick the right meaning",
        targets: [word.target.value],
        variants: meaningOptions,
        answers: {0: meaningOptions.indexOf(targetMeanings)},
      ));

      // Targets
      final targetOptions = [word.target.value, ...wrong.map((e) => e.target.value)];
      targetOptions.shuffle(Random());
      variants.add(Task(
        collectionID: 0,
        itemID: index,
        type: type,
        title: "Pick the right word",
        targets: [targetMeanings],
        variants: targetOptions,
        answers: {0: targetOptions.indexOf(word.target.value)},
      ));

      // Targets
      final readingOptions = [word.reading.value, ...wrong.map((e) => e.reading.value)];
      readingOptions.shuffle(Random());
      variants.add(Task(
        collectionID: 0,
        itemID: index,
        type: type,
        title: "Pick the right reading",
        targets: [word.target.value],
        variants: readingOptions,
        answers: {0: readingOptions.indexOf(word.reading.value)},
      ));
    }

    return variants.rnd().$1;
  }
}

class ContextCollection {}

class KanaCollection {}
