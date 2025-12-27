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
import 'package:serverpod/serverpod.dart' as _i1;

enum PaymentMethod implements _i1.SerializableModel {
  credit_card,
  debit_card,
  bank_transfer,
  mobile_money,
  paypal,
  apple_pay,
  google_pay,
  bitcoin,
  ethereum,
  usdt,
  usdc,
  other_crypto;

  static PaymentMethod fromJson(String name) {
    switch (name) {
      case 'credit_card':
        return PaymentMethod.credit_card;
      case 'debit_card':
        return PaymentMethod.debit_card;
      case 'bank_transfer':
        return PaymentMethod.bank_transfer;
      case 'mobile_money':
        return PaymentMethod.mobile_money;
      case 'paypal':
        return PaymentMethod.paypal;
      case 'apple_pay':
        return PaymentMethod.apple_pay;
      case 'google_pay':
        return PaymentMethod.google_pay;
      case 'bitcoin':
        return PaymentMethod.bitcoin;
      case 'ethereum':
        return PaymentMethod.ethereum;
      case 'usdt':
        return PaymentMethod.usdt;
      case 'usdc':
        return PaymentMethod.usdc;
      case 'other_crypto':
        return PaymentMethod.other_crypto;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "PaymentMethod"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
