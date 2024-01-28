import 'dart:convert';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/models/dbviagens.dart';
import 'package:flutter_application_1/models/eventos.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/registro.dart';
import 'package:http/http.dart' as http;


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String email = "";
    String senha ="";
   
   

      
    
    

    
    return MaterialApp(

        theme: ThemeData(

         
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          
           // backgroundColor: paleta.shade400, // Define a cor de fundo
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Troque o logotipo do Flutter pelo seu próprio logotipo
              Image.asset(
                'assets/go4.png',
                width: 300, // Ajuste o tamanho conforme necessário
              ),
                  Container(
  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  child: TextField(
    focusNode:FocusNode(), // Adicione um FocusNode para controlar o foco
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.green), // Borda normal
        borderRadius: BorderRadius.circular(90.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.green), // Borda quando clicado
        borderRadius: BorderRadius.circular(90.0),
      ),
      labelText: 'Email',
    ),
    onChanged: (value) {
      email = value;
    },
  ),
),

                  Container(
  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  child: TextField(
    focusNode:FocusNode(), // Adicione um FocusNode para controlar o foco
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.green), // Borda normal
        borderRadius: BorderRadius.circular(90.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.green), // Borda quando clicado
        borderRadius: BorderRadius.circular(90.0),
      ),
      labelText: 'Senha',
    ),
    onChanged: (value) {
      senha = value;
    },
  ),
),
                  Container(
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          
                          shape: RoundedRectangleBorder(
                            
                          borderRadius: BorderRadius.circular(90.0)
                         ),
                          backgroundColor: paleta,
                          minimumSize: const Size.fromHeight(50),
  
                          
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                          
                          
                          ),
                        onPressed: (                        ) async {
                          final uri = Uri.parse('${url}/user/logar?email=${email}&senha=${senha}');
                          
                            final e = await http.get(uri);
                            print(e);
                            if(e.body.isEmpty) return;
                            Usuario u = Usuario.fromUsuario();
                            u = Usuario.fromJson(jsonDecode(e.body));
                            print(u);
                          if(u.id != ""){


                            /* final ev = await http.get(Uri.parse('${url}/event'));
                         
                           //e = jsonEncode(http.get(Uri.parse('http://192.168.1.102:3000/event'))) as eventos;
                           List<eventos> Evento = [];
                          List<dynamic> lista = jsonDecode(ev.body);
                          lista.forEach((a) {Evento.add(eventos.fromJson(a));

                          });

                          final v = await http.get(Uri.parse('${url}/ride'));
                          
                            //e = jsonEncode(http.get(Uri.parse('http://192.168.1.102:3000/event'))) as eventos;
                            List<dbviagens> Viagem = [];
                            List<dynamic> listaViagem = jsonDecode(v.body);

                            listaViagem.forEach((a){ Viagem.add(dbviagens.fromJson(a));
                              

                   });
                   */

                            Navigator.of(context).push(
              
              MaterialPageRoute(builder: (context) => HomePage(user: u, events: Evento, ride: Viagem)),
            );

                          }

                          
                        },
                      )),


                  TextButton(
                    onPressed: () =>{
                      
                      print(url),

                    },
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold,),
                    ),
                  ),
                // Botão "Criar Nova Conta"
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegistroPage(),
                  ),
                );
              },
              child: Text(
                'Criar Nova Conta',
                style: TextStyle(
                  color: paleta,
                  fontWeight: FontWeight.bold, // Cor do texto do botão
                ),
              ),
            ),
          ],
        ),
      ),
        ),

         
    );

    
  }
}