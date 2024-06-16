part of '../lib_part.dart';

mixin BlackjackScoreCounter {
  int countScore(List<Card> cards) {
    int acesCount = 0;

    int score = 0;

    for (final card in cards) {
      if (card.value == CardValue.ace) {
        acesCount++;
      }
      score += switch (card.value) {
        CardValue.two => 2,
        CardValue.three => 3,
        CardValue.four => 4,
        CardValue.five => 5,
        CardValue.six => 6,
        CardValue.seven => 7,
        CardValue.eight => 8,
        CardValue.nine => 9,
        CardValue.ten ||
        CardValue.jack ||
        CardValue.queen ||
        CardValue.king =>
          10,
        CardValue.ace => 0,
      };
    }

    if (acesCount > 0) {
      if (score + acesCount > 21) {
        score += acesCount;
      } else {
        while (acesCount > 0) {
          if (score + 11 > 21) {
            score++;
          } else {
            score += 11;
          }
          acesCount--;
        }
      }
    }

    return score;
  }
}
