import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'globals.dart';
import 'package:flutter_application_1/colors.dart';

class DetalheViagem extends StatelessWidget {
  final dbviagens post;

  const DetalheViagem({Key? key, required this.post}) : super(key: key);

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
                    : () => _showReservationDialog(context),
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

  Future<void> _showReservationDialog(BuildContext context) async {
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
}
