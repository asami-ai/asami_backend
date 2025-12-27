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
import 'package:serverpod/serverpod.dart' as _i1;

enum ProductStatus implements _i1.SerializableModel {
  draft,
  active,
  out_of_stock,
  discontinued,
  under_review;

  static ProductStatus fromJson(String name) {
    switch (name) {
      case 'draft':
        return ProductStatus.draft;
      case 'active':
        return ProductStatus.active;
      case 'out_of_stock':
        return ProductStatus.out_of_stock;
      case 'discontinued':
        return ProductStatus.discontinued;
      case 'under_review':
        return ProductStatus.under_review;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "ProductStatus"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
