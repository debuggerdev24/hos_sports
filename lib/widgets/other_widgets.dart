import 'package:flutter/material.dart';

class GameCardWidget extends StatelessWidget {
  final String date;
  final String teamName;
  final String caliber;
  final String format;
  final String gameDuration;

  const GameCardWidget(
      {super.key,
      required this.date,
      required this.teamName,
      required this.caliber,
      required this.format,
      required this.gameDuration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      child: Column(
        children: <Widget>[
          Text(
            date,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Team : $teamName")),
                Text(
                  "$caliber Caliber",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Format : $format")),
                Text("$gameDuration min"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
