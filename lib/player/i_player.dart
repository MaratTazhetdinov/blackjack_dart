part of '../lib_part.dart';

abstract class IPlayer {
  final String name;
  final IHand hand;

  const IPlayer({required this.name, required this.hand});
}
