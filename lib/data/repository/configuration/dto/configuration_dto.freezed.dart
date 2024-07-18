// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuration_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfigurationDto {
  Brightness get brightness => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigurationDtoCopyWith<ConfigurationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationDtoCopyWith<$Res> {
  factory $ConfigurationDtoCopyWith(
          ConfigurationDto value, $Res Function(ConfigurationDto) then) =
      _$ConfigurationDtoCopyWithImpl<$Res, ConfigurationDto>;
  @useResult
  $Res call({Brightness brightness});
}

/// @nodoc
class _$ConfigurationDtoCopyWithImpl<$Res, $Val extends ConfigurationDto>
    implements $ConfigurationDtoCopyWith<$Res> {
  _$ConfigurationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = null,
  }) {
    return _then(_value.copyWith(
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigurationDtoImplCopyWith<$Res>
    implements $ConfigurationDtoCopyWith<$Res> {
  factory _$$ConfigurationDtoImplCopyWith(_$ConfigurationDtoImpl value,
          $Res Function(_$ConfigurationDtoImpl) then) =
      __$$ConfigurationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Brightness brightness});
}

/// @nodoc
class __$$ConfigurationDtoImplCopyWithImpl<$Res>
    extends _$ConfigurationDtoCopyWithImpl<$Res, _$ConfigurationDtoImpl>
    implements _$$ConfigurationDtoImplCopyWith<$Res> {
  __$$ConfigurationDtoImplCopyWithImpl(_$ConfigurationDtoImpl _value,
      $Res Function(_$ConfigurationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = null,
  }) {
    return _then(_$ConfigurationDtoImpl(
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$ConfigurationDtoImpl
    with DiagnosticableTreeMixin
    implements _ConfigurationDto {
  const _$ConfigurationDtoImpl({required this.brightness});

  @override
  final Brightness brightness;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConfigurationDto(brightness: $brightness)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConfigurationDto'))
      ..add(DiagnosticsProperty('brightness', brightness));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurationDtoImpl &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurationDtoImplCopyWith<_$ConfigurationDtoImpl> get copyWith =>
      __$$ConfigurationDtoImplCopyWithImpl<_$ConfigurationDtoImpl>(
          this, _$identity);
}

abstract class _ConfigurationDto implements ConfigurationDto {
  const factory _ConfigurationDto({required final Brightness brightness}) =
      _$ConfigurationDtoImpl;

  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$ConfigurationDtoImplCopyWith<_$ConfigurationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
