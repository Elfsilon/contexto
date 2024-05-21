import 'package:cringe/hz/controllers/study_state.dart';
import 'package:cringe/hz/services/study_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyCubit extends Cubit<StudyState> {
  StudyCubit(this.service) : super(StudyState.empty());

  final StudyService service;

  // TODO: Show loader
  Future<void> pickTask(int collectionID) async {
    final task = await service.getTask(collectionID);
    emit(state.copyWith(task: task));
  }

  Future<void> submitTask({
    required int timeMs,
    required Map<int, int> answers,
  }) async {
    final status = service.checkAnswer(state.task, answers);
    if (status != StudyStatus.skipped) {
      service.sendResult(state.task.collectionID, state.task.itemID, timeMs, status);

      if (status == StudyStatus.failed) {
        final updated = {...state.failedIndexes, answers.entries.first.value};
        emit(state.copyWith(failedIndexes: updated, counter: 0));
      } else {
        emit(state.copyWith(failedIndexes: {}, counter: state.counter + 1));
      }
    }

    if (status != StudyStatus.failed) {
      pickTask(state.task.collectionID);
    }
  }
}
