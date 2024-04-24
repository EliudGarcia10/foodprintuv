import "package:FoodPrintUV/src/pages/register_screen.dart";
import "package:FoodPrintUV/src/pages/splash_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  _LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Color azulOscuro = Color(0xFF18529D);
    Color verde = Color(0xFF28AD56);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passFocusNode = FocusNode();

    return Scaffold(
        body: Container(
            height: screenSize.height,
            width: screenSize.width,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.125,
                  width: MediaQuery.of(context).size.width * 0.125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/planta.png"),
                    ),
                  ),
                ),
                Text(
                  "Inicio de sesión",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: azulOscuro,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ingresa con la información que usaste",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: azulOscuro,
                      fontWeight: FontWeight.w100),
                ),
                Text(
                  "durante el registro",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: azulOscuro,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Correo electrónico:",
                      style: TextStyle(color: azulOscuro, fontSize: 17),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    Container(
                      width: screenSize.width * .70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            40), // Modifica el radio para cambiar la forma de los bordes
                        border: Border.all(
                          color: azulOscuro, // Cambia el color del borde
                          width: 1, // Cambia el grosor del borde
                        ),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        obscureText: false,
                        decoration: const InputDecoration(
                            hintText: "zs23000897@estudiantes.uv.mx",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                        onEditingComplete: () {
                          passFocusNode.requestFocus();
                        },
                      ), // Tu widget hijo aquí
                    )
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contraseña:",
                      style: TextStyle(color: azulOscuro, fontSize: 17),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    Container(
                      width: screenSize.width * .70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            40), // Modifica el radio para cambiar la forma de los bordes
                        border: Border.all(
                          color: azulOscuro, // Cambia el color del borde
                          width: 1, // Cambia el grosor del borde
                        ),
                      ),
                      child: TextFormField(
                        controller: passController,
                        focusNode: passFocusNode,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "************",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                        onEditingComplete: () {},
                      ), // Tu widget hijo aquí
                    )
                  ],
                ),
                Container(
                  width: screenSize.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Aquí puedes agregar la acción que desees realizar
                          print('Texto presionado');
                        },
                        child: Text(
                          "¿Olvidó su contraseña?",
                          style: TextStyle(
                            color: azulOscuro,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Container(
                  width: screenSize.width * 0.60,
                  height: screenSize.height * 0.07,
                  decoration: BoxDecoration(
                      color: verde, borderRadius: BorderRadius.circular(40.0)),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passController.text);

                        if (credential.user!.email == emailController.text) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SplashScreen())));
                        }
                      } on FirebaseAuthException catch (e) {
                        final snackBar = SnackBar(
                          content: Text('Usuario o contraseña no validos'),
                          duration:
                              Duration(seconds: 2), // Duración del Snackbar
                          action: SnackBarAction(
                            label: 'Close', // Etiqueta del botón
                            onPressed: () {
                              // Acción a realizar cuando se presiona el botón
                              // Por ejemplo, cerrar el Snackbar
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: Text(
                      "Iniciar sesión",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => RegisterScreen())));
                  },
                  child: Text(
                    "¿No tienes cuenta? Registrate.",
                    style: TextStyle(
                      color: azulOscuro,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ))));
  }
}
