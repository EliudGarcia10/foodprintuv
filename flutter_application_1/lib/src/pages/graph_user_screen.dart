import 'package:FoodPrintUV/src/model/DataFoodPrint.dart';
import 'package:FoodPrintUV/src/pages/graph_screen.dart';
import 'package:FoodPrintUV/src/pages/welcome_sreen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphUserScreen extends StatefulWidget {
  GraphUserScreen({Key? key}) : super(key: key);

  @override
  _GraphUserScreenState createState() => _GraphUserScreenState();
}

class _GraphUserScreenState extends State<GraphUserScreen> {
  List<DataFoodPrint> data = [];
  String titulo = "";

  @override
  void initState() {
    super.initState();

    data = [
      DataFoodPrint('LirieNeuf', 435),
      DataFoodPrint('SoriTod', 1559),
      DataFoodPrint('Shazam8', 284),
    ];

    titulo = "usuario";
  }

  @override
  Widget build(BuildContext context) {
    return GraphScreen(data: data, titulo: titulo);
  }
}
