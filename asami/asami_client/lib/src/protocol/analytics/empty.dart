/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class EmptyModel implements _i1.SerializableModel {
  EmptyModel._({this.dummy});

  factory EmptyModel({bool? dummy}) = _EmptyModelImpl;

  factory EmptyModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmptyModel(dummy: jsonSerialization['dummy'] as bool?);
  }

  bool? dummy;

  /// Returns a shallow copy of this [EmptyModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EmptyModel copyWith({bool? dummy});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EmptyModel',
      if (dummy != null) 'dummy': dummy,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmptyModelImpl extends EmptyModel {
  _EmptyModelImpl({bool? dummy}) : super._(dummy: dummy);

  /// Returns a shallow copy of this [EmptyModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EmptyModel copyWith({Object? dummy = _Undefined}) {
    return EmptyModel(dummy: dummy is bool? ? dummy : this.dummy);
  }
}
