import 'dart:async';
import 'package:FoodPrintUV/src/pages/welcome_sreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Iniciar el temporizador para mostrar la pantalla durante 3 segundos
    Timer(Duration(seconds: 2), () {
      // Navegar a la siguiente pantalla después de 3 segundos
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen(1)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color azulOscuro = Color(0xFF18529D);
    //Color verde = Color(0xFF28AD56);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.11,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/planta.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Icon(
                  Icons.celebration,
                  size: 100,
                  color: azulOscuro,
                ),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                Text(
                  "¡Te damos la",
                  style: TextStyle(
                      fontSize: 30,
                      color: azulOscuro,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "bienvenida a",
                  style: TextStyle(
                      fontSize: 30,
                      color: azulOscuro,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "FoodprintUV!",
                  style: TextStyle(
                      fontSize: 30,
                      color: azulOscuro,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}
