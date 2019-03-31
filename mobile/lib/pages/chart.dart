/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SegmentsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SegmentsLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SegmentsLineChart.withSampleData() {
    return new SegmentsLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    // Series of data with static dash pattern and stroke width. The colorFn
    // accessor will colorize each datum (for all three series).
    // Series of data with changing color and dash pattern.
    final dashPatternChangeData = [
      new LinearSales(0, 5, [8, 3, 2, 3], 2.0),
      new LinearSales(1, 15, [8, 3, 2, 3], 2.0),
      new LinearSales(2, 25, [8, 3, 2, 3], 2.0),
      new LinearSales(3, 75, [8, 3, 2, 3], 2.0),
      new LinearSales(4, 100, [8, 3, 2, 3], 2.0),
      new LinearSales(5, 90, [8, 3, 2, 3], 2.0),
      new LinearSales(6, 75, [2, 2], 2.0),
    ]; 

    // Generate 2 shades of each color so that we can style the line segments.
    final red = charts.MaterialPalette.red.makeShades(2);
    final green = charts.MaterialPalette.green.makeShades(2);

    return [
      new charts.Series<LinearSales, int>(
        id: 'Dash Pattern Change',
        // Light shade for even years, dark shade for odd.
        colorFn: (LinearSales sales, _) =>
            sales.year <= 4 ? green[1] : red[0],
        dashPatternFn: (LinearSales sales, _) => 
            sales.year <= 4 ? null : sales.dashPattern,
        strokeWidthPxFn: (LinearSales sales, _) => sales.strokeWidthPx,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: dashPatternChangeData,
      ),
    ];
  }
}


/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final List<int> dashPattern;
  final double strokeWidthPx;

  LinearSales(this.year, this.sales, this.dashPattern, this.strokeWidthPx);
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
