import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/firebase/statistic_request.dart';
import 'package:melody/melody/presentations/screens/statistic/widgets/line_chart_widget.dart';

class SongStatistic extends StatefulWidget {
  const SongStatistic({super.key});

  @override
  State<SongStatistic> createState() => _SongStatisticState();
}

class _SongStatisticState extends State<SongStatistic> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Color(0xff95C7D7),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Plays',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text('Last 30 days',
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<int>(
                      stream: StatisticRequest.getCountSongs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600));
                        }
                        return Container();
                      })
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff95C7D7), width: 2),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Downloads', style: TextStyle(fontSize: 18)),
                      Text('Last 30 days', style: TextStyle(fontSize: 16))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<int>(
                      stream: StatisticRequest.getCountSongs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600));
                        }
                        return Container();
                      })
                ],
              ),
            ),
            LineChartWidget()
          ],
        ),
      ),
    );
  }
}
