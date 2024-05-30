import 'package:eliass/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController teamNameController = TextEditingController();
  final GameController gameController = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alias Game', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 82, 17, 94),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: teamNameController,
              decoration: InputDecoration(
                labelText: 'Название команды',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                gameController.addTeam(teamNameController.text);
                teamNameController.clear();
              },
              child: Text('Добавить команду'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SettingsScreen());
              },
              child: Text('Настройки'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
             onPressed: () {
                if (gameController.teams.isNotEmpty) {
                  gameController.startRound();
                  Get.to(GameScreen());
                }
              },
              child: Text('Начать игру'),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: gameController.teams.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => gameController.removeTeam(index),
                        child: ListTile(
                          title: Text(gameController.teams[index].name),
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
