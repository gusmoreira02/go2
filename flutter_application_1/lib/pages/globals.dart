library flutter_application_1.globals;
import 'dart:convert';

import 'package:flutter_application_1/models/UsuarioViagem.dart';
import 'package:flutter_application_1/models/caronaModel.dart';
import 'package:flutter_application_1/models/eventos.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:path_provider/path_provider.dart';
String url = "http://192.168.3.13:3000";

// https://vancrazy.rj.r.appspot.com/
// http://192.168.1.102:3000/


    Future<List<eventos>>getEventos() async {

  final e = await http.get(Uri.parse('${url}/event'));
  //e = jsonEncode(http.get(Uri.parse('http://192.168.1.102:3000/event'))) as eventos;
  List<eventos> Evento = [];
  List<dynamic> lista = jsonDecode(e.body);
  lista.forEach((a){Evento.add(eventos.fromJson(a));

  });


  return Evento;
}
Future<List<dbviagens>>getViagens() async {
  final e = await http.get(Uri.parse('${url}/ride'));
  //e = jsonEncode(http.get(Uri.parse('http://192.168.1.102:3000/event'))) as eventos;
  List<dbviagens> Viagem = [];
  List<dynamic> lista = jsonDecode(e.body);

  lista.forEach((a){ Viagem.add(dbviagens.fromJson(a));
  
  });

  //print(Viagem[0].nomeCarona);
  return Viagem;
}

Future<List<usuarioViagem>>getUsarioViagem() async {
  final e = await http.get(Uri.parse('${url}/UserRide'));
  //e = jsonEncode(http.get(Uri.parse('http://192.168.1.102:3000/event'))) as eventos;
  List<usuarioViagem> UsuarioViagem = [];
  List<dynamic> lista = jsonDecode(e.body);

  lista.forEach((a){ UsuarioViagem.add(usuarioViagem.fromJson(a));
  
  });

  //print(Viagem[0].nomeCarona);
  return UsuarioViagem;
}

List<eventos> Evento = [];
List<carona> Viagem = [];


List<Map<String, String>> _posts = [];

  




List<Map<String, String>> _bolinhas = [
  {
    'id': '1',
    'text': 'Oktoberfest',
    'image': 'picapau2.png',
    'descricaoEvento': 'Em alemão, "Oktober" significa outubro e "Fest", festa ou festival. O evento conta com atrações como desfiles de danças e trajes típicos, o Concurso Nacional de Tomadores de Chope em Metro e reúne o que há de melhor da culinária alemã.',
    'data': '10/10/2010',
    'local': 'Porto União',
  },
 
  // ... outros eventos
];


List<Map<String, String>> get bolinhas => _bolinhas;


Map<String, String> _usuario = {
  'id': '1',
  'nome': 'Nome do Usuário',
  'sobrenome': 'Sobrenome do Usuário',
  'cpf': '123.456.789-00',
  'dataNasc': '01/01/1990',
  'email': 'usuario@example.com',
  'telefone': '(00) 12345-6789',
  'senha': 'senha123',
  'documento': '123456789',
  'genero': 'Masculino',
  'foto': 'aa.png',
};

Map<String, String> get usuario => _usuario;


List<Map<String, String>> _usuarioCarona = [
  {'idUsuarioCarona': '1',
  'idCarona': '1',
  'idUsuario': '1',
  'statusPagamento': 'pago',
  },
  
  
  
];
Future<void> getPath() async {


path = await getApplicationDocumentsDirectory();

}
var path;

List<Map<String, String>> get usuarioCarona => _usuarioCarona;


