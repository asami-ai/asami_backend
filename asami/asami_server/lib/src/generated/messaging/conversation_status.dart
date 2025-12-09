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

enum ConversationStatus implements _i1.SerializableModel {
  active,
  waiting_user,
  waiting_bot,
  escalated_to_vendor,
  resolved,
  archived;

  static ConversationStatus fromJson(int index) {
    switch (index) {
      case 0:
        return ConversationStatus.active;
      case 1:
        return ConversationStatus.waiting_user;
      case 2:
        return ConversationStatus.waiting_bot;
      case 3:
        return ConversationStatus.escalated_to_vendor;
      case 4:
        return ConversationStatus.resolved;
      case 5:
        return ConversationStatus.archived;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "ConversationStatus"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
