import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/configPages/editarPerfil.dart';
import 'package:flutter_application_1/pages/configPages/mudarSenha.dart';
import '../globals.dart'; // Certifique-se de importar o arquivo globals.dart corretamente
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'dart:convert';

class AccountPage extends StatelessWidget {
  final Usuario user;

  const AccountPage({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: paleta,
        title: Text(
          'Minha Conta',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0, // Removendo sombra do AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                          CircleAvatar(
                backgroundImage: user.foto!= ""? MemoryImage(base64Decode(user.foto!)): Image.asset("assets/go3.png").image,
                radius: 80,
              ),
              SizedBox(height: 20),
              Text(
                '${user.name} ' '${user.lastName}',
                
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '${user.cpf}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Text(
                '${user.birthday}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Divider(thickness: 1, color: Colors.grey[400]),
              SizedBox(height: 20),
              Text(
                'Informações de Contato',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text(
                  '${user.email}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Telefone'),
                subtitle: Text(
                  '${user.telefone}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Documento'),
                subtitle: Text(
                  '${user.cpf}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Gênero'),
                subtitle: Text(
                  '${user.genero}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (  ) {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditarPerfil(user: user),
                              ),
                            );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 118, 202, 118),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Editar Perfil'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                          },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Sair da Conta'),
              ),
                                        ElevatedButton(
                            onPressed: () {
                              // Navegue para a tela de mudar senha
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MudarSenhaPage(user: user,), // Crie uma nova tela MudarSenhaPage
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue, // ou a cor que você desejar
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Mudar Senha'),
                          ),
            ],
          ),
        ),
      ),
    );
  }
}
