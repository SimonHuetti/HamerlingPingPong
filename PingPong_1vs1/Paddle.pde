class Paddle {

  // Position des Schlägers auf der x- und y-Achse
  float x = 0;              // x-Koordinate des Schlägers
  float y = 0;              // y-Koordinate des Schlägers
  
  // Dimensionen des Schlägers
  float widthP = 20;        // Breite des Schlägers
  float heightP = 80;       // Höhe des Schlägers
  
  color c;                  // Farbe des Schlägers (kann optional gesetzt werden)

  // Bewegt den Schläger nach oben
  void moveUp() {
    if (y >= 0) {           // Verhindert, dass der Schläger über den oberen Rand hinausgeht
      y = y - 40;           // Verschiebt den Schläger um 40 Pixel nach oben
    }
  }

  // Bewegt den Schläger nach unten
  void moveDown() {
    if (y <= height - heightP) { // Verhindert, dass der Schläger über den unteren Rand hinausgeht
      y = y + 40;               // Verschiebt den Schläger um 40 Pixel nach unten
    }
  }
  
  // Zeichnet den Schläger an seiner aktuellen Position
  void drawPaddle() {
    rect(x, y, widthP, heightP);  // Zeichnet ein Rechteck basierend auf den Schläger-Dimensionen
  }
}
