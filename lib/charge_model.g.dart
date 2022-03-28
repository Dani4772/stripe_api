// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeModel _$ChargeModelFromJson(Map<String, dynamic> json) => ChargeModel(
      amount: json['amount'] as String?,
      currency: json['currency'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$ChargeModelToJson(ChargeModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'source': instance.source,
    };
