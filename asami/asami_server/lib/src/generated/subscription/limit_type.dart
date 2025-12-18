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

enum LimitType implements _i1.SerializableModel {
  tool_calls,
  ai_conversations,
  product_creation,
  ai_descriptions,
  analytics_queries,
  bulk_operations;

  static LimitType fromJson(int index) {
    switch (index) {
      case 0:
        return LimitType.tool_calls;
      case 1:
        return LimitType.ai_conversations;
      case 2:
        return LimitType.product_creation;
      case 3:
        return LimitType.ai_descriptions;
      case 4:
        return LimitType.analytics_queries;
      case 5:
        return LimitType.bulk_operations;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "LimitType"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
