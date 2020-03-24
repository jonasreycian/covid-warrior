import 'dart:ui';

import 'package:covid_warrior/helper/constant.dart';

import '../game_controller.dart';

class Enemy {
  final GameController gameController;
  int health;
  int damage;
  double speed;
  Rect enemyRect;
  bool isDead = false;

  /**
   * x and y are the coordinates to spawn the enemy
   */
  Enemy(this.gameController, double x, double y) {
    health = 3;
    damage = 1;

    speed = gameController.tileSize * 2;
    enemyRect = Rect.fromLTWH(
      x,
      y,
      gameController.tileSize * 1.2,
      gameController.tileSize * 1.2,
    );
  }

  void render(Canvas c) {
    Color color;
    switch (health) {
      case 1:
        color = Constant.ENEMY_BACKGROUD_COLOR_1;
        break;
      case 2:
        color = Constant.ENEMY_BACKGROUD_COLOR_2;
        break;
      case 3:
        color = Constant.ENEMY_BACKGROUD_COLOR_3;
        break;
      default:
        color = Constant.ENEMY_BACKGROUD_COLOR_D;
        break;
    }
    Paint enemyColor = Paint()..color = color;
    c.drawRect(enemyRect, enemyColor);
  }

  void update(double t) {
    if (isDead == false) {
      double stepDistance = speed * t;
      Offset toPlayer = gameController.player.playerRect.center - enemyRect.center;

      // Mover closer to player direction
      if (stepDistance <= toPlayer.distance - gameController.tileSize * 1.25) {
        Offset stepToPlayer =
            Offset.fromDirection(toPlayer.direction, stepDistance);
        enemyRect = enemyRect.shift(stepToPlayer);
      }
    }
  }

  void onTapDown() {
    if (isDead == false) {
      health--;
      if (health <= 0) {
        isDead = true;
        // score
      }
    }
  }
}
