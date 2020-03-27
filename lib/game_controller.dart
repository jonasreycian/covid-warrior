import 'dart:math';
import 'dart:ui';

import 'package:covid_warrior/components/enemy.dart';
import 'package:covid_warrior/components/health_bar.dart';
import 'package:covid_warrior/components/highscore_text.dart';
import 'package:covid_warrior/components/player.dart';
import 'package:covid_warrior/components/score_text.dart';
import 'package:covid_warrior/components/start_text.dart';
import 'package:covid_warrior/enemy_spawner.dart';
import 'package:covid_warrior/helper/constant.dart' as st;
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController extends BaseGame {
  final SharedPreferences storage;
  Size screenSize;
  double tileSize;
  Player player;
  List<Enemy> enemies;
  HealthBar healthBar;
  Random rand;
  EnemySpawner enemySpawner;
  int score;
  ScoreText scoreText;
  st.State state;
  HighScoreText highScoreText;
  StartText startText;

  GameController(this.storage) {
    initialize();
  }

  /// Initialize the components and other stuff.
  void initialize() async {
    resize(await Flame.util.initialDimensions());

    rand = Random();
    score = 0;
    state = st.State.menu;

    player = Player(this);
    enemies = List<Enemy>();
    healthBar = HealthBar(this);
    enemySpawner = EnemySpawner(this);
    scoreText = ScoreText(this);
    highScoreText = HighScoreText(this);
    startText = StartText(this);
  }

  /// Set and draw each component to the screen.
  @override
  void render(Canvas c) {
    // Draw the backgound
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgoundPaint = Paint()..color = st.Constant.BACKGROUND_COLOR;
    c.drawRect(background, backgoundPaint);

    // Draw the player
    player.render(c);

    if (state == st.State.menu) {
      startText.render(c);
      highScoreText.render(c);
    } else if (state == st.State.playing) {
      enemies.forEach((Enemy enemy) => enemy.render(c));
      healthBar.render(c);
      scoreText.render(c);
    }
  }

  /// Update each component to the screen.
  @override
  void update(double t) {
    if (state == st.State.menu) {
      startText.update(t);
      highScoreText.update(t);
    } else if (state == st.State.playing) {
      enemies.forEach((Enemy enemy) => enemy.update(t));
      enemies.removeWhere((Enemy enemy) => enemy.isDead);
      player.update(t);
      healthBar.update(t);
      enemySpawner.update(t);
      scoreText.update(t);
    }
  }

  /// Set the initial size of the screen and the tile size
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  /// Tapping gesture at the enemy components
  void onTapDown(TapDownDetails d) {
    if (state == st.State.menu) {
      state = st.State.playing;
    } else if (state == st.State.playing) {
      enemies.forEach((Enemy enemy) {
        if (enemy.enemyRect.contains(d.globalPosition)) {
          enemy.onTapDown();
        }
      });
    }
  }

  /// Spawn enemy random side
  void spawnEnemy() {
    double x, y;
    switch (rand.nextInt(4)) {
      case 0:
        // Spawn at top side
        x = rand.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
        break;
      case 1:
        // Spawn at right side
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
      case 2:
        // Spawn at bottom side
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        break;
      case 3:
        // Spawn at left side
        x = -tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
    }
    enemies.add(Enemy(this, x, y));
  }
}
