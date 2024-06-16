part of '../lib_part.dart';

class BlackjackPlayer extends IPlayer with BlackjackScoreCounter {
  int score = 0;

  BlackjackPlayer({required String name})
      : super(name: name, hand: BlackjackHand.empty());

  Future<void> makeMove(IDeck deck) async {
    print('Would you like to take one more card? Y/N');
    final result = stdin.readLineSync() ?? '';
    if (result == 'Y') {
      final card = deck.getCard();
      addCardToHand(card);
      print('$name is getting card...');
      await Future.delayed(
        Duration(seconds: 2),
        () => print('You get ${card.toString()}. Your current score is $score'),
      );
    }
  }

  void addCardToHand(Card cd) {
    hand.addCard(cd);
    score = countScore(hand.cards);
  }

  void addCardsToHand(List<Card> list) {
    hand.addCards(list);
    score = countScore(hand.cards);
  }

  void clearHand() {
    score = 0;
    hand.clearHand();
  }
}
