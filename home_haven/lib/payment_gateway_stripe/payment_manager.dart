import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:home_haven/payment_gateway_stripe/stripe_keys.dart';

abstract class PaymentManager {
  
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await getClientSecret((amount * 100).toString(), currency);
      await buildPaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<String> getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post('https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StripeKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
        data: {'amount': amount, 'currency': currency});

    return response.data['client_secret'];
  }

  static Future<void> buildPaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: "HomeHaven"));
  }
}
