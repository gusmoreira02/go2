import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/caronaModel.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/models/pagamentoModel.dart';
import 'package:flutter_application_1/pages/pagamento.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'globals.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; 



class DetalheViagem extends StatelessWidget {
  final carona post;
  final Usuario user;
     Map<String, dynamic>? paymentIntent;
   DetalheViagem({Key? key, required this.post, required this.user}) : super(key: key);
  
  @override


  Widget build(BuildContext context) {
    bool isTripUnavailable = post.status == 'terminada';
    bool isTripConfirmed = false;
    bool isTripPending = false;
      
    if (post.status == 'aberta') {
      for (var userCarona in usuarioCarona) {
        if (userCarona['idCarona'] == post.id &&
            userCarona['idUsuario'] == usuario['id']) {
          if (userCarona['statusPagamento'] == 'pago') {
            isTripConfirmed = true;
          } else {
            isTripPending = true;
          }
          break;
        }
      }
    }

       
 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: paleta,
        title: ImageIcon(
          AssetImage('lib/go2.png'),
          size: 80,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.memory(
                  base64Decode(post.foto),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: (MediaQuery.of(context).size.width * 0.05),
                  right: (MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                post.nomeCarona ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(post.data ?? ''),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(post.partida ?? ''),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(post.destino ?? ''),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sobre a Viagem',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                post.descricao ?? '',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.event_seat, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text(
                    'Assentos: ${post.assentos ?? ''}',
                    style: TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('R\$ ${post.valor ?? ''}', style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: isTripUnavailable
                    ? null
                    :() => makePayment(),
                    
                    /*showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(25.0),
        topRight: const Radius.circular(25.0),
      ),
    ),
                
                height: MediaQuery.of(context).size.height*0.5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),

                      SizedBox(
                        width: 100,
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(primary: paleta, ), 
                        child: const Text('CRebito'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Pagamento( user: user, post: post, tipo: "credito"),
                          ),
                        ),
                      ),),

                      SizedBox(
                        width: 200,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: paleta),
                        child: const Text('Debito'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Pagamento( user: user, post: post, tipo: "debito"),
                          ),
                        ),
                      ),),
                      SizedBox(
                        width: 200,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: paleta),
                        child: const Text('Pix'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Pagamento( user: user, post: post, tipo: "pix"),
                          ),
                        ),
                      ),),
                    ],
                  ),
                ),
              );
            },
          ),*/
                style: ElevatedButton.styleFrom(
                  primary: isTripUnavailable
                      ? Colors.grey
                      : (isTripConfirmed ? Colors.grey : (isTripPending ? Colors.red : Colors.green)),
                  elevation: 0,
                ),
                child: Text(
                  isTripUnavailable
                      ? 'Viagem Indisponível'
                      : (isTripConfirmed ? 'Viagem Confirmada' : (isTripPending ? 'Pendente' : 'Reservar')),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReservationDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Viagem Reservada'),
          content: Text('Viagem reservada com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
  

   

void makePayment()async{
try{
  paymentIntent = await createPaymentIntent();

  var gpay =PaymentSheetGooglePay(
    merchantCountryCode: "BR",
    currencyCode: "BRL",
    testEnv: true,


  );
await Stripe.instance.initPaymentSheet(
  paymentSheetParameters: SetupPaymentSheetParameters(
    paymentIntentClientSecret: paymentIntent!["client_secret"],
    style: ThemeMode.dark,
    merchantDisplayName: "Vancrazy",
    googlePay: gpay,
    billingDetails: BillingDetails(
      address: Address (
        country: "BR", city: 'null', line1: 'null', line2: 'null', postalCode: 'null', state: 'null',
      )
    ),
    
  )

);

displayPaymentSheet();
}catch (e){
  throw Exception(e.toString());
}
}

void displayPaymentSheet() async{
  
try{
  print("aaaa");
  final pagamento = await Stripe.instance.presentPaymentSheet();  
  print(pagamento);
  
}catch (e){
  throw Exception(e.toString());
}
http.Response data = await http.get(Uri.parse("https://api.stripe.com/v1/payment_intents/${paymentIntent!.values.elementAt(0)}"), headers: {"Authorization":"Bearer sk_test_51OB1cRLqElEuGrguCjXwpGhopMvKw7u5P97LyXq7A1YJUF1dq7ggXzGgQa9ERIGveqpsVqrMbaHIJSGtfzyvZYJm00SSsOr1Kp"});
    
  PaymentIntent r = await PaymentIntent.fromJson(jsonDecode(data.body) as Map<String, dynamic>); 
  print(r.id);
}
 createPaymentIntent() async{
    try{
      Map<String, dynamic> body={
        "amount": (post.valor*100).toInt().toString(),
         "currency": "BRL",
         };
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers:{
        "Authorization":"Bearer sk_test_51OB1cRLqElEuGrguCjXwpGhopMvKw7u5P97LyXq7A1YJUF1dq7ggXzGgQa9ERIGveqpsVqrMbaHIJSGtfzyvZYJm00SSsOr1Kp",
        "Content-Type": "application/x-www-form-urlencoded",
        });
        debugPrint("response: ${response.body}");
      return jsonDecode(response.body);

    }catch (e) {
      throw Exception(e.toString());
    }

 }

}
