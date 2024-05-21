import 'package:cringe/hz/models/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_state.freezed.dart';
part 'study_state.g.dart';

@freezed
class StudyState with _$StudyState {
  const factory StudyState({
    required Task task,
    @Default(0) int counter,
    @Default({}) Set<int> failedIndexes,
  }) = _StudyState;

  factory StudyState.empty() => StudyState(
        task: Task.empty(),
        counter: 0,
        failedIndexes: const {},
      );

  factory StudyState.fromJson(Map<String, Object?> json) => _$StudyStateFromJson(json);
}
