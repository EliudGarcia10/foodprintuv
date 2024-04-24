import 'package:FoodPrintUV/src/model/DataFoodPrint.dart';
import 'package:FoodPrintUV/src/pages/graph_screen.dart';
import 'package:FoodPrintUV/src/pages/welcome_sreen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphLivingRoomScreen extends StatefulWidget {
  GraphLivingRoomScreen({Key? key}) : super(key: key);

  @override
  _GraphLivingRoomScreenState createState() => _GraphLivingRoomScreenState();
}

class _GraphLivingRoomScreenState extends State<GraphLivingRoomScreen> {
  List<DataFoodPrint> data = [];
  String titulo = "";

  @override
  void initState() {
    super.initState();

    data = [
      DataFoodPrint('Ingenieria', 1023),
      DataFoodPrint('Humanidades', 3548),
      DataFoodPrint('Estadística', 4358),
    ];

    titulo = "comedor";
  }

  @override
  Widget build(BuildContext context) {
    return GraphScreen(data: data, titulo: titulo);
  }
}
