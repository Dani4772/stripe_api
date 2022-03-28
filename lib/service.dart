import 'package:dio/dio.dart';
import 'package:stripe_api/charge_model.dart';
import 'package:stripe_api/refund_model.dart';
import 'package:stripe_api/token_model.dart';

class Service {
  final Dio _dio = Dio();

  Future<String> generateCardToken(TokenModel obj) async {
    try {
      var response = await _dio.post(
        'https://api.stripe.com/v1/tokens',
        data: obj.toJson(),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization':
                'Bearer sk_test_51KZYqYLQcMqN2tVh1VBtEP60VCEfYuZ5jKUaAEhu3YdE2FqP6fO0DylDuqvFLinHNBFuqP2Sk8zvss6qigiFZwxn00nFcppcOn',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      );
      return response.data['id'];
    } catch (e) {
      return'';
    }
  }

  Future<String> chargeAmount(ChargeModel obj) async {
    try {
      var response = await _dio.post(
        'https://api.stripe.com/v1/charges',
        data: obj.toJson(),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization':
            'Bearer sk_test_51KZYqYLQcMqN2tVh1VBtEP60VCEfYuZ5jKUaAEhu3YdE2FqP6fO0DylDuqvFLinHNBFuqP2Sk8zvss6qigiFZwxn00nFcppcOn',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      );
      return response.data['id'];
    } catch (e) {
      return'';
    }
  }

  Future<void> refundAmount(RefundModel obj) async {
    try {
      var response = await _dio.post(
        'https://api.stripe.com/v1/refunds',
        data: obj.toJson(),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization':
            'Bearer sk_test_51KZYqYLQcMqN2tVh1VBtEP60VCEfYuZ5jKUaAEhu3YdE2FqP6fO0DylDuqvFLinHNBFuqP2Sk8zvss6qigiFZwxn00nFcppcOn',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      );
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }



}
