import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  File? _pickedImage;
  String cpf = '';
  String name = '';
  String lastName = '';
  String birthday = '';
  String email = '';
  String telefone = '';
  String senha = '';
  String genero = '';
  String? foto = "default.png";

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

  @override
  Widget build(BuildContext context) {

    var maskPhone = new MaskTextInputFormatter(
  mask: '(##) #####-####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);
var maskNasc = new MaskTextInputFormatter(
  mask: '##/##/####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);
var maskCpf = new MaskTextInputFormatter(
  mask: '###.###.###-##', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
        backgroundColor: paleta,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            TextFormField(
              decoration: InputDecoration(
                        labelText: 'Nome',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                        labelText: 'Sobrenome',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                lastName = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              inputFormatters: [maskNasc],
              decoration: InputDecoration(
                        labelText: 'Data de Nascimento',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                birthday = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                        labelText: 'Email',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              inputFormatters: [maskCpf],
              decoration: InputDecoration(
                        labelText: 'CPF',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                cpf = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              inputFormatters: [maskPhone],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                        labelText: 'Telefone',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                telefone = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                        labelText: 'Senha',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                senha = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                        labelText: 'Genero',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: paleta),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                      ),
              onChanged: (value) {
                genero = value;
              },
            ),
            SizedBox(height: 16),
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
                  child: _pickedImage != null
                      ? Image.file(
                          File(_pickedImage!.path),
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: Text('Nenhuma imagem selecionada'),
                        ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _pickedImage = null;
                    });
                  },
                ),
              ],
            ),
            TextButton(
              onPressed: _pickImage,
              child: Text('Selecionar Foto'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Usuario user = new Usuario(
                  id: '',
                  cpf: cpf,
                  name: name,
                  lastName: lastName,
                  birthday: birthday,
                  email: email,
                  telefone: telefone,
                  senha: senha,
                  genero: genero,
                  foto: foto, 
                );
                final u = user.toJson();
                u.removeWhere((key, value) => key =="_id");
                print(u);
                print('a');
                            
                  final uri = Uri.parse('${url}/user');
                            final e = await http.post(uri, headers:  {
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(u),
                            
                             ).then( ( value) async {
                              
                              print(value.body.contains("insertedId"));

                              }).onError((error, stackTrace) {print('${error}   ${stackTrace}');});


              },
              child: Text('Cadastrar Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}
