import 'dart:ui';

import 'package:covid_warrior/game_controller.dart';

/// Define the current health progress bar of the game.
class HealthBar {
  final GameController gameController;
  Rect healthBarRect;
  Rect remainingHealthRect;

  HealthBar(this.gameController) {
    double barWidth = gameController.screenSize.width / 1.75;

    healthBarRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth,
      gameController.tileSize * 0.5,
    );

    remainingHealthRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth,
      gameController.tileSize * 0.5,
    );
  }

  /// Draw the progress bar in the canvas.
  void render(Canvas c){
    Paint healthBarColor = Paint()..color = Color(0xFFFF0000);
    Paint remainingBarColor = Paint()..color = Color(0xFF00FF00);

    c.drawRect(healthBarRect, healthBarColor);
    c.drawRect(remainingHealthRect, remainingBarColor);
  }

  /// Update the progress bar when attack.
  void update(double t){
    double barWidth = gameController.screenSize.width / 1.75;
    double percentHealth = gameController.player.currentHealth / gameController.player.maxHealth;
    remainingHealthRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth * percentHealth,
      gameController.tileSize * 0.5,
    );
  }
}
