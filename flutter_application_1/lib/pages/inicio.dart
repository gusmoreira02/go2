import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  final String child; // Mantenha o tipo como String
  final double width;
  final void Function()? onTap;

  const Inicio({required this.child, required this.width, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Define a função de toque para o GestureDetector
      child: Container(
        width: width, // Define a largura do container
        height: 200, // Define a altura do container
        margin: EdgeInsets.all(10), // Define a margem ao redor do container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Define bordas arredondadas
          color: Colors.blue, // Define a cor de fundo do container
        ),
        child: Center(
          child: Text(
            child, // Exibe o texto passado como parâmetro
            style: TextStyle(fontSize: 20), // Define o estilo do texto
          ),
        ),
      ),
    );
  }
}
