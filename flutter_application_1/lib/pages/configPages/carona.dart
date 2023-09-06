import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/caronaModel.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'package:flutter_application_1/models/eventos.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../globals.dart'; // Certifique-se de que o import está correto
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
class CaronaPage extends StatefulWidget {
   final Usuario user;
   final List<eventos> events;
  const CaronaPage({Key? key, required this.user, required this.events}) : super(key: key);
  @override
  _CaronaPageState createState() => _CaronaPageState();
}

class _CaronaPageState extends State<CaronaPage> {
  File? _pickedImage;
TextEditingController nomeCaronaController = TextEditingController(text: "");
TextEditingController assentosController = TextEditingController(text: "");
TextEditingController valorController = TextEditingController(text: "");
TextEditingController partidaController = TextEditingController(text: "");
TextEditingController destinoController = TextEditingController(text: "");
TextEditingController dataController = TextEditingController(text: "");
TextEditingController hPartidaController = TextEditingController(text: "");
TextEditingController descricaoController = TextEditingController(text: "");
 String? foto = "go3.png";
TextEditingController eventoController = TextEditingController(text: "");
TextEditingController idResponsavelController = TextEditingController(text: "");
TextEditingController statusController = TextEditingController(text: "");
TextEditingController nomeMotoristaController = TextEditingController(text: "");
TextEditingController modeloController = TextEditingController(text: "");
TextEditingController placaController = TextEditingController(text: "");


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    

   

    if (pickedImage != null) {
         File imagefile = File(pickedImage.path); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes); //convert bytes to base64 string
      setState(() {
        foto = base64string;
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Corrida'),
        backgroundColor: paleta, // Altera a cor da AppBar
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          TextFormField(
            controller: nomeCaronaController,
            decoration: InputDecoration(
              labelText: 'Nome da Corrida',
              border: OutlineInputBorder(),
            ),
          ),

            SizedBox(height: 16),
            TextFormField(
  controller: descricaoController,
  maxLines: 3,
  decoration: InputDecoration(
    labelText: 'Descrição',
    border: OutlineInputBorder(),
  ),
),

SizedBox(height: 16),

TextFormField(
  controller: valorController,
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    labelText: 'Valor',
    border: OutlineInputBorder(),
  ),
),

SizedBox(height: 16),

TextFormField(
  controller: destinoController,
  decoration: InputDecoration(
    labelText: 'Localização do Evento',
    border: OutlineInputBorder(),
  ),
),

SizedBox(height: 16),

TextFormField(
  controller: partidaController,
  decoration: InputDecoration(
    labelText: 'Local de Saída',
    border: OutlineInputBorder(),
  ),
),


            SizedBox(height: 16),
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
            TextFormField(
                    controller: assentosController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantidade de Assentos',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  TextFormField(
                    controller: dataController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Data da Viagem',
                      border: OutlineInputBorder(),
                    ),
                  ),

            SizedBox(height: 16),
            TypeAheadField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: eventoController,
                decoration: InputDecoration(
                  labelText: 'Evento',
                  border: OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (pattern) {
                List<eventos> lista = widget.events;
                return lista.where((e) =>
                        e.nome!.toLowerCase().contains(pattern.toLowerCase()))
                    .map((e) => e.nome!)
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                print(suggestion);
                eventoController.text = suggestion; 
                setState(() {
                  
                });
                
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                
                carona ride = new carona(
                    nomeCarona : nomeCaronaController.text,
                      assentos : int.tryParse(assentosController.text) ?? 0,
                      valor : double.tryParse(valorController.text) ?? 0.0,
                      partida : partidaController.text,
                      destino : destinoController.text,
                      data : dataController.text,
                      hPartida : hPartidaController.text,
                      descricao : descricaoController.text,
                      foto : foto,
                      evento : eventoController.text,
                      idResponsavel : idResponsavelController.text,
                      status : statusController.text,
                      nomeMotorista : nomeMotoristaController.text,
                      modelo : modeloController.text,
                      placa : placaController.text,

                );
                
                

                final uri = Uri.parse('${url}/ride');
                            final e = await http.post(uri, headers:  {
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(ride.toJson()),
                            
                             ).then( ( value) async {
                              
                              print(value.body.contains("insertedId"));

                              }).onError((error, stackTrace) {print('${error}   ${stackTrace}');});
                             

              },
              child: Text('Cadastrar Corrida'),
            ),
          ],
        ),
      ),
    );
  }
}
