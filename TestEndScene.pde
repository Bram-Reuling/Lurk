class TestEndScene extends Scene {

  rain[] rain;
  Item quitButton;

  TestEndScene() {
    super("Images/MainMenu.png", "Audio/Outside.mp3");
    rain=new rain[500];
    for (int i=0; i<rain.length; i++) {
      rain[i]=new rain();
    }
    quitButton = new Item(applet, width/2 - 325, 550, "Images/QuitButtonNotHovered.png", "Images/QuitButtonHovered.png", "Quit", "Audio/Nothing.mp3", false);
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    for (int i=0; i<rain.length; i++) {
      rain[i].display();
    }

    pushMatrix();
    RegularCode = createFont("Fonts/WinchesterRegular.ttf", 100);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(100);
    textFont(RegularCode);
    text("Thanks for playing this test!", width/2, height/2 - 100);
    popMatrix();

    imageMode(CORNER);
    quitButton.display();
    quitButton.buttonOnHover(mouseX, mouseY);
  }

  void handleMousePressed() {
    quitButton.quit();
  }
}
