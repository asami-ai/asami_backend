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

  static PaymentMethod fromJson(int index) {
    switch (index) {
      case 0:
        return PaymentMethod.credit_card;
      case 1:
        return PaymentMethod.debit_card;
      case 2:
        return PaymentMethod.bank_transfer;
      case 3:
        return PaymentMethod.mobile_money;
      case 4:
        return PaymentMethod.paypal;
      case 5:
        return PaymentMethod.apple_pay;
      case 6:
        return PaymentMethod.google_pay;
      case 7:
        return PaymentMethod.bitcoin;
      case 8:
        return PaymentMethod.ethereum;
      case 9:
        return PaymentMethod.usdt;
      case 10:
        return PaymentMethod.usdc;
      case 11:
        return PaymentMethod.other_crypto;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "PaymentMethod"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
