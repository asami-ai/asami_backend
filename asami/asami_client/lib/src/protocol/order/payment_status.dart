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

enum PaymentStatus implements _i1.SerializableModel {
  pending,
  processing,
  completed,
  failed,
  refunded,
  partially_refunded,
  in_escrow,
  released;

  static PaymentStatus fromJson(int index) {
    switch (index) {
      case 0:
        return PaymentStatus.pending;
      case 1:
        return PaymentStatus.processing;
      case 2:
        return PaymentStatus.completed;
      case 3:
        return PaymentStatus.failed;
      case 4:
        return PaymentStatus.refunded;
      case 5:
        return PaymentStatus.partially_refunded;
      case 6:
        return PaymentStatus.in_escrow;
      case 7:
        return PaymentStatus.released;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "PaymentStatus"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
