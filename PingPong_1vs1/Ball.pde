class Ball {
  // Anfangsposition des Balls
  float x = 390;        // x-Koordinate des Balls (nahe der Mitte des Fensters)
  float y = 290;        // y-Koordinate des Balls (nahe der Mitte des Fensters)
  
  // Geschwindigkeit des Balls in x- und y-Richtung, zufällig zwischen -3 und 3 gesetzt
  float speedX = random(-3, 3);
  float speedY = random(-3, 3);
  
  int diameter = 20;    // Durchmesser des Balls
  
  // Ändert die Richtung und Geschwindigkeit des Balls bei Kollision mit einem Schläger
  void changeDirPlayer() {
    if (speedX < 0) {
      speedX = -speedX + 0.2;  // Ball prallt ab und beschleunigt leicht in die andere Richtung
    } else {
      speedX = -speedX - 0.2;
    }
    
    if (speedY < 0) {
      speedY = speedY + 0.2;   // Leichte Erhöhung der Geschwindigkeit
    } else {
      speedY = speedY - 0.2;
    }      
  }
  
  // Setzt den Ball in Bewegung mit einer Mindestgeschwindigkeit in x- und y-Richtung
  void startBall() {
    while (speedX < 1 && speedX >= -1) {  // Stellt sicher, dass speedX nicht zu langsam ist
      speedX = random(-3, 3);
    }
    while (speedY < 1 && speedY >= -1) {  // Stellt sicher, dass speedY nicht zu langsam ist
      speedY = random(-3, 3);
    }  
  }  
  
  // Ändert die Richtung und Geschwindigkeit des Balls bei Kollision mit der oberen oder unteren Wand
  void changeDirWall() {
    if (speedY < 0) {
      speedY = -(speedY - 0.2);  // Richtungswechsel in y-Richtung mit leichter Geschwindigkeitsänderung
    } else {
      speedY = -(speedY + 0.2);
    }
    
    if (speedX < 0) {
      speedX = speedX - 0.2;     // Beschleunigung in x-Richtung
    } else {
      speedX = speedX + 0.2;
    }     
  }
  
  // Aktualisiert die Position des Balls basierend auf seiner Geschwindigkeit
  void moveBall() {
    x = x + speedX;  // Verschiebt den Ball horizontal
    y = y + speedY;  // Verschiebt den Ball vertikal
    
    // Überprüft, ob der Ball die untere Wand erreicht und prallt ab
    if (y > 580) {
      y = 580;        // Setzt die Position auf die Wandkoordinate
      changeDirWall(); // Ändert die Richtung
    }
    // Überprüft, ob der Ball die obere Wand erreicht und prallt ab
    if (y < 20) {
      y = 20;         // Setzt die Position auf die Wandkoordinate
      changeDirWall(); // Ändert die Richtung
    }  
  }
  
  // Zeichnet den Ball als Kreis an seiner aktuellen Position
  void drawBall() {
    circle(x, y, diameter);  // Zeichnet den Ball
  }
  
  // Setzt den Ball in die Startposition zurück und startet seine Bewegung
  void reset() {
    x = 390;            // Position x wird auf die Mitte zurückgesetzt
    y = 290;            // Position y wird auf die Mitte zurückgesetzt
    speedX = 0;         // Geschwindigkeit wird zurückgesetzt
    speedY = 0;
    startBall();        // Startet den Ball mit neuer Geschwindigkeit
  }  
}
