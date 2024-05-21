// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  int get collectionID => throw _privateConstructorUsedError;
  int get itemID => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get targets => throw _privateConstructorUsedError;
  List<String> get variants => throw _privateConstructorUsedError;
  Map<int, int> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {int collectionID,
      int itemID,
      TaskType type,
      String title,
      List<String> targets,
      List<String> variants,
      Map<int, int> answers});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionID = null,
    Object? itemID = null,
    Object? type = null,
    Object? title = null,
    Object? targets = null,
    Object? variants = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      collectionID: null == collectionID
          ? _value.collectionID
          : collectionID // ignore: cast_nullable_to_non_nullable
              as int,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      targets: null == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int collectionID,
      int itemID,
      TaskType type,
      String title,
      List<String> targets,
      List<String> variants,
      Map<int, int> answers});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionID = null,
    Object? itemID = null,
    Object? type = null,
    Object? title = null,
    Object? targets = null,
    Object? variants = null,
    Object? answers = null,
  }) {
    return _then(_$TaskImpl(
      collectionID: null == collectionID
          ? _value.collectionID
          : collectionID // ignore: cast_nullable_to_non_nullable
              as int,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      targets: null == targets
          ? _value._targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.collectionID,
      required this.itemID,
      required this.type,
      required this.title,
      required final List<String> targets,
      required final List<String> variants,
      required final Map<int, int> answers})
      : _targets = targets,
        _variants = variants,
        _answers = answers;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final int collectionID;
  @override
  final int itemID;
  @override
  final TaskType type;
  @override
  final String title;
  final List<String> _targets;
  @override
  List<String> get targets {
    if (_targets is EqualUnmodifiableListView) return _targets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targets);
  }

  final List<String> _variants;
  @override
  List<String> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  final Map<int, int> _answers;
  @override
  Map<int, int> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  String toString() {
    return 'Task(collectionID: $collectionID, itemID: $itemID, type: $type, title: $title, targets: $targets, variants: $variants, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.collectionID, collectionID) ||
                other.collectionID == collectionID) &&
            (identical(other.itemID, itemID) || other.itemID == itemID) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._targets, _targets) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      collectionID,
      itemID,
      type,
      title,
      const DeepCollectionEquality().hash(_targets),
      const DeepCollectionEquality().hash(_variants),
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final int collectionID,
      required final int itemID,
      required final TaskType type,
      required final String title,
      required final List<String> targets,
      required final List<String> variants,
      required final Map<int, int> answers}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  int get collectionID;
  @override
  int get itemID;
  @override
  TaskType get type;
  @override
  String get title;
  @override
  List<String> get targets;
  @override
  List<String> get variants;
  @override
  Map<int, int> get answers;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
