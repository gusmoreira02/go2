import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'package:flutter_application_1/models/eventos.dart';
import 'DetalheDaViagem.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/globals.dart' as globals;

class DetalheBolinha extends StatelessWidget {
  final eventos event;
  final List<dbviagens> ride;
  DetalheBolinha({required this.event , required this.ride});

  void _navigateToDetails(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalheViagem(post: ride[index]),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    eventos matchingBolinha = event;

    if (matchingBolinha.id == "") {
      return Scaffold(
        appBar: AppBar(
          title: Text(event.nome),
          elevation: 0,
        ),
        body: Center(
          child: Text('Nenhum post relacionado encontrado.'),
        ),
      );
    }

    List<dbviagens> matchingPosts = ride.where(
      (post) =>
          post.status == 'aberta' &&
          post.evento == matchingBolinha.id,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: paleta,
        title: Text(event.nome),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.memory(base64Decode(event.foto)).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Sobre o Evento",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                matchingBolinha.descricao ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Data: ${matchingBolinha.data ?? ''}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Local: ${matchingBolinha.localizacao ?? ''}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Exibindo os posts relacionados com o mesmo evento
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Viagens para o evento',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 1),
            Container(
              height: 250, // Ajuste a altura dos _posts
              child: matchingPosts.isNotEmpty
                  ? ListView.builder(
                      itemCount: matchingPosts.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _navigateToDetails(context, index),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Container(
                                    width: screenWidth*0.9, // Ajuste a largura dos _posts
                                    height: 250, // Ajuste a altura dos _posts
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        
                                        image: Image.memory(base64Decode(event.foto)).image, // Use a imagem do _post aqui
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: IconButton(
                                      icon: Icon(Icons.favorite, color: Colors.red),
                                      onPressed: () {
                                        // Lógica para curtir a viagem
                                      },
                                    ),
                                  ),
                                  Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        matchingPosts[index].nomeCarona!,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            'R\$',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            matchingPosts[index].valor.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text(
                                        matchingPosts[index].destino!,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('Nenhuma viagem disponível para esse evento.'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
