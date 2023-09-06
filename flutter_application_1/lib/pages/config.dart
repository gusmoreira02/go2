import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/eventos.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/pages/configPages/politicas.dart';
import 'configPages/account.dart';
import 'configPages/carona.dart';
import 'configPages/termos.dart';
import 'configPages/suporte.dart';
import '../models/option_model.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'dart:developer';

class Config extends StatefulWidget {
    final Usuario user;
    final List<eventos> events;
  const Config({Key? key, required this.user, required this.events}) : super(key: key);
  @override
  _Config createState() => _Config();
}

class _Config extends State<Config> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(height: 15.0);
                } else if (index == options.length + 1) {
                  return SizedBox(height: 100.0);
                }
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: _selectedOption == index - 1
                        ? Border.all(color: paleta)
                        : null,
                  ),
                  child: ListTile(
                    leading: Icon(
                      options[index - 1].icon.icon,
                      color: _selectedOption == index - 1
                          ? paleta // Use your selected color here
                          : Colors.grey[600], // Fallback color for unselected options
                    ),
                    title: Text(
                      options[index - 1].title,
                      style: TextStyle(
                        color: _selectedOption == index - 1
                            ? Colors.black
                            : Colors.grey[600],
                      ),
                    ),
                    subtitle: Text(
                      options[index - 1].subtitle,
                      style: TextStyle(
                        color: _selectedOption == index - 1
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    selected: _selectedOption == index - 1,
                    
                    onTap: () {
                     
                      
                      setState(() {
                        _selectedOption = index - 1;
                      });

                      // Navegar para a página correspondente
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          if (index - 1 == 0) {
                         
                            return AccountPage(user: widget.user,);
                          } else if (index - 1 == 1) {
                            return CaronaPage(user:widget.user, events: widget.events);
                          } else if (index - 1 == 2) {
                            return TermosPage();
                          } else if (index - 1 == 3) {
                            return SuportePage();
                          } else if (index - 1 == 4) {
                            return PoliticasPage();
                          }

                          // Adicione outros casos aqui se necessário
                          return Container(); // Retorno padrão, caso não haja correspondência
                        },
                      ));
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
