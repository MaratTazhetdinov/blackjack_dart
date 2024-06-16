part of '../lib_part.dart';

class BlackjackTable extends ITable with BlackjackScoreCounter {
  int score = 0;

  BlackjackTable() : super([]);

  void addCardsToTable(List<Card> addedCards) {
    cards.addAll(addedCards);
    score = countScore(cards);
  }

  @override
  void clearTable() {
    score = 0;
    cards.clear();
  }
}
