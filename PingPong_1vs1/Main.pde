// Erstellen von Objekten für die beiden Schläger, das Spiel und den Ball
Paddle PaddleLeft = new Paddle();   // linker Schläger
Paddle PaddleRight = new Paddle();  // rechter Schläger
Game game = new Game();             // Spielobjekt, das den Spielzustand verwaltet
Ball ball0 = new Ball();            // Ballobjekt

void setup() {
  size(800, 600);             // Setzt die Größe des Spielfensters auf 800x600 Pixel
  PaddleLeft.x = 50;          // Positioniert den linken Schläger auf der x-Achse
  PaddleLeft.y = 260;         // Positioniert den linken Schläger auf der y-Achse
  PaddleRight.x = 730;        // Positioniert den rechten Schläger auf der x-Achse
  PaddleRight.y = 260;        // Positioniert den rechten Schläger auf der y-Achse
}

void draw() {
  background(0);              // Löscht das Fenster und setzt den Hintergrund auf schwarz
  
  if (game.start) {           // Überprüft, ob das Spiel gestartet wurde
    textSize(20);
    // Zeigt den Punktestand beider Spieler an
    text("Punktestand: Spieler Links: " + game.PointsLeft + " Spieler Rechts " + game.PointsRight, 220, 20);

    // Zeichnet beide Schläger und den Ball
    PaddleRight.drawPaddle();
    PaddleLeft.drawPaddle();
    ball0.drawBall();
    ball0.moveBall();         // Bewegt den Ball basierend auf seiner aktuellen Richtung und Geschwindigkeit
    
    checkCollision();         // Überprüft auf Kollisionen zwischen Ball und Schlägern
    checkPoints();            // Überprüft, ob ein Punkt erzielt wurde
    game.Winner();            // Überprüft, ob ein Spieler gewonnen hat
  } else {
    textSize(30);
    text(game.state, 100, 200); // Zeigt den aktuellen Status des Spiels (z. B. "Spiel gestartet") an
  }
}

void mousePressed() {
  game.startGame();           // Startet das Spiel, wenn die Maus gedrückt wird
  ball0.startBall();          // Setzt den Ball in Bewegung
}

void keyPressed() {
  // Steuerung des linken Schlägers, wenn der Ball nach links bewegt wird
  if (ball0.speedX <= 0) {
    if (key == 'S' || key == 's') {
      PaddleLeft.moveDown();  // Bewegt den linken Schläger nach unten
    }
    if (key == 'W' || key == 'w') {
      PaddleLeft.moveUp();    // Bewegt den linken Schläger nach oben
    }
  } else {
    // Steuerung des rechten Schlägers, wenn der Ball nach rechts bewegt wird
    if (key == 'O' || key == 'o') {
      PaddleRight.moveUp();   // Bewegt den rechten Schläger nach oben
    }
    if (key == 'L' || key == 'l') {
      PaddleRight.moveDown(); // Bewegt den rechten Schläger nach unten
    }
  }
}

void checkPoints() {
  // Überprüft, ob der Ball die linke Wand berührt und gibt einen Punkt an den rechten Spieler
  if (ball0.x <= 0) {
    game.AddPointL();         // Punkt für den rechten Spieler hinzufügen
    ball0.reset();            // Ball in die Startposition zurücksetzen
  }
  // Überprüft, ob der Ball die rechte Wand berührt und gibt einen Punkt an den linken Spieler
  if (ball0.x >= 800) {
    game.AddPointR();         // Punkt für den linken Spieler hinzufügen
    ball0.reset();            // Ball in die Startposition zurücksetzen
  }
}

void checkCollision() {
  // Überprüft Kollision des Balls mit dem linken Schläger
  if (ball0.x >= 50 && ball0.x <= 70 && ball0.y >= PaddleLeft.y && ball0.y <= (PaddleLeft.y + 80)) {
    ball0.changeDirPlayer();  // Richtung des Balls ändern
  }
  
  // Überprüft Kollision des Balls mit dem rechten Schläger
  if (ball0.x >= 730 && ball0.x <= 750 && ball0.y >= PaddleRight.y && ball0.y <= (PaddleRight.y + 80)) {
    ball0.changeDirPlayer();  // Richtung des Balls ändern
  }
}
