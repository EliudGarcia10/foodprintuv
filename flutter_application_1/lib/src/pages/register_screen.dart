import "package:FoodPrintUV/src/pages/login_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Color azulOscuro = Color(0xFF18529D);
    Color verde = Color(0xFF28AD56);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController userController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    final FocusNode nameFocusNode = FocusNode();
    final FocusNode userFocusNode = FocusNode();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passFocusNode = FocusNode();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro',
      home: Scaffold(
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
                    "¡Únete a la",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: azulOscuro,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "comunidad!",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: azulOscuro,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nombre:",
                        style: TextStyle(color: azulOscuro, fontSize: 15),
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
                          controller: nameController,
                          focusNode: nameFocusNode,
                          obscureText: false,
                          decoration: const InputDecoration(
                              hintText: "Eliud Pazos",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                          onEditingComplete: () {
                            userFocusNode.requestFocus();
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
                        "Usuario:",
                        style: TextStyle(color: azulOscuro, fontSize: 15),
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
                          controller: userController,
                          focusNode: userFocusNode,
                          obscureText: false,
                          decoration: const InputDecoration(
                              hintText: "zs23000897",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                          onEditingComplete: () {
                            emailFocusNode.requestFocus();
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
                        "Correo electrónico:",
                        style: TextStyle(color: azulOscuro, fontSize: 15),
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
                        style: TextStyle(color: azulOscuro, fontSize: 15),
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
                        ), // Tu widget hijo aquí
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  Container(
                    width: screenSize.width * 0.60,
                    height: screenSize.height * 0.07,
                    decoration: BoxDecoration(
                        color: verde,
                        borderRadius: BorderRadius.circular(40.0)),
                    child: TextButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text,
                          );
                          print(
                              "ESTOS SON LOS VALORES AL CREAR UN USUARIO EN FIREBASE");
                          print(credential.user.toString());
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Registrate",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}


/*ESTO PUEDE IR DENTRO DEL MATERIAL APP
theme: ThemeData(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black), // Línea negra siempre visible
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(
                    255, 204, 0, 1)), // Línea amarilla cuando enfocado
          ),
        ),
      ),*/