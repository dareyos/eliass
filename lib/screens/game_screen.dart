import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import '../widgets/team_score_widget.dart';

class GameScreen extends StatelessWidget {
  final GameController gameController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alias Game', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 82, 17, 94),
      ),
      body: Obx(
        () => Column(
          children: [
            Text(
              'Осталось ${gameController.remainingTime} сек',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Слово: ${gameController.currentWord}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Команда: ${gameController.teams[gameController.currentTeamIndex.value].name}',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: gameController.guessCorrect,
                  child: Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: gameController.guessWrong,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: gameController.nextTeam,
              child: Text('Следующая команда'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: gameController.teams.length,
                itemBuilder: (context, index) {
                  return TeamScoreWidget(team: gameController.teams[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

