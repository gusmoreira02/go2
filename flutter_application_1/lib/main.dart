import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_application_1/pages/globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51OB1cRLqElEuGrguhjq3vU1tVfRSvrp08U76DSYamp0tXAh7q6zcFVWpLZKcOFiTjQNd6CrDYe6kYkpHETVfU6BU00STGP2acB";
  Stripe.merchantIdentifier = "Vancrazy";
  
   await Stripe.instance.applySettings();
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Delay the navigation using Future.delayed
    
    Future.delayed(Duration(seconds: 2), () {
      
      navigateToHomePage();
    });
    
  }

  void navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          FlutterNativeSplash.remove();


    
          return Login();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        // You can add any widgets or UI components you need here
      ),
    );
  }
}
