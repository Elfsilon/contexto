// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudyState _$StudyStateFromJson(Map<String, dynamic> json) {
  return _StudyState.fromJson(json);
}

/// @nodoc
mixin _$StudyState {
  Task get task => throw _privateConstructorUsedError;
  int get counter => throw _privateConstructorUsedError;
  Set<int> get failedIndexes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudyStateCopyWith<StudyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyStateCopyWith<$Res> {
  factory $StudyStateCopyWith(
          StudyState value, $Res Function(StudyState) then) =
      _$StudyStateCopyWithImpl<$Res, StudyState>;
  @useResult
  $Res call({Task task, int counter, Set<int> failedIndexes});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$StudyStateCopyWithImpl<$Res, $Val extends StudyState>
    implements $StudyStateCopyWith<$Res> {
  _$StudyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? counter = null,
    Object? failedIndexes = null,
  }) {
    return _then(_value.copyWith(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      failedIndexes: null == failedIndexes
          ? _value.failedIndexes
          : failedIndexes // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudyStateImplCopyWith<$Res>
    implements $StudyStateCopyWith<$Res> {
  factory _$$StudyStateImplCopyWith(
          _$StudyStateImpl value, $Res Function(_$StudyStateImpl) then) =
      __$$StudyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Task task, int counter, Set<int> failedIndexes});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$StudyStateImplCopyWithImpl<$Res>
    extends _$StudyStateCopyWithImpl<$Res, _$StudyStateImpl>
    implements _$$StudyStateImplCopyWith<$Res> {
  __$$StudyStateImplCopyWithImpl(
      _$StudyStateImpl _value, $Res Function(_$StudyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? counter = null,
    Object? failedIndexes = null,
  }) {
    return _then(_$StudyStateImpl(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      failedIndexes: null == failedIndexes
          ? _value._failedIndexes
          : failedIndexes // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudyStateImpl implements _StudyState {
  const _$StudyStateImpl(
      {required this.task,
      this.counter = 0,
      final Set<int> failedIndexes = const {}})
      : _failedIndexes = failedIndexes;

  factory _$StudyStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudyStateImplFromJson(json);

  @override
  final Task task;
  @override
  @JsonKey()
  final int counter;
  final Set<int> _failedIndexes;
  @override
  @JsonKey()
  Set<int> get failedIndexes {
    if (_failedIndexes is EqualUnmodifiableSetView) return _failedIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_failedIndexes);
  }

  @override
  String toString() {
    return 'StudyState(task: $task, counter: $counter, failedIndexes: $failedIndexes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudyStateImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.counter, counter) || other.counter == counter) &&
            const DeepCollectionEquality()
                .equals(other._failedIndexes, _failedIndexes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, task, counter,
      const DeepCollectionEquality().hash(_failedIndexes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudyStateImplCopyWith<_$StudyStateImpl> get copyWith =>
      __$$StudyStateImplCopyWithImpl<_$StudyStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudyStateImplToJson(
      this,
    );
  }
}

abstract class _StudyState implements StudyState {
  const factory _StudyState(
      {required final Task task,
      final int counter,
      final Set<int> failedIndexes}) = _$StudyStateImpl;

  factory _StudyState.fromJson(Map<String, dynamic> json) =
      _$StudyStateImpl.fromJson;

  @override
  Task get task;
  @override
  int get counter;
  @override
  Set<int> get failedIndexes;
  @override
  @JsonKey(ignore: true)
  _$$StudyStateImplCopyWith<_$StudyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
