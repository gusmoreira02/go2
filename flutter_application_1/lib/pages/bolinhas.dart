import 'package:flutter/material.dart';

class Bolinhas extends StatelessWidget {
  final String child; // Texto que será exibido na bolinha
  final String image; // Nome da imagem a ser exibida na bolinha
   final VoidCallback onTap;

  Bolinhas({required this.child, required this.image, required this.onTap}); // Construtor da classe

  @override
  Widget build(BuildContext context) {
    if (child.isEmpty || image.isEmpty) {
      return Container(); // Retorna um Container vazio se child ou image estiverem vazios
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black, // Cor de fundo da bolinha
          border: Border.all(
            color: Color(0xFFEE8146), // Cor do contorno verde
            width: 3.0, // Largura do contorno
          ),
          image: DecorationImage(image: AssetImage('lib/$image')), // Imagem de fundo da bolinha
        ),
        child: Stack(
          alignment: Alignment.bottomCenter, // Alinha o texto na parte inferior
          children: [
            Text(
              child, // Texto a ser exibido
              style: TextStyle(fontSize: 20), // Estilo do texto
            ),
          ],
        ),
      ),
    );
  }
}
