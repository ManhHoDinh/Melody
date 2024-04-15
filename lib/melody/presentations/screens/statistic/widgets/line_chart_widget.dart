import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/models/firebase/statistic_request.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [ColorPalette.primaryColor, Colors.white];
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: StreamBuilder<List<double>>(
                stream: StatisticRequest.getPlayStatistic(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return LineChart(
                      mainData(snapshot.data!),
                    );
                  }
                  return Container();
                }),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xffcccccc),
      fontSize: 14,
    );
    DateTime now = DateTime.now();
    String month;
    Widget text;
    DateTime time;

    switch (value.toInt()) {
      case 0:
        time = now.subtract(Duration(days: 30));
        month = DateFormat("MMM").format(time);
        text = Text("${month} ${time.day}", style: style);
        break;
      case 6:
        time = now.subtract(Duration(days: 21));
        month = DateFormat("MMM").format(time);

        text = Text("${month} ${time.day}", style: style);
        break;
      case 13:
        time = now.subtract(Duration(days: 14));
        month = DateFormat("MMM").format(time);

        text = Text("${month} ${time.day}", style: style);

        break;
      case 20:
        time = now.subtract(Duration(days: 7));
        month = DateFormat("MMM").format(time);

        text = Text("${month} ${time.day}", style: style);
        break;
      case 29:
        time = now.subtract(Duration(days: 1));
        month = DateFormat("MMM").format(time);

        text = Text("${month} ${time.day}", style: style);
        break;

      default:
        text = Container();
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData(List<double> data) {
    double maxValue = 0;
    data.forEach((element) {
      if (element >= maxValue) {
        maxValue = element;
      }
    });

    int count = 0;
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xffcccccc),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
              left: BorderSide(width: 1, color: Color(0xffcccccc)),
              right: BorderSide(width: 1, color: Color(0xffcccccc)))),
      minX: 0,
      maxX: 29,
      minY: 0,
      maxY: maxValue,
      lineBarsData: [
        LineChartBarData(
          spots: data.map((item) {
            count++;
            return FlSpot(count.toDouble(), item);
          }).toList(),
          isCurved: true,
          color: ColorPalette.primaryColor,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.5))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  int daysInMonth(int year, int month) {
    DateTime firstDayOfMonth = DateTime.utc(year, month, 1);

    DateTime lastDayOfMonth = DateTime.utc(year, month + 1, 0);

    return lastDayOfMonth.day;
  }
}
