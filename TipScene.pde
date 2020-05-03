class TipScene extends Scene {
  
  TipScene() {
    super("Images/TipScene.png", "Audio/Nothing.mp3", true, 127);
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();
    if (millis() - m > 10000) {
      stateHandler.changeStateTo( ENTRANCE_SCENE );
      m = millis();
    }
  }
}
