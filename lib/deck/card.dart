part of '../lib_part.dart';

enum Suit {
  clubs('♠'),
  diamonds('♦'),
  hearts('♥'),
  spades('♣');

  final String icon;

  const Suit(this.icon);
}

enum CardValue {
  two('Two'),
  three('Three'),
  four('Four'),
  five('Five'),
  six('Six'),
  seven('Seven'),
  eight('Eight'),
  nine('Nine'),
  ten('Ten'),
  jack('Jack'),
  queen('Queen'),
  king('King'),
  ace('Ace');

  final String title;

  const CardValue(this.title);
}

class Card {
  final CardValue value;
  final Suit suit;

  const Card({required this.value, required this.suit});

  @override
  String toString() {
    return '${value.title}${suit.icon}';
  }
}
