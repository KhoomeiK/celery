import "chart.dart";
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Detail_graph {
  String type;
  List<TimeSeriesSales> data;

  List<charts.Series<TimeSeriesSales, DateTime>> create() {
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: this.type,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: this.data,
      )
    ];
  }

  Detail_graph(
      this.type, this.data);
}
