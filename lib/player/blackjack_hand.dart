part of '../lib_part.dart';

class BlackjackHand extends IHand {
  BlackjackHand(super.cards);

  BlackjackHand.empty() : super([]);

  @override
  void addCard(Card card) => cards.add(card);

  @override
  void addCards(List<Card> cardsList) => cards.addAll(cardsList);

  @override
  void clearHand() => cards.clear();
}
