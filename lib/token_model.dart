import 'package:json_annotation/json_annotation.dart';
part 'token_model.g.dart';


 @JsonSerializable()
 class TokenModel{
  @JsonKey(name: 'card[number]')
  String? cardNumber;
  @JsonKey(name: 'card[exp_month]')
  String? expMonth;
  @JsonKey(name: 'card[exp_year]')
  String? expYear;
  @JsonKey(name: 'card[cvc]')
  String? cardCvc;

  TokenModel({required this.expMonth,required this.expYear,required this.cardCvc,required this.cardNumber});

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

}