class Team {
  String name;
  int score;
  List<String> guessedWords;

  Team({required this.name, this.score = 0, List<String>? guessedWords}) : guessedWords = guessedWords ?? [];
}
