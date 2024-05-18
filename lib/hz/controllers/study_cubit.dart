import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/study_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyCubit extends Cubit<Task> {
  StudyCubit(this.service) : super(Task.empty());

  final StudyService service;

  Future<void> pickTask(int collectionID) async {
    final task = await service.getTask(collectionID);
    emit(task);
  }

  Future<void> submitTask(int collectionID, int itemID, int timems, Map<int, int> answers) async {
    final status = service.checkAnswer(state, answers);
    await service.sendResult(collectionID, itemID, timems, status);
  }
}
