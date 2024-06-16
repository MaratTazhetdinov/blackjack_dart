part of '../lib_part.dart';

class Blackjack extends IGame {
  final BlackjackPlayer player;
  final BlackjackDealer dealer;
  final IDeck deck;
  final BlackjackTable table;

  Blackjack({
    super.title = 'Blackjack',
    required this.player,
    required this.dealer,
    required this.deck,
    required this.table,
  });

  factory Blackjack.createGame() {
    final deck = ClassicDeck.create();
    final table = BlackjackTable();
    print('Starting Blackjack game');
    print('------------------------');
    print('Enter your name: ');
    final playerName = stdin.readLineSync() ?? 'Player';

    final player = BlackjackPlayer(name: playerName);
    final dealer = BlackjackDealer();
    return Blackjack(player: player, dealer: dealer, deck: deck, table: table);
  }

  Future<void> playGame() async {
    _prepareTable();
    print('------------------------');
    String tableText = 'Current table score is ${table.score}. Cards on table:';
    for (final card in table.cards) {
      tableText += ' ${card.toString()}';
    }
    print(tableText);

    while (player.score < 21) {
      final prevScore = player.score;

      await player.makeMove(deck);

      if (prevScore == player.score) {
        break;
      }
    }

    if (player.score > 21) {
      print('You have lost');
    }

    if (table.score != 21) {
      while (dealer.score <= player.score && player.score <= 21) {
        await dealer.makeMove(deck);
      }
    } else {
      print('Dealer did not make a move. His final score is 21');
    }

    if (player.score <= 21) {
      if (player.score == dealer.score) {
        print('Draw');
      } else if (dealer.score <= 21 && player.score < dealer.score) {
        print('${dealer.name} has won.');
      } else {
        print('${player.name} has won.');
      }
    }

    print('Do you want to start a new game? Y/N');

    final response = stdin.readLineSync() ?? 'N';

    if (response == 'Y') {
      _clear();
      playGame();
    } else {
      print('Game has been ended');
    }
  }

  void _prepareTable() {
    table.addCardsToTable(deck.getCards(2));
    player.addCardsToHand(table.cards);
    dealer.addCardsToHand(table.cards);
  }

  void _clear() {
    player.clearHand();
    dealer.clearHand();
    table.clearTable();
    deck.refillDeck();
  }
}
