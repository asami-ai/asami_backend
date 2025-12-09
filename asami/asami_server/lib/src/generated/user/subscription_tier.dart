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

enum SubscriptionTier implements _i1.SerializableModel {
  freemium,
  pro,
  pro_max;

  static SubscriptionTier fromJson(int index) {
    switch (index) {
      case 0:
        return SubscriptionTier.freemium;
      case 1:
        return SubscriptionTier.pro;
      case 2:
        return SubscriptionTier.pro_max;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "SubscriptionTier"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
