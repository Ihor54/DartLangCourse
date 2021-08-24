import 'dart:io';

import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  final moveDict = {'r': Move.rock, 'p': Move.paper, 's': Move.scissors};
  final rng = Random();

  while (true) {
    stdout.write('Rock, paper, scissors? (r/p/s) ');
    final input = stdin.readLineSync();
    if (moveDict.containsKey(input)) {
      final playerMove = moveDict[input];
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];

      print('You played: $playerMove');
      print('AI played: $aiMove');

      if (playerMove == aiMove) {
        print("It's a draw");
      } else if (playerMove == Move.scissors && aiMove == Move.paper ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.rock && aiMove == Move.scissors) {
        print('You win');
      } else {
        print('You lose');
      }
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid input');
    }
  }
}
