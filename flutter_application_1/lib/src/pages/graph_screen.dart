import 'package:FoodPrintUV/src/model/DataFoodPrint.dart';
import 'package:FoodPrintUV/src/pages/welcome_sreen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class GraphScreen extends StatefulWidget {
  List<DataFoodPrint> data = [];
  String titulo = "";

  GraphScreen({Key? key, required this.data, required this.titulo})
      : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late TooltipBehavior _tooltip;
  double _maxYAxisValue = 0.0;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);

    super.initState();

    // Verificar si hay datos antes de calcular el valor máximo
    if (widget.data.isNotEmpty) {
      // Encontrar el valor máximo en los datos
      double maxY = widget.data
          .map((e) => e.footP)
          .reduce((max, value) => value > max ? value : max);

      _maxYAxisValue = maxY.ceilToDouble();
    } else {
      _maxYAxisValue = 0.0; // Establecer el valor máximo en 0 si no hay datos
    }
  }

  @override
  Widget build(BuildContext context) {
    Color azulOscuro = Color(0xFF18529D);
    Color verde = Color(0xFF28AD56);

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: null,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen(0)),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: azulOscuro,
                          size: screenSize.width * 0.08,
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/planta.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text('Éstas son las',
                  style: TextStyle(
                      fontSize: 25,
                      color: azulOscuro,
                      fontWeight: FontWeight.bold)),
              Text('estadísticas por',
                  style: TextStyle(
                      fontSize: 25,
                      color: azulOscuro,
                      fontWeight: FontWeight.bold)),
              Text(widget.titulo + ':',
                  style: TextStyle(
                      fontSize: 25,
                      color: azulOscuro,
                      fontWeight: FontWeight.bold)),
              Container(
                width: screenSize.width * .6,
                height: screenSize.height * .35,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: screenSize.width * 0.6,
                        height: screenSize.height * 0.35,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(
                            labelIntersectAction: AxisLabelIntersectAction.none,
                            majorTickLines: MajorTickLines(size: 0),
                            labelStyle: TextStyle(color: Colors.transparent),
                            isVisible: false,
                          ),
                          primaryYAxis: NumericAxis(
                            isVisible: false,
                            minimum: 0,
                            maximum: _maxYAxisValue,
                            interval: _maxYAxisValue / 10,
                            labelIntersectAction: AxisLabelIntersectAction.none,
                            labelStyle: TextStyle(color: Colors.transparent),
                            majorTickLines: MajorTickLines(size: 0),
                          ),
                          tooltipBehavior: _tooltip,
                          series: <CartesianSeries<DataFoodPrint, String>>[
                            ColumnSeries<DataFoodPrint, String>(
                              dataSource: widget.data,
                              xValueMapper: (DataFoodPrint data, _) =>
                                  data.name,
                              yValueMapper: (DataFoodPrint data, _) =>
                                  data.footP,
                              name: 'Footprint',
                              color: verde,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  labelAlignment: ChartDataLabelAlignment.top,
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: screenSize.width * 0.6,
                        height: screenSize.height * 0.03,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: azulOscuro,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.6,
                decoration: BoxDecoration(
                    color: azulOscuro, borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenSize.width * 0.55,
                      height: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.titulo + " " + widget.data[0].name,
                            style: TextStyle(fontSize: 12),
                          ),
                          Container(
                            width: screenSize.width * 0.18,
                            height: screenSize.height * 0.035,
                            decoration: BoxDecoration(
                                color: verde,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                widget.data[0].footP.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.55,
                      height: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.titulo + " " + widget.data[1].name,
                            style: TextStyle(fontSize: 12),
                          ),
                          Container(
                            width: screenSize.width * 0.18,
                            height: screenSize.height * 0.035,
                            decoration: BoxDecoration(
                                color: verde,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                widget.data[1].footP.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.55,
                      height: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.titulo + " " + widget.data[2].name,
                            style: TextStyle(fontSize: 12),
                          ),
                          Container(
                            width: screenSize.width * 0.18,
                            height: screenSize.height * 0.035,
                            decoration: BoxDecoration(
                                color: verde,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                widget.data[2].footP.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
