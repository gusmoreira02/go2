import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/eventos.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'DetalheBolinhas.dart';
import 'globals.dart';
import 'DetalheDaViagem.dart';
import 'package:flutter_application_1/pages/globals.dart';

class Home extends StatefulWidget {
   final Usuario user;
   final List<eventos> events;
   final List<dbviagens> ride;
  const Home({Key? key, required this.user, required this.events , required this.ride}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  List<eventos> _filteredBolinhas = [];
  List<dbviagens> _filteredPosts = [];
  //Map<String, String> _usuario = {};
  List<eventos> bolinha = [];
  List<dbviagens> posts = Viagem;

  
    
  void _navigateToBolinhasDetails(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalheBolinha(event: widget.events[index], ride: posts),
      ),
    );
  }

  void _navigateToDetails(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalheViagem(post: _filteredPosts[index]),
      ),
    );
  }

  void searchBolinhas(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredBolinhas = List.from(bolinha);
      } else {
        _filteredBolinhas = bolinha.where((b) {
          return b.nome!.toLowerCase().contains(searchText.toLowerCase());
        }).cast<eventos>().toList();
      }
    });
  }

  
  @override
  void initState() {
    super.initState();
    //_usuario = usuario;
    bolinha = widget.events;
    _filteredBolinhas = widget.events;
    _filteredPosts = widget.ride.where((post) => post.status == 'aberta').toList();
    
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, top: 30),
              alignment: Alignment.topLeft,
              child: Text(
                'Bem Vindo, ${widget.user.name}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (value) {
                  searchBolinhas(value);
                  
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Pesquisar eventos',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[300],
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Eventos:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 1),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: _filteredBolinhas.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      
                      _navigateToBolinhasDetails(
                        context,
                        index,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        image: DecorationImage(
                          image: Image.memory(base64Decode(_filteredBolinhas[index].foto)).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Viagens Próximas:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: _filteredPosts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
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
                    child: GestureDetector(
                      onTap: () => _navigateToDetails(context, index),
                      child: Stack(
                        children: [
                          Container(
                            width: screenWidth*0.9,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Image.memory(base64Decode(_filteredPosts[index].foto)).image,
                                fit: BoxFit.cover,
                              ),
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
                                        _filteredPosts[index].nomeCarona!,
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
                                            _filteredPosts[index].valor.toString(),
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
                                        _filteredPosts[index].destino!,
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
            ),
          ),
          ],
        ),
      ),
    );
  }
}