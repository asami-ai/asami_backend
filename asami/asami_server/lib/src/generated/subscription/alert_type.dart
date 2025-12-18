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

enum AlertType implements _i1.SerializableModel {
  soft_limit_approaching,
  soft_limit_reached,
  hard_limit_reached,
  grace_period_activated,
  limit_reset,
  upgrade_recommended,
  cost_threshold;

  static AlertType fromJson(int index) {
    switch (index) {
      case 0:
        return AlertType.soft_limit_approaching;
      case 1:
        return AlertType.soft_limit_reached;
      case 2:
        return AlertType.hard_limit_reached;
      case 3:
        return AlertType.grace_period_activated;
      case 4:
        return AlertType.limit_reset;
      case 5:
        return AlertType.upgrade_recommended;
      case 6:
        return AlertType.cost_threshold;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "AlertType"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
