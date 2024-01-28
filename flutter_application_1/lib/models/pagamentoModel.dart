/* import 'dart:convert';

import 'package:http/http.dart' as http; 

class pagamentoModel{

  Future<List<carona>> createPayment( double amount  ) async {
String url = "https://api.stripe.com/v1/payment_intents";
  final c = await http.post(Uri.parse(url),headers: <String, String> {
    'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "amount": amount.toString(),
      "currency": "brl",
      "automatic_payment_methods": "true",
  })
                         
);
return await Caronas;



}

}

*/