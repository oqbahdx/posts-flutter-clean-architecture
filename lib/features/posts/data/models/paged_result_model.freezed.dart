// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagedResultModel {

 List<PostModel> get items; int get page; int get pageSize; int get totalCount; int get totalPages; bool get hasPreviousPage; bool get hasNextPage;
/// Create a copy of PagedResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagedResultModelCopyWith<PagedResultModel> get copyWith => _$PagedResultModelCopyWithImpl<PagedResultModel>(this as PagedResultModel, _$identity);

  /// Serializes this PagedResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagedResultModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,pageSize,totalCount,totalPages,hasPreviousPage,hasNextPage);

@override
String toString() {
  return 'PagedResultModel(items: $items, page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class $PagedResultModelCopyWith<$Res>  {
  factory $PagedResultModelCopyWith(PagedResultModel value, $Res Function(PagedResultModel) _then) = _$PagedResultModelCopyWithImpl;
@useResult
$Res call({
 List<PostModel> items, int page, int pageSize, int totalCount, int totalPages, bool hasPreviousPage, bool hasNextPage
});




}
/// @nodoc
class _$PagedResultModelCopyWithImpl<$Res>
    implements $PagedResultModelCopyWith<$Res> {
  _$PagedResultModelCopyWithImpl(this._self, this._then);

  final PagedResultModel _self;
  final $Res Function(PagedResultModel) _then;

/// Create a copy of PagedResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? totalPages = null,Object? hasPreviousPage = null,Object? hasNextPage = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PostModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PagedResultModel].
extension PagedResultModelPatterns on PagedResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagedResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagedResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagedResultModel value)  $default,){
final _that = this;
switch (_that) {
case _PagedResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagedResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _PagedResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostModel> items,  int page,  int pageSize,  int totalCount,  int totalPages,  bool hasPreviousPage,  bool hasNextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagedResultModel() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostModel> items,  int page,  int pageSize,  int totalCount,  int totalPages,  bool hasPreviousPage,  bool hasNextPage)  $default,) {final _that = this;
switch (_that) {
case _PagedResultModel():
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostModel> items,  int page,  int pageSize,  int totalCount,  int totalPages,  bool hasPreviousPage,  bool hasNextPage)?  $default,) {final _that = this;
switch (_that) {
case _PagedResultModel() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalCount,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PagedResultModel extends PagedResultModel {
  const _PagedResultModel({required final  List<PostModel> items, required this.page, required this.pageSize, required this.totalCount, required this.totalPages, required this.hasPreviousPage, required this.hasNextPage}): _items = items,super._();
  factory _PagedResultModel.fromJson(Map<String, dynamic> json) => _$PagedResultModelFromJson(json);

 final  List<PostModel> _items;
@override List<PostModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int page;
@override final  int pageSize;
@override final  int totalCount;
@override final  int totalPages;
@override final  bool hasPreviousPage;
@override final  bool hasNextPage;

/// Create a copy of PagedResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagedResultModelCopyWith<_PagedResultModel> get copyWith => __$PagedResultModelCopyWithImpl<_PagedResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PagedResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagedResultModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,pageSize,totalCount,totalPages,hasPreviousPage,hasNextPage);

@override
String toString() {
  return 'PagedResultModel(items: $items, page: $page, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class _$PagedResultModelCopyWith<$Res> implements $PagedResultModelCopyWith<$Res> {
  factory _$PagedResultModelCopyWith(_PagedResultModel value, $Res Function(_PagedResultModel) _then) = __$PagedResultModelCopyWithImpl;
@override @useResult
$Res call({
 List<PostModel> items, int page, int pageSize, int totalCount, int totalPages, bool hasPreviousPage, bool hasNextPage
});




}
/// @nodoc
class __$PagedResultModelCopyWithImpl<$Res>
    implements _$PagedResultModelCopyWith<$Res> {
  __$PagedResultModelCopyWithImpl(this._self, this._then);

  final _PagedResultModel _self;
  final $Res Function(_PagedResultModel) _then;

/// Create a copy of PagedResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalCount = null,Object? totalPages = null,Object? hasPreviousPage = null,Object? hasNextPage = null,}) {
  return _then(_PagedResultModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PostModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
