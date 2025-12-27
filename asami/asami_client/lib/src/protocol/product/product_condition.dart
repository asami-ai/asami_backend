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

enum ProductCondition implements _i1.SerializableModel {
  newItem,
  refurbished,
  used_like_new,
  used_good,
  used_acceptable;

  static ProductCondition fromJson(String name) {
    switch (name) {
      case 'newItem':
        return ProductCondition.newItem;
      case 'refurbished':
        return ProductCondition.refurbished;
      case 'used_like_new':
        return ProductCondition.used_like_new;
      case 'used_good':
        return ProductCondition.used_good;
      case 'used_acceptable':
        return ProductCondition.used_acceptable;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "ProductCondition"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
