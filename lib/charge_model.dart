import 'package:json_annotation/json_annotation.dart';
part 'charge_model.g.dart';

@JsonSerializable()
class ChargeModel{
  @JsonKey(name: 'amount')
  String? amount;
  @JsonKey(name: 'currency')
  String? currency;
  @JsonKey(name: 'source')
  String? source;
  ChargeModel({required this.amount,required this.currency,required this.source});


  factory ChargeModel.fromJson(Map<String, dynamic> json) => _$ChargeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChargeModelToJson(this);
}