import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({required this.icon, required this.title, required this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.account_circle_outlined, size: 40.0),
    title: 'Perfil',
    subtitle: '',
  ),
  Option(
    icon: Icon(Icons.car_rental, size: 40.0),
    title: 'Quero oferecer carona',
    subtitle: '',
  ),
  Option(
    icon: Icon(Icons.description_outlined, size: 40.0),
    title: 'Termos de uso',
    subtitle: 'Entenda nossas diretrizes e compromissos',
  ),
  Option( 
    icon: Icon(Icons.help, size: 40.0),
    title: 'Suporte',
    subtitle: 'Entre em contato conosco',
  ),
  Option( // esse nao funciona ???
    icon: Icon(Icons.help, size: 40.0),
    title: 'Politicas de privacidade',
    subtitle: 'Entre em contato conosco',
  ),
  Option(
    icon: Icon(Icons.security, size: 40.0),
    title: 'Politicas de privacidade',
    subtitle: '',
  ),

];
