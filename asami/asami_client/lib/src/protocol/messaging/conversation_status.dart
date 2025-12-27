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

enum ConversationStatus implements _i1.SerializableModel {
  active,
  waiting_user,
  waiting_bot,
  escalated_to_vendor,
  resolved,
  archived;

  static ConversationStatus fromJson(String name) {
    switch (name) {
      case 'active':
        return ConversationStatus.active;
      case 'waiting_user':
        return ConversationStatus.waiting_user;
      case 'waiting_bot':
        return ConversationStatus.waiting_bot;
      case 'escalated_to_vendor':
        return ConversationStatus.escalated_to_vendor;
      case 'resolved':
        return ConversationStatus.resolved;
      case 'archived':
        return ConversationStatus.archived;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "ConversationStatus"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
