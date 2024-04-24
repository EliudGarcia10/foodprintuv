import 'package:FoodPrintUV/src/pages/graph_food_screen.dart';
import 'package:FoodPrintUV/src/pages/graph_livingroom_screen.dart';
import 'package:FoodPrintUV/src/pages/graph_screen.dart';
import 'package:FoodPrintUV/src/pages/graph_user_screen.dart';
import 'package:FoodPrintUV/src/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  // Declara una variable para almacenar el parámetro
  final int index_screen;

  // Constructor que recibe el parámetro
  WelcomeScreen(this.index_screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNavigatorBar(this.index_screen),
    );
  }
}

class MyNavigatorBar extends StatefulWidget {
  final int index_screen;

  MyNavigatorBar(this.index_screen);

  @override
  _MyNavigatorBar createState() => _MyNavigatorBar(this.index_screen);
}

class _MyNavigatorBar extends State<MyNavigatorBar> {
  int _selectedIndex = 0; // Cambiado a 0 para tener un valor por defecto

  final int index_screen;

  _MyNavigatorBar(this.index_screen);

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        index_screen; // Establece _selectedIndex con el valor inicial
  }

  final List<Widget> _screens = [
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_sharp),
            label: 'Estadísticas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color azulOscuro = Color(0xFF18529D);
    Color verde = Color(0xFF28AD56);

    return Container(
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
            height: screenSize.height * 0.02,
          ),
          Text(
            "¡Conoce las",
            style: TextStyle(
                fontSize: 30, color: azulOscuro, fontWeight: FontWeight.bold),
          ),
          Text(
            "estadísticas de la",
            style: TextStyle(
                fontSize: 30, color: azulOscuro, fontWeight: FontWeight.bold),
          ),
          Text(
            "huella en la UV!",
            style: TextStyle(
                fontSize: 30, color: azulOscuro, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenSize.height * 0.12,
          ),
          Container(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.08,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: azulOscuro, width: 2.0)),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GraphFoodScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Icon(
                      Icons.emoji_food_beverage,
                      color: azulOscuro,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Text(
                      "Alimentos",
                      style: TextStyle(fontSize: 18, color: azulOscuro),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Container(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.08,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: azulOscuro, width: 2.0)),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GraphLivingRoomScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Icon(
                      Icons.table_restaurant,
                      color: azulOscuro,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Text(
                      "Comedores",
                      style: TextStyle(fontSize: 18, color: azulOscuro),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Container(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.08,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: azulOscuro, width: 2.0)),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GraphUserScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Icon(
                      Icons.business,
                      color: azulOscuro,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Text(
                      "Comunidad UV",
                      style: TextStyle(fontSize: 18, color: azulOscuro),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color azulOscuro = Color(0xFF18529D);
    Color verde = Color(0xFF28AD56);

    return Container(
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
          Text(
            "Selecciona tu",
            style: TextStyle(
                fontSize: 30, color: azulOscuro, fontWeight: FontWeight.bold),
          ),
          Text(
            "comedor",
            style: TextStyle(
                fontSize: 30, color: azulOscuro, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenSize.height * 0.07,
          ),
          Container(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: azulOscuro, width: 2.0)),
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/comedor_ingenieria.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Text(
                      "Comedor Ingeniería",
                      style: TextStyle(fontSize: 15, color: azulOscuro),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Container(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: azulOscuro, width: 2.0)),
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/comedor_humanidades.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Text(
                      "Comedor Humanidades",
                      style: TextStyle(fontSize: 15, color: azulOscuro),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Container(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: azulOscuro, width: 2.0)),
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/comedor_estadistica.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Text(
                      "Comedor Estadística",
                      style: TextStyle(fontSize: 15, color: azulOscuro),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {"number": 530, "user_name": "LirieNeuf", "footprint": 27332},
    {"number": 531, "user_name": "SariTod", "footprint": 28340},
    {"number": 532, "user_name": "Shazam8", "footprint": 29493},
    {"number": 533, "user_name": "faertab", "footprint": 30124},
    {"number": 534, "user_name": "tuba", "footprint": 31847},
    {"number": 535, "user_name": "gahelu", "footprint": 32261},
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Color azulOscuro = Color(0xFF18529D);
    Color verde = Color(0xFF28AD56);

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenSize.width * 0.1,
                ),
                SizedBox(
                  width: screenSize.width * 0.1,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightElevation: 0,
                  elevation: 0,
                  onPressed: () {
                    // Mostrar ventana emergente en la esquina superior izquierda
                    final RenderBox button =
                        context.findRenderObject() as RenderBox;
                    final RenderBox overlay = Overlay.of(context)
                        .context
                        .findRenderObject() as RenderBox;
                    final Offset offset =
                        Offset(button.size.width, -button.size.height);
                    final Offset transformedOffset =
                        button.localToGlobal(offset, ancestor: overlay);
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                          transformedOffset.dx, transformedOffset.dy, 0, 0),
                      items: [
                        PopupMenuItem(
                          child: Text(
                            'Editar',
                            style: TextStyle(color: azulOscuro),
                          ),
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Cerrar sesión',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                        ),
                      ],
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        // Cambiar la forma del borde
                        borderRadius: BorderRadius.circular(
                            20.0), // Cambiar el radio de la esquina
                        side: BorderSide(color: azulOscuro, width: 2.0),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.menu,
                    color: azulOscuro,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/planta2.png"),
                    ),
                  ),
                ),
                Container(
                  height: screenSize.height * 0.15,
                  width: screenSize.width * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/profile_image.png"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Text(
              "Sara Toledo",
              style: TextStyle(
                  color: azulOscuro, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "SariTod",
              style: TextStyle(color: azulOscuro, fontSize: 20),
            ),
            Text(
              "SaraT@correo.com",
              style: TextStyle(color: azulOscuro, fontSize: 15),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Container(
              height: screenSize.height * 0.47,
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                  color: azulOscuro, borderRadius: BorderRadius.circular(30.0)),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.65,
                    height: screenSize.height * 0.11,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Huella ecológica',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          Container(
                            width: screenSize.width * 0.30,
                            height: screenSize.height * 0.03,
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            decoration: BoxDecoration(
                                color: verde,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Text(
                              '28343',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  Text(
                    "Ranking semanal",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Container(
                    width: screenSize.width * 0.65,
                    height: screenSize.height * 0.26,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: azulOscuro,
                              child: Text(
                                data[index]['number'].toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(data[index]['user_name']),
                            subtitle: Row(children: [
                              Text('Footprint: '),
                              Container(
                                width: screenSize.width * 0.20,
                                height: screenSize.height * 0.03,
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                decoration: BoxDecoration(
                                    color: verde,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text(
                                  data[index]['footprint'].toString(),
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ]),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
