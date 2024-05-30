import 'package:get/get.dart';
import '../models/team.dart';
import '../storage/fake_storage.dart';
import 'dart:async';

class GameController extends GetxController {
  var teams = <Team>[].obs;
  var currentTeamIndex = 0.obs;
  var words = <String>[].obs;
  var currentWord = ''.obs;
  var wordsToGuess = 10.obs;
  var roundTime = 60.obs;
  var remainingTime = 60.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    loadWords();
  }

  void addTeam(String name) {
    teams.add(Team(name: name));
  }

  void removeTeam(int index) {
    teams.removeAt(index);
  }

  void startRound() {
    remainingTime.value = roundTime.value;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
        nextTeam();
      }
    });
    nextWord();
  }

  void nextWord() {
    if (words.isNotEmpty) {
      currentWord.value = words.removeLast();
    } else {
      loadWords();
      currentWord.value = words.removeLast();
    }
  }

  void guessCorrect() {
    teams[currentTeamIndex.value].score++;
    nextWord();
  }

  void guessWrong() {
    nextWord();
  }

  void nextTeam() {
    currentTeamIndex.value = (currentTeamIndex.value + 1) % teams.length;
    startRound();
  }

  void loadWords() {
    words.addAll(FakeStorage.getWords());
  }

  void setWordsToGuess(int count) {
    wordsToGuess.value = count;
  }

  void setRoundTime(int time) {
    roundTime.value = time;
  }
}
