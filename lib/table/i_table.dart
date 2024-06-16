part of '../lib_part.dart';

abstract class ITable {
  final List<Card> cards;

  const ITable(this.cards);

  void clearTable();
}
