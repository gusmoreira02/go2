/*

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/models/caronaModel.dart';
import 'package:flutter_application_1/models/usuario.dart';

class Pagamento extends StatelessWidget {
  final Usuario user;
  final carona post;
  final String tipo;

  const Pagamento({super.key, required this.user, required this.post, required this.tipo});
  @override
  Widget build(BuildContext context) {
     
  Widget operacao(){
      switch(tipo){
      case "credito":

      return Container(

            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
            ),

            


      );



    }

  }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: paleta,
        title: Text(
          'Pagamento',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0, // Removendo sombra do AppBar
      ),
      body: SingleChildScrollView(
      
      ),
    );
  }
}

*/