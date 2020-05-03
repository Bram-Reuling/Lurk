class MainMenuScene extends Scene {

  rain[] rain;
  Item startButton;
  Item chaptersButton;
  Item optionsButton;
  Item quitButton;

  MainMenuScene() {
    super("Images/MainMenu.png", "Images/MainMenu2.png", "Audio/MainMenuSounds.mp3", true, 127);
    rain=new rain[500];
    for (int i=0; i<rain.length; i++) {
      rain[i]=new rain();
    }
    startButton = new Item(applet, 125, 400, "Images/StartButtonNotHovered.png", "Images/StartButtonHovered.png", "Start", "Audio/Nothing.mp3", false);
    chaptersButton = new Item(applet, 125, 525, "Images/ChaptersButtonNotHovered.png", "Images/ChaptersButtonHovered.png", "Start", "Audio/Nothing.mp3", false);
    optionsButton = new Item(applet, 125, 650, "Images/OptionsButtonNotHovered.png", "Images/OptionsButtonHovered.png", "Start", "Audio/Nothing.mp3", false);
    quitButton = new Item(applet, 125, 775, "Images/QuitButtonNotHovered.png", "Images/QuitButtonHovered.png", "Quit", "Audio/Nothing.mp3", false);
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    for (int i=0; i<rain.length; i++) {
      rain[i].display();
    }
    imageMode(CORNER);
    startButton.display();
    startButton.buttonOnHover(mouseX, mouseY);

    chaptersButton.display();
    chaptersButton.buttonOnHover(mouseX, mouseY);

    optionsButton.display();
    optionsButton.buttonOnHover(mouseX, mouseY);

    quitButton.display();
    quitButton.buttonOnHover(mouseX, mouseY);
  }

  void handleMousePressed() {
    startButton.switchScene(CUTSCENE_1);
    quitButton.quit();
  }
}
