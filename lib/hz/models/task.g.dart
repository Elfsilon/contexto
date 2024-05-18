// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      collectionID: (json['collectionID'] as num).toInt(),
      itemID: (json['itemID'] as num).toInt(),
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      title: json['title'] as String,
      targets:
          (json['targets'] as List<dynamic>).map((e) => e as String).toList(),
      variants:
          (json['variants'] as List<dynamic>).map((e) => e as String).toList(),
      answers: (json['answers'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'collectionID': instance.collectionID,
      'itemID': instance.itemID,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'title': instance.title,
      'targets': instance.targets,
      'variants': instance.variants,
      'answers': instance.answers.map((k, e) => MapEntry(k.toString(), e)),
    };

const _$TaskTypeEnumMap = {
  TaskType.def: 'DEFAULT',
  TaskType.pickOne: 'PICK_ONE',
  TaskType.connect: 'CONNECT',
};
