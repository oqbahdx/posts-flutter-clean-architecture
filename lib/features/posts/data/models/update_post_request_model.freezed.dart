// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_post_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePostRequestModel {

 String get title; String get description;
/// Create a copy of UpdatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePostRequestModelCopyWith<UpdatePostRequestModel> get copyWith => _$UpdatePostRequestModelCopyWithImpl<UpdatePostRequestModel>(this as UpdatePostRequestModel, _$identity);

  /// Serializes this UpdatePostRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePostRequestModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'UpdatePostRequestModel(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $UpdatePostRequestModelCopyWith<$Res>  {
  factory $UpdatePostRequestModelCopyWith(UpdatePostRequestModel value, $Res Function(UpdatePostRequestModel) _then) = _$UpdatePostRequestModelCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$UpdatePostRequestModelCopyWithImpl<$Res>
    implements $UpdatePostRequestModelCopyWith<$Res> {
  _$UpdatePostRequestModelCopyWithImpl(this._self, this._then);

  final UpdatePostRequestModel _self;
  final $Res Function(UpdatePostRequestModel) _then;

/// Create a copy of UpdatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatePostRequestModel].
extension UpdatePostRequestModelPatterns on UpdatePostRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePostRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePostRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePostRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePostRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePostRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePostRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePostRequestModel() when $default != null:
return $default(_that.title,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description)  $default,) {final _that = this;
switch (_that) {
case _UpdatePostRequestModel():
return $default(_that.title,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePostRequestModel() when $default != null:
return $default(_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatePostRequestModel implements UpdatePostRequestModel {
  const _UpdatePostRequestModel({required this.title, required this.description});
  factory _UpdatePostRequestModel.fromJson(Map<String, dynamic> json) => _$UpdatePostRequestModelFromJson(json);

@override final  String title;
@override final  String description;

/// Create a copy of UpdatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePostRequestModelCopyWith<_UpdatePostRequestModel> get copyWith => __$UpdatePostRequestModelCopyWithImpl<_UpdatePostRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePostRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePostRequestModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'UpdatePostRequestModel(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$UpdatePostRequestModelCopyWith<$Res> implements $UpdatePostRequestModelCopyWith<$Res> {
  factory _$UpdatePostRequestModelCopyWith(_UpdatePostRequestModel value, $Res Function(_UpdatePostRequestModel) _then) = __$UpdatePostRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class __$UpdatePostRequestModelCopyWithImpl<$Res>
    implements _$UpdatePostRequestModelCopyWith<$Res> {
  __$UpdatePostRequestModelCopyWithImpl(this._self, this._then);

  final _UpdatePostRequestModel _self;
  final $Res Function(_UpdatePostRequestModel) _then;

/// Create a copy of UpdatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(_UpdatePostRequestModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
