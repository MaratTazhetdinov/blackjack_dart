part of '../lib_part.dart';

abstract class IDeck {
  final List<Card> cards;

  const IDeck(this.cards);

  Card getCard();

  List<Card> getCards(int amount);

  void refillDeck();
}
