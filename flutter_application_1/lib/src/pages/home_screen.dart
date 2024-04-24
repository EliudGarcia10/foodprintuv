import 'package:FoodPrintUV/src/pages/graph_livingroom_screen.dart';
import 'package:FoodPrintUV/src/pages/graph_user_screen.dart';
import 'package:FoodPrintUV/src/pages/login_screen.dart';
import 'package:FoodPrintUV/src/pages/register_screen.dart';
import 'package:FoodPrintUV/src/pages/welcome_sreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool vv1 = false;

  @override
  void initState() {
    super.initState();

    // Si ya existe una cuenta de usuario activo entonces mandar a otra screen
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(Duration(milliseconds: 2000), () {
          setState(() {
            vv1 = true;
          });
        });
      } else {
        print('User is signed in!');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen(1)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Size screenSize = MediaQuery.of(context).size;
    Color azulOscuro = Color(0xFF18529D);
    Color verde = Color(0xFF28AD56);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: screenSize.height * .35,
              child: Container(
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.125,
                      width: MediaQuery.of(context).size.width * 0.125,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/planta.png"),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: vv1,
                      child: Text(
                        "FoodPrintUV",
                        style: TextStyle(
                            color: azulOscuro,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Visibility(
                        visible: vv1,
                        child: SizedBox(
                          height: screenSize.width * 0.14,
                        )),
                    Visibility(
                        visible: vv1,
                        child: Container(
                          width: screenSize.width * 0.6,
                          height: screenSize.height * 0.07,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(_StatisticRoute());
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.auto_graph_sharp,
                                    color: Colors.white),
                                SizedBox(
                                  width: screenSize.width * 0.05,
                                ),
                                Text(
                                  "Ver estadísticas",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(azulOscuro),
                            ),
                          ),
                        )),
                    Visibility(
                        visible: vv1,
                        child: SizedBox(
                          height: screenSize.height * 0.15,
                        )),
                    Visibility(
                        visible: vv1,
                        child: Container(
                          width: screenSize.width * 0.6,
                          height: screenSize.height * 0.07,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: screenSize.width * 0.24,
                                child: Container(
                                  width: screenSize.width * 0.36,
                                  height: screenSize.height * 0.075,
                                  decoration: BoxDecoration(
                                    color: azulOscuro,
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: screenSize.width * 0.06,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Iniciar",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Sesión",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: screenSize.width * 0.375,
                                  height: screenSize.height * 0.07,
                                  decoration: BoxDecoration(
                                      color: verde,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()),
                                      );
                                    },
                                    child: Text(
                                      "Registrarme",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

Route _StatisticRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SelectionStatistic(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.1);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class SelectionStatistic extends StatelessWidget {
  const SelectionStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    Color azulOscuro = Color(0xFF18529D);
    Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: azulOscuro),
        home: Scaffold(
            body: Container(
                width: screenSize.width,
                height: screenSize.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.1,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 30,
                              left: 30,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back),
                                  iconSize: 40,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.2,
                    ),
                    Text(
                      '¡Conoce las',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'estadísticas de la',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'huella en la UV!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.1,
                    ),
                    Container(
                      width: screenSize.width * 0.60,
                      height: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: TextButton(
                          onPressed: () {
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GraphLivingRoomScreen()));*/
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.table_restaurant,
                                color: azulOscuro,
                              ),
                              SizedBox(
                                width: screenSize.width * .02,
                              ),
                              Text(
                                "Por comedor",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Container(
                      width: screenSize.width * 0.60,
                      height: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: TextButton(
                          onPressed: () {
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GraphUserScreen()));*/
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.business,
                                color: azulOscuro,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              Text(
                                "Por comunidad UV",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ],
                ))));
  }
}

/*
Positioned(
                                top: 0,
                                left: screenSize.width * 0.24,
                                child: Container(
                                  width: screenSize.width * 0.36,
                                  height: screenSize.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: azulOscuro,
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: screenSize.width * 0.375,
                                  height: screenSize.height * 0.07,
                                  decoration: BoxDecoration(
                                      color: verde,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                ),
                              ),
*/