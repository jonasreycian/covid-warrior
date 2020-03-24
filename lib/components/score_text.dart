import 'package:covid_warrior/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// Display the current score of the game
class ScoreText {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  ScoreText(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

  /// Draw the current score in the canvas
  void render(Canvas c) {
    painter.paint(c, position);
  }

  /// Update the score when enemy is dead
  void update(double t) {
    if ((painter.text ?? '') != gameController.score.toString()) {
      // Define the score value and design
      painter.text = TextSpan(
        text: gameController.score.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 70.0,
        ),
      );

      // Define the layout
      painter.layout();

      position = Offset(
        (gameController.screenSize.width / 2) - (painter.width / 2),
        (gameController.screenSize.height * 0.2) - (painter.width / 2),
      );
    }
  }
}
