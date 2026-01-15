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

enum WithdrawalStatus implements _i1.SerializableModel {
  pending,
  approved,
  processing,
  completed,
  failed,
  cancelled,
  reversed;

  static WithdrawalStatus fromJson(String name) {
    switch (name) {
      case 'pending':
        return WithdrawalStatus.pending;
      case 'approved':
        return WithdrawalStatus.approved;
      case 'processing':
        return WithdrawalStatus.processing;
      case 'completed':
        return WithdrawalStatus.completed;
      case 'failed':
        return WithdrawalStatus.failed;
      case 'cancelled':
        return WithdrawalStatus.cancelled;
      case 'reversed':
        return WithdrawalStatus.reversed;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "WithdrawalStatus"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
