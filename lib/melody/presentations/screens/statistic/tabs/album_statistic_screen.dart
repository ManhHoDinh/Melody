import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/firebase/statistic_request.dart';
import 'package:melody/melody/presentations/screens/statistic/widgets/line_chart_widget.dart';

class AlbumStatistic extends StatefulWidget {
  const AlbumStatistic({super.key});

  @override
  State<AlbumStatistic> createState() => _AlbumStatisticState();
}

class _AlbumStatisticState extends State<AlbumStatistic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text('Top 5 most listened albums in the past 30 days',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
                future: StatisticRequest.getTop5Album(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return BarChart(
                      BarChartData(
                        barTouchData: barTouchData,
                        titlesData: titlesData,
                        borderData: borderData,
                        barGroups: barGroups(snapshot.data!),
                        gridData: const FlGridData(show: false),
                        alignment: BarChartAlignment.spaceAround,
                        maxY:
                            double.parse(snapshot.data![0]["count"].toString()),
                      ),
                    );
                  else
                    return Container();
                }),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (group) => Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

Widget getTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: Colors.purple,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  List<String> albumNames = StatisticRequest.top5AlbumName;
  switch (value.toInt()) {
    case 0:
      text = albumNames[0];
      break;
    case 1:
      text = albumNames[1];
      break;
    case 2:
      text = albumNames[2];
      break;
    case 3:
      text = albumNames[3];
      break;
    case 4:
      text = albumNames[4];
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

FlTitlesData get titlesData => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

FlBorderData get borderData => FlBorderData(
      show: false,
    );

LinearGradient get _barsGradient => LinearGradient(
      colors: [
        ColorPalette.primaryColor,
        Color.fromARGB(255, 122, 134, 222),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

List<BarChartGroupData> barGroups(List<Map<String, dynamic>> data) {
  var listBarChart = data
      .map((e) => BarChartGroupData(
            x: data.indexOf(e),
            barRods: [
              BarChartRodData(
                toY: double.parse(e["count"].toString()),
                width: 30,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: [0],
          ))
      .toList();
  return listBarChart;
}
