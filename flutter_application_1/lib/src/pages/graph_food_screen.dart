import 'package:FoodPrintUV/src/model/DataFoodPrint.dart';
import 'package:FoodPrintUV/src/pages/graph_screen.dart';
import 'package:FoodPrintUV/src/pages/welcome_sreen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphFoodScreen extends StatefulWidget {
  GraphFoodScreen({Key? key}) : super(key: key);

  @override
  _GraphFoodScreenState createState() => _GraphFoodScreenState();
}

class _GraphFoodScreenState extends State<GraphFoodScreen> {
  List<DataFoodPrint> data = [];
  String titulo = "";

  @override
  void initState() {
    super.initState();

    data = [
      DataFoodPrint('Manzana', 2489),
      DataFoodPrint('Sándwich', 1025),
      DataFoodPrint('Estofado', 764),
    ];

    titulo = "comida";
  }

  @override
  Widget build(BuildContext context) {
    return GraphScreen(data: data, titulo: titulo);
  }
}
