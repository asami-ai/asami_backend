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

enum LimitType implements _i1.SerializableModel {
  tool_calls,
  ai_conversations,
  product_creation,
  ai_descriptions,
  analytics_queries,
  bulk_operations;

  static LimitType fromJson(String name) {
    switch (name) {
      case 'tool_calls':
        return LimitType.tool_calls;
      case 'ai_conversations':
        return LimitType.ai_conversations;
      case 'product_creation':
        return LimitType.product_creation;
      case 'ai_descriptions':
        return LimitType.ai_descriptions;
      case 'analytics_queries':
        return LimitType.analytics_queries;
      case 'bulk_operations':
        return LimitType.bulk_operations;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "LimitType"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
