import 'package:flutter/material.dart';
import '../models/team.dart';

class TeamScoreWidget extends StatelessWidget {
  final Team team;

  TeamScoreWidget({required this.team});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(team.name),
      trailing: Text('${team.score}', style: TextStyle(fontSize: 20)),
    );
  }
}
