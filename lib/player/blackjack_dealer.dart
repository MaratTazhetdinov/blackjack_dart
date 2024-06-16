part of '../lib_part.dart';

class BlackjackDealer extends BlackjackPlayer {
  BlackjackDealer() : super(name: 'Dealer');

  @override
  Future<void> makeMove(IDeck deck) async {
    final card = deck.getCard();
    addCardToHand(card);
    print('$name is getting card...');
    await Future.delayed(
      Duration(seconds: 2),
      () => print('$name got ${card.toString()}. His score is $score.'),
    );
  }
}
