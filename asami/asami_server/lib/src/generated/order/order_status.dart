/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum OrderStatus implements _i1.SerializableModel {
  pending,
  confirmed,
  processing,
  packed,
  shipped,
  out_for_delivery,
  delivered,
  cancelled,
  refunded,
  failed;

  static OrderStatus fromJson(int index) {
    switch (index) {
      case 0:
        return OrderStatus.pending;
      case 1:
        return OrderStatus.confirmed;
      case 2:
        return OrderStatus.processing;
      case 3:
        return OrderStatus.packed;
      case 4:
        return OrderStatus.shipped;
      case 5:
        return OrderStatus.out_for_delivery;
      case 6:
        return OrderStatus.delivered;
      case 7:
        return OrderStatus.cancelled;
      case 8:
        return OrderStatus.refunded;
      case 9:
        return OrderStatus.failed;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "OrderStatus"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
