// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudyStateImpl _$$StudyStateImplFromJson(Map<String, dynamic> json) =>
    _$StudyStateImpl(
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
      counter: (json['counter'] as num?)?.toInt() ?? 0,
      failedIndexes: (json['failedIndexes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$StudyStateImplToJson(_$StudyStateImpl instance) =>
    <String, dynamic>{
      'task': instance.task.toJson(),
      'counter': instance.counter,
      'failedIndexes': instance.failedIndexes.toList(),
    };
