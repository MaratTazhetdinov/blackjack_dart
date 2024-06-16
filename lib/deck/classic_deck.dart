part of '../lib_part.dart';

class ClassicDeck extends IDeck {
  final List<Card> removedCards = [];

  ClassicDeck(super.cards);

  factory ClassicDeck.create() {
    final List<Card> cards = [];

    for (int i = 0; i < 13; i++) {
      for (final suit in Suit.values) {
        switch (i) {
          case 0:
            cards.add(Card(value: CardValue.two, suit: suit));
          case 1:
            cards.add(Card(value: CardValue.three, suit: suit));
          case 2:
            cards.add(Card(value: CardValue.four, suit: suit));
          case 3:
            cards.add(Card(value: CardValue.five, suit: suit));
          case 4:
            cards.add(Card(value: CardValue.six, suit: suit));
          case 5:
            cards.add(Card(value: CardValue.seven, suit: suit));
          case 6:
            cards.add(Card(value: CardValue.eight, suit: suit));
          case 7:
            cards.add(Card(value: CardValue.nine, suit: suit));
          case 8:
            cards.add(Card(value: CardValue.ten, suit: suit));
          case 9:
            cards.add(Card(value: CardValue.jack, suit: suit));
          case 10:
            cards.add(Card(value: CardValue.queen, suit: suit));
          case 11:
            cards.add(Card(value: CardValue.king, suit: suit));
          case 12:
            cards.add(Card(value: CardValue.ace, suit: suit));
          default:
            continue;
        }
      }
    }

    return ClassicDeck(cards);
  }

  @override
  Card getCard() {
    final index = Random().nextInt(cards.length);
    final card = cards.removeAt(index);
    removedCards.add(card);
    return card;
  }

  @override
  List<Card> getCards(int amount) {
    final List<Card> resultList = [];
    while (amount != 0) {
      final card = getCard();
      resultList.add(card);
      amount--;
    }
    return resultList;
  }

  @override
  void refillDeck() {
    cards.addAll(removedCards);
    removedCards.clear();
  }
}
