
import 'dart:convert';

import 'package:flutter_application_1/models/caronaModel.dart';
import 'package:http/http.dart' as http;
class caronaController{
String url = "http://192.168.3.13:3000";
caronaController(){}
Future<List<carona>> getCarona() async {

  final c = await http.get(Uri.parse('${url}/ride'));
                         
                           List<carona> Caronas = [];
                          List<dynamic> lista = jsonDecode(c.body);
                          lista.forEach((a) {Caronas.add(carona.fromJson(a));
                          
});
return await Caronas;



}
}