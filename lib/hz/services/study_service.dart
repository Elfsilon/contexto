import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/collections_manager.dart';

enum StudyStatus { succeded, failed, skipped }

class StudyService {
  final collections = CollectionsManager();

  Future<Task> getTask(int collectionID) async {
    return collections.getTask(collectionID);
  }

  StudyStatus checkAnswer(Task task, Map<int, int> answers) {
    for (final e in task.answers.entries) {
      if (answers[e.key] != e.value) {
        return StudyStatus.failed;
      }
    }
    return StudyStatus.succeded;
  }

  /// [time] time in miliseconds spent on the task
  /// [status] if [skipped], then counts as failed, but with a really little cost
  Future<void> sendResult(int collectionID, int itemID, int time, StudyStatus status) async {
    print("$status to collection=$collectionID, item=$itemID (${time}ms)");
  }
}
