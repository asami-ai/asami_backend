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

enum AlertType implements _i1.SerializableModel {
  soft_limit_approaching,
  soft_limit_reached,
  hard_limit_reached,
  grace_period_activated,
  limit_reset,
  upgrade_recommended,
  cost_threshold;

  static AlertType fromJson(String name) {
    switch (name) {
      case 'soft_limit_approaching':
        return AlertType.soft_limit_approaching;
      case 'soft_limit_reached':
        return AlertType.soft_limit_reached;
      case 'hard_limit_reached':
        return AlertType.hard_limit_reached;
      case 'grace_period_activated':
        return AlertType.grace_period_activated;
      case 'limit_reset':
        return AlertType.limit_reset;
      case 'upgrade_recommended':
        return AlertType.upgrade_recommended;
      case 'cost_threshold':
        return AlertType.cost_threshold;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "AlertType"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
