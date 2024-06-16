import 'package:blackjack_dart/lib_part.dart';

Future<void> main() async {
  final blackjack = Blackjack.createGame();
  await blackjack.playGame();
}
