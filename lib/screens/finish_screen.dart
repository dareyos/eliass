import 'package:eliass/models/team.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';

class FinishScreen extends StatelessWidget {
  final GameController gameController = Get.find();

  @override
  Widget build(BuildContext context) {
    Team? winner = gameController.teams.reduce((current, next) {
      return (current.score > next.score) ? current : next;
    });
    if (winner.guessedWords.length < gameController.wordsToGuess.value) {
      winner = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Результат', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 82, 17, 94),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Результат',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            (winner != null)
                ? Text(
                    'Победила команда "${winner.name}" с ${winner.score} угаданными словами!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 66, 18, 70)),
                  )
                : Text(
                    'Ничья',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 66, 18, 70)),
                  ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: gameController.teams.length,
                    itemBuilder: (context, index) {
                      final team = gameController.teams[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                team.name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Угаданных слов: ${team.score}'),
                              SizedBox(height: 8),
                              Text('Список:'),
                              SizedBox(height: 8),
                              for (String word in team.guessedWords)
                                Text(
                                  word,
                                  style: TextStyle(fontSize: 16),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
