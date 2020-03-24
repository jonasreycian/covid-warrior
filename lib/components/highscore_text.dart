import 'package:covid_warrior/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// Records the highest obtained score of the user 
class HighScoreText {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  HighScoreText(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

  /// Draw the text in the canvas
  void render(Canvas c) {
    painter.paint(c, position);
  }

  /// Update the score
  void update(double t) {
    int highscore = gameController.storage.getInt('highscore') ?? 0;

    painter.text = TextSpan(
      text: 'Highscore: $highscore',
      style: TextStyle(
        color: Colors.black,
        fontSize: 40.0,
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
