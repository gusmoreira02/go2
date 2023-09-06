import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';

class SuportePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: paleta,
        title: Text('Dê uma Carona'),
      ),
      body: Center(
        child: Text('Página de Dê uma Carona'),
      ),
    );
  }
}
