import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/presentations/screens/statistic/tabs/album_statistic_screen.dart';
import 'package:melody/melody/presentations/screens/statistic/tabs/song_statistic_screen.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});
  static String routeName = 'statistic_screen';
  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('S T A T I S T I C'),
            centerTitle: true,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4,
              padding: EdgeInsets.symmetric(horizontal: 80),
              tabs: [
                Tab(icon: Text('Album')),
                Tab(icon: Text('Song')),
              ],
            ),
          ),
          body: TabBarView(
            children: [AlbumStatistic(), SongStatistic()],
          ),
        ));
  }
}
