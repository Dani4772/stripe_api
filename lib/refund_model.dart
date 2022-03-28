import 'package:json_annotation/json_annotation.dart';
part 'refund_model.g.dart';
@JsonSerializable()
class RefundModel{

  @JsonKey(name: 'charge')
  String? chargeId;
  RefundModel({required this.chargeId});

  factory RefundModel.fromJson(Map<String, dynamic> json) => _$RefundModelFromJson(json);
  Map<String, dynamic> toJson() => _$RefundModelToJson(this);


}