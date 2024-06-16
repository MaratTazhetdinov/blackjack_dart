part of '../lib_part.dart';

abstract class IHand {
  final List<Card> cards;

  const IHand(this.cards);

  void addCard(Card card);

  void addCards(List<Card> cardsList);

  void clearHand();
}
