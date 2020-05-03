/* TEMPLATE
 //DISPLAY THIS SCENE IF KEY ISNT PICKED UP
 class FrontOfElevatorSceneClose extends Scene {
 
 FrontOfElevatorSceneClose() {
 super("Images/MainMenu.png", "Audio/Hallway1.mp3");
 }
 
 public void doStepWhileInState() {
 super.doStepWhileInState();
 
 }
 
 void handleMousePressed() {
 
 }
 }
 */

//DISPLAY THIS SCENE IF KEY ISNT PICKED UP
class FrontOfElevatorSceneClose extends Scene {

  Minim minim;
  AudioPlayer sceneStart;

  Item elevator;
  Item backButton;

  FrontOfElevatorSceneClose() {
    super("Images/ElevatorClosed.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/ineedsomekeystoopenthisbadboy.wav");
    elevator = new Item(applet, 953, 139, 370, 782, "Closed Elevator", "Audio/ineedsomekeystoopenthisbadboy.wav");
    backButton = new Item(applet, 854, 909, 248, 190, "Back", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    elevator.display();
    elevator.onHover(mouseX, mouseY);

    backButton.display();
    backButton.onHover(mouseX, mouseY);

    if (voiceElevator == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceElevator = true;
        }
      }
    } else {
      //return;
    }

    if (keyPressed && key == ' ') {
      showHotspot = true;
    } else {
      showHotspot = false;
    }
  }

  void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      elevator.playSound();
      backButton.switchScene(HALLWAY_SCENE);
    }
  }
}

//DISPLAY THIS SCENE IF KEY IS PICKED UP
class FrontOfElevatorSceneOpen extends Scene {

  Item elevator;
  Item backButton;

  FrontOfElevatorSceneOpen() {
    super("Images/ElevatorOpen.png", "Audio/Hallway1.mp3");
    elevator = new Item(applet, 953, 139, 370, 782, "Enter", "Audio/ineedsomekeystoopenthisbadboy.wav");
    backButton = new Item(applet, 854, 909, 248, 190, "Back", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();
    elevator.display();
    elevator.onHover(mouseX, mouseY);

    backButton.display();
    backButton.onHover(mouseX, mouseY);

    if (keyPressed && key == ' ') {
      showHotspot = true;
    } else {
      showHotspot = false;
    }
  }

  void handleMousePressed() {
    elevator.switchScene(ELEVATOR_SCENE);
    if (!clickedOnDoor) {
      backButton.switchScene(HALLWAY_SCENE);
    } else {
      backButton.switchScene(HALLWAY_FROM_ELEVATOR);
    }
  }
}

//INSIDE ELEVATOR SCENE
class ElevatorScene extends Scene {

  Item groundFloorButton;
  Item firstFloorButton;
  Item secondFloorButton;
  Item thirdFloorButton;

  ElevatorScene() {
    super("Images/ElevatorScene.png", "Audio/Hallway1.mp3");
    groundFloorButton = new Item(applet, 738, 589, 33, 33, "Ground Floor", "Audio/Nothing.mp3");
    firstFloorButton = new Item(applet, 736, 537, 33, 33, "1st Floor", "Audio/Nothing.mp3");
    secondFloorButton = new Item(applet, 739, 481, 33, 33, "2nd Floor", "Audio/Nothing.mp3");
    thirdFloorButton = new Item(applet, 736, 425, 33, 33, "3rd Floor", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();
    groundFloorButton.display();
    groundFloorButton.onHover(mouseX, mouseY);

    firstFloorButton.display();
    firstFloorButton.onHover(mouseX, mouseY);

    secondFloorButton.display();
    secondFloorButton.onHover(mouseX, mouseY);

    thirdFloorButton.display();
    thirdFloorButton.onHover(mouseX, mouseY);

    if (keyPressed && key == ' ') {
      showHotspot = true;
    } else {
      showHotspot = false;
    }
  }

  void handleMousePressed() {
    groundFloorButton.switchScene(FRONT_OF_ELEVATOR_SCENE_OPEN);
    secondFloorButton.switchScene(HALLWAY_FLOOR2_SCENE);
  }
}
