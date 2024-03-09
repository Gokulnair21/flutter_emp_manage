// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() onDataSaved,
    required TResult Function() onDataUpdated,
    required TResult Function(DateTime d, String message) onValidationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? onDataSaved,
    TResult? Function()? onDataUpdated,
    TResult? Function(DateTime d, String message)? onValidationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? onDataSaved,
    TResult Function()? onDataUpdated,
    TResult Function(DateTime d, String message)? onValidationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(DataSaved value) onDataSaved,
    required TResult Function(DataUpdated value) onDataUpdated,
    required TResult Function(ValidationFailed value) onValidationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(DataSaved value)? onDataSaved,
    TResult? Function(DataUpdated value)? onDataUpdated,
    TResult? Function(ValidationFailed value)? onValidationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(DataSaved value)? onDataSaved,
    TResult Function(DataUpdated value)? onDataUpdated,
    TResult Function(ValidationFailed value)? onValidationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsStateCopyWith<$Res> {
  factory $DetailsStateCopyWith(
          DetailsState value, $Res Function(DetailsState) then) =
      _$DetailsStateCopyWithImpl<$Res, DetailsState>;
}

/// @nodoc
class _$DetailsStateCopyWithImpl<$Res, $Val extends DetailsState>
    implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$DetailsStateCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  _$InitializeImpl();

  @override
  String toString() {
    return 'DetailsState.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() onDataSaved,
    required TResult Function() onDataUpdated,
    required TResult Function(DateTime d, String message) onValidationFailed,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? onDataSaved,
    TResult? Function()? onDataUpdated,
    TResult? Function(DateTime d, String message)? onValidationFailed,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? onDataSaved,
    TResult Function()? onDataUpdated,
    TResult Function(DateTime d, String message)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(DataSaved value) onDataSaved,
    required TResult Function(DataUpdated value) onDataUpdated,
    required TResult Function(ValidationFailed value) onValidationFailed,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(DataSaved value)? onDataSaved,
    TResult? Function(DataUpdated value)? onDataUpdated,
    TResult? Function(ValidationFailed value)? onValidationFailed,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(DataSaved value)? onDataSaved,
    TResult Function(DataUpdated value)? onDataUpdated,
    TResult Function(ValidationFailed value)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements DetailsState {
  factory Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$DataSavedImplCopyWith<$Res> {
  factory _$$DataSavedImplCopyWith(
          _$DataSavedImpl value, $Res Function(_$DataSavedImpl) then) =
      __$$DataSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataSavedImplCopyWithImpl<$Res>
    extends _$DetailsStateCopyWithImpl<$Res, _$DataSavedImpl>
    implements _$$DataSavedImplCopyWith<$Res> {
  __$$DataSavedImplCopyWithImpl(
      _$DataSavedImpl _value, $Res Function(_$DataSavedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DataSavedImpl implements DataSaved {
  _$DataSavedImpl();

  @override
  String toString() {
    return 'DetailsState.onDataSaved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DataSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() onDataSaved,
    required TResult Function() onDataUpdated,
    required TResult Function(DateTime d, String message) onValidationFailed,
  }) {
    return onDataSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? onDataSaved,
    TResult? Function()? onDataUpdated,
    TResult? Function(DateTime d, String message)? onValidationFailed,
  }) {
    return onDataSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? onDataSaved,
    TResult Function()? onDataUpdated,
    TResult Function(DateTime d, String message)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (onDataSaved != null) {
      return onDataSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(DataSaved value) onDataSaved,
    required TResult Function(DataUpdated value) onDataUpdated,
    required TResult Function(ValidationFailed value) onValidationFailed,
  }) {
    return onDataSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(DataSaved value)? onDataSaved,
    TResult? Function(DataUpdated value)? onDataUpdated,
    TResult? Function(ValidationFailed value)? onValidationFailed,
  }) {
    return onDataSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(DataSaved value)? onDataSaved,
    TResult Function(DataUpdated value)? onDataUpdated,
    TResult Function(ValidationFailed value)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (onDataSaved != null) {
      return onDataSaved(this);
    }
    return orElse();
  }
}

abstract class DataSaved implements DetailsState {
  factory DataSaved() = _$DataSavedImpl;
}

/// @nodoc
abstract class _$$DataUpdatedImplCopyWith<$Res> {
  factory _$$DataUpdatedImplCopyWith(
          _$DataUpdatedImpl value, $Res Function(_$DataUpdatedImpl) then) =
      __$$DataUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataUpdatedImplCopyWithImpl<$Res>
    extends _$DetailsStateCopyWithImpl<$Res, _$DataUpdatedImpl>
    implements _$$DataUpdatedImplCopyWith<$Res> {
  __$$DataUpdatedImplCopyWithImpl(
      _$DataUpdatedImpl _value, $Res Function(_$DataUpdatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DataUpdatedImpl implements DataUpdated {
  _$DataUpdatedImpl();

  @override
  String toString() {
    return 'DetailsState.onDataUpdated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DataUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() onDataSaved,
    required TResult Function() onDataUpdated,
    required TResult Function(DateTime d, String message) onValidationFailed,
  }) {
    return onDataUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? onDataSaved,
    TResult? Function()? onDataUpdated,
    TResult? Function(DateTime d, String message)? onValidationFailed,
  }) {
    return onDataUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? onDataSaved,
    TResult Function()? onDataUpdated,
    TResult Function(DateTime d, String message)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (onDataUpdated != null) {
      return onDataUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(DataSaved value) onDataSaved,
    required TResult Function(DataUpdated value) onDataUpdated,
    required TResult Function(ValidationFailed value) onValidationFailed,
  }) {
    return onDataUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(DataSaved value)? onDataSaved,
    TResult? Function(DataUpdated value)? onDataUpdated,
    TResult? Function(ValidationFailed value)? onValidationFailed,
  }) {
    return onDataUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(DataSaved value)? onDataSaved,
    TResult Function(DataUpdated value)? onDataUpdated,
    TResult Function(ValidationFailed value)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (onDataUpdated != null) {
      return onDataUpdated(this);
    }
    return orElse();
  }
}

abstract class DataUpdated implements DetailsState {
  factory DataUpdated() = _$DataUpdatedImpl;
}

/// @nodoc
abstract class _$$ValidationFailedImplCopyWith<$Res> {
  factory _$$ValidationFailedImplCopyWith(_$ValidationFailedImpl value,
          $Res Function(_$ValidationFailedImpl) then) =
      __$$ValidationFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime d, String message});
}

/// @nodoc
class __$$ValidationFailedImplCopyWithImpl<$Res>
    extends _$DetailsStateCopyWithImpl<$Res, _$ValidationFailedImpl>
    implements _$$ValidationFailedImplCopyWith<$Res> {
  __$$ValidationFailedImplCopyWithImpl(_$ValidationFailedImpl _value,
      $Res Function(_$ValidationFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? d = null,
    Object? message = null,
  }) {
    return _then(_$ValidationFailedImpl(
      null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidationFailedImpl implements ValidationFailed {
  _$ValidationFailedImpl(this.d, this.message);

  @override
  final DateTime d;
  @override
  final String message;

  @override
  String toString() {
    return 'DetailsState.onValidationFailed(d: $d, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailedImpl &&
            (identical(other.d, d) || other.d == d) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, d, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailedImplCopyWith<_$ValidationFailedImpl> get copyWith =>
      __$$ValidationFailedImplCopyWithImpl<_$ValidationFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() onDataSaved,
    required TResult Function() onDataUpdated,
    required TResult Function(DateTime d, String message) onValidationFailed,
  }) {
    return onValidationFailed(d, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? onDataSaved,
    TResult? Function()? onDataUpdated,
    TResult? Function(DateTime d, String message)? onValidationFailed,
  }) {
    return onValidationFailed?.call(d, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? onDataSaved,
    TResult Function()? onDataUpdated,
    TResult Function(DateTime d, String message)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (onValidationFailed != null) {
      return onValidationFailed(d, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(DataSaved value) onDataSaved,
    required TResult Function(DataUpdated value) onDataUpdated,
    required TResult Function(ValidationFailed value) onValidationFailed,
  }) {
    return onValidationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(DataSaved value)? onDataSaved,
    TResult? Function(DataUpdated value)? onDataUpdated,
    TResult? Function(ValidationFailed value)? onValidationFailed,
  }) {
    return onValidationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(DataSaved value)? onDataSaved,
    TResult Function(DataUpdated value)? onDataUpdated,
    TResult Function(ValidationFailed value)? onValidationFailed,
    required TResult orElse(),
  }) {
    if (onValidationFailed != null) {
      return onValidationFailed(this);
    }
    return orElse();
  }
}

abstract class ValidationFailed implements DetailsState {
  factory ValidationFailed(final DateTime d, final String message) =
      _$ValidationFailedImpl;

  DateTime get d;
  String get message;
  @JsonKey(ignore: true)
  _$$ValidationFailedImplCopyWith<_$ValidationFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
