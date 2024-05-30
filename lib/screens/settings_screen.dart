import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';

class SettingsScreen extends StatelessWidget {
  final GameController gameController = Get.find();
  final TextEditingController wordsToGuessController = TextEditingController();
  final TextEditingController roundTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    wordsToGuessController.text = gameController.wordsToGuess.value.toString();
    roundTimeController.text = gameController.roundTime.value.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: wordsToGuessController,
              decoration: InputDecoration(
                labelText: 'Количество слов для победы',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: roundTimeController,
              decoration: InputDecoration(
                labelText: 'Время раунда (сек)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int wordsToGuess = int.parse(wordsToGuessController.text);
                int roundTime = int.parse(roundTimeController.text);
                gameController.setWordsToGuess(wordsToGuess);
                gameController.setRoundTime(roundTime);
                Get.back();
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
