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

enum MessageType implements _i1.SerializableModel {
  text,
  image,
  video,
  audio,
  document,
  location,
  contact,
  interactive,
  template;

  static MessageType fromJson(int index) {
    switch (index) {
      case 0:
        return MessageType.text;
      case 1:
        return MessageType.image;
      case 2:
        return MessageType.video;
      case 3:
        return MessageType.audio;
      case 4:
        return MessageType.document;
      case 5:
        return MessageType.location;
      case 6:
        return MessageType.contact;
      case 7:
        return MessageType.interactive;
      case 8:
        return MessageType.template;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "MessageType"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
