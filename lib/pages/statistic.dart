import 'package:flutter/material.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  String gamesPlayed = "0";
  String winRate = "0";
  String winStreak = "0";
  String maxWinStreak = "0";

  @override
  void initState() {
    _loadStatistics();
    super.initState();
  }

  Future<void> _loadStatistics() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> games = prefs.getStringList('games') ?? [];

    int gamesPlayed = games.length;
    int wins = 0;
    int winStreak = 0;
    int maxWinStreak = 0;

    for (int i = 0; i < games.length; i++) {
      final game = games[i].split(",");
      final hasGuessed = game[2] == "true";

      if (hasGuessed) {
        wins++;
        winStreak++;
      } else {
        winStreak = 0;
      }

      if (winStreak > maxWinStreak) {
        maxWinStreak = winStreak;
      }
    }

    double winRate = (wins / gamesPlayed) * 100;

    setState(() {
      this.gamesPlayed = gamesPlayed.toString();
      this.winRate = winRate.toStringAsFixed(2);
      this.winStreak = winStreak.toString();
      this.maxWinStreak = maxWinStreak.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpordleScaffold(
        pageTitleText: "Statistics",
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: StatisticWidget(
                    value: gamesPlayed,
                    description: "Games played",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: StatisticWidget(
                    value: winRate,
                    description: "% win rate",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: StatisticWidget(
                    value: winStreak,
                    description: "Win streak",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: StatisticWidget(
                    value: maxWinStreak,
                    description: "Max win streak",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreakWidget(),
              ],
            )
          ],
        ));
  }
}

class StatisticWidget extends StatelessWidget {
  final String value;
  final String description;

  const StatisticWidget({
    Key? key,
    required this.value,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Container(
          child: Text(
            description,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class StreakWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 500,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: const Text(
          "Streak",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.circular(15),
            ),
            child: GameHistory(
              music: "Alison",
              tries: "2/7",
              score: "700",
            ),
          ),
        ],
      ),
    );
  }
}

class GameHistory extends StatelessWidget {
  final String music;
  final String tries;
  final String score;

  const GameHistory({
    Key? key,
    required this.music,
    required this.tries,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 500,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            music,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            tries,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            score,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
