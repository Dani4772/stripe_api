// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      expMonth: json['card[exp_month]'] as String?,
      expYear: json['card[exp_year]'] as String?,
      cardCvc: json['card[cvc]'] as String?,
      cardNumber: json['card[number]'] as String?,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'card[number]': instance.cardNumber,
      'card[exp_month]': instance.expMonth,
      'card[exp_year]': instance.expYear,
      'card[cvc]': instance.cardCvc,
    };
