import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class EditarPerfil extends StatefulWidget {
  final Usuario user;

  EditarPerfil({required this.user});

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  String foto = "";

  File? _pickedImage;

  @override
  void initState() {
    foto = widget.user.foto!;
    super.initState();
    _nameController.text = widget.user.name;
    _cpfController.text = widget.user.cpf;
    _birthdayController.text = widget.user.birthday;
    _emailController.text = widget.user.email;
    _telefoneController.text = widget.user.telefone;
    _generoController.text = widget.user.genero;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File imagefile = File(pickedImage.path);
      Uint8List imagebytes = await imagefile.readAsBytes();
      String base64string = base64.encode(imagebytes);
      setState(() {
        foto = base64string;
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _updateUser() async {
    Usuario user = widget.user;
    user.name = _nameController.text;
    user.birthday = _birthdayController.text;
    user.email = _emailController.text;
    user.telefone = _telefoneController.text;
    user.genero = _generoController.text;
    user.foto = foto;
    print(widget.user.toJson());
    final uri = Uri.parse('${url}/user');
    try {
      final response = await http.put(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(widget.user.toJson()),
      );

      if (response.statusCode == 200) {
        // A atualização foi bem-sucedida
        print('Usuário atualizado com sucesso.');
      } else {
        // Houve um erro na atualização
        print('Erro ao atualizar usuário. Código de resposta: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao atualizar usuário: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(90.0),
      borderSide: BorderSide(color: paleta, width: 1.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _cpfController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'CPF',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _birthdayController,
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _telefoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _generoController,
              decoration: InputDecoration(
                labelText: 'Gênero',
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: 15),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: foto != ""
                      ? ClipOval(
                          child: Image.memory(
                            Uint8List.fromList(base64.decode(foto!)),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                        )
                      : Center(
                          child: Text('Nenhuma imagem selecionada'),
                        ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      foto = "";
                    });
                  },
                ),
              ],
            ),
            TextButton(
              onPressed: _pickImage,
              child: Text('Selecionar Foto'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
