import 'dart:convert';
import 'dart:ffi';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class dbviagens {
  String id = "";
  String nomeCarona = "";
  int assentos = 0;
  double valor = 0;
  String partida = "";
  String destino = "";
  String data = "";
  String hPartida = "";
  String descricao = "";
  String foto ;
  String evento = "";
  String idResponsavel = "";
  String status = "";
  String nomeMotorista = "";
  String modelo = "";
  String placa = "";

 factory dbviagens.fromJson(Map<dynamic, dynamic> json) {

    return dbviagens(
      
      id: json['_id'],
      nomeCarona: json['nomeCarona'],
      assentos: int.parse(json['assentos']),
      valor: double.parse(json['valor']),
      partida: json['partida'],
      destino: json['destino'],
      data: json['data'],
      hPartida: json['hPartida'],
      descricao: json['descricao'],
      foto: (json['foto']),
      evento: json['evento'],
      idResponsavel: json['idResponsavel'],
      status: json['status'],
      nomeMotorista: json['nomeMotorista'],
      modelo: json['modelo'],
      placa: json['placa'],
    );
  }
   dbviagens({
    required this.id,
    required this.nomeCarona,
    required this.assentos,
    required this.valor,
    required this.partida,
    required this.destino,
    required this.data,
    required this.hPartida,
    required this.descricao,
    required this.foto,
    required this.evento,
    required this.idResponsavel,
    required this.status,
    required this.nomeMotorista,
    required this.modelo,
    required this.placa,
  });

}

