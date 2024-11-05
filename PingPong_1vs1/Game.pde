class Game {
  int PointsLeft = 0;      // Punktestand des linken Spielers
  int PointsRight = 0;     // Punktestand des rechten Spielers
  boolean start = false;   // Gibt an, ob das Spiel gestartet ist
  
  // Anfangszustand des Spiels, zeigt eine Nachricht mit Anweisungen an
  String state = "Drücke mit der Maus ins Feld um ein Spiel zu starten\n Der linke Spieler steuert mit W und S \n der rechte Spieler startet mit O und L";

  // Erhöht den Punktestand des linken Spielers um 1
  void AddPointL() {
    PointsLeft++;
  }
  
  // Erhöht den Punktestand des rechten Spielers um 1
  void AddPointR() {
    PointsRight++;
  }
  
  // Überprüft, ob ein Spieler das Spiel gewonnen hat
  void Winner() {
    // Überprüfung, ob der linke Spieler 5 Punkte erreicht hat
    if (PointsLeft >= 5) {
      // Setzt den Zustandstext für den Gewinn des linken Spielers
      state = "Der Linke Spieler hat gewonnen\n Klicke wieder mit der Maus, \n um ein neues Spiel zu starten";
      PointsLeft = 0;       // Punktestand wird zurückgesetzt
      PointsRight = 0;
      start = false;        // Spiel wird beendet
    } 
    // Überprüfung, ob der rechte Spieler 5 Punkte erreicht hat
    else if (PointsRight >= 5) {
      // Setzt den Zustandstext für den Gewinn des rechten Spielers
      state = "Der Rechte Spieler hat gewonnen\n Klicke wieder mit der Maus, \n um ein neues Spiel zu starten";
      PointsLeft = 0;       // Punktestand wird zurückgesetzt
      PointsRight = 0;
      start = false;        // Spiel wird beendet
    }
  }
  
  // Startet das Spiel, wenn die Maus gedrückt wird
  void startGame() {
    start = true;
  }
}
