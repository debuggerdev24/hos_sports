import 'package:flutter/material.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_ladder/higest_rating.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_ladder/most_played.dart';
import 'package:hos_sports/widgets/constants.dart';

class GoalieLadderScreen extends StatefulWidget {
  const GoalieLadderScreen({super.key});

  @override
  State<GoalieLadderScreen> createState() => _GoalieLadderScreenState();
}

class _GoalieLadderScreenState extends State<GoalieLadderScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: AppColor.primary,
            indicatorColor: AppColor.primary,
            tabs: [
              Tab(
                text: "Highest Rating",
              ),
              Tab(
                text: "Most Played Games",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(children: [HighestRating(), MostPlayed()]),
          )
        ],
      ),
    );
  }
}
