/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum ProductStatus implements _i1.SerializableModel {
  draft,
  active,
  out_of_stock,
  discontinued,
  under_review;

  static ProductStatus fromJson(int index) {
    switch (index) {
      case 0:
        return ProductStatus.draft;
      case 1:
        return ProductStatus.active;
      case 2:
        return ProductStatus.out_of_stock;
      case 3:
        return ProductStatus.discontinued;
      case 4:
        return ProductStatus.under_review;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "ProductStatus"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
