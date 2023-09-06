import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/colors.dart';

class MudarSenhaPage extends StatefulWidget {
  final Usuario user;

  MudarSenhaPage({required this.user});

  @override
  _MudarSenhaPageState createState() => _MudarSenhaPageState();
}

class _MudarSenhaPageState extends State<MudarSenhaPage> {
  final TextEditingController _senhaAntigaController = TextEditingController();
  final TextEditingController _novaSenhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(90.0),
      borderSide: BorderSide(color: paleta, width: 1.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mudar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _senhaAntigaController,
              // Não definir readOnly para permitir edição
              obscureText: true, // Obscure a senha com asteriscos
              decoration: InputDecoration(
                labelText: 'Senha Antiga',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _novaSenhaController,
              // Não definir readOnly para permitir edição
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Nova Senha',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _confirmarSenhaController,
              // Não definir readOnly para permitir edição
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar Nova Senha',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Lógica para validar e mudar a senha aqui

                // Após a mudança de senha, você pode voltar para a tela anterior
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
