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
 if (!sceneStart.isPlaying()) {
 }
 }
 }
 */

//SECOND FLOOR
class HallwayFloor2 extends Scene {

  Item backArrow;
  Item tenantsRoom;
  Item leftDoor;
  Item rightDoor;

  HallwayFloor2() {
    super("Images/HallwaySecondFloor.png", "Images/HallwaySecondFloor1.png", "Audio/Hallway1.mp3");
    backArrow = new Item(applet, 939, 925, 152, 109, "Back", "Audio/Nothing.mp3");
    tenantsRoom = new Item(applet, 634, 279, 106, 654, "Enter Room", "Audio/fuckineedanotherdamkey.wav");
    leftDoor = new Item(applet, -6, -8, 461, 1074, "Enter Room", "Audio/Nothing.mp3");
    rightDoor = new Item(applet, 1454, 6, 500, 1167, "Enter Room", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();
    backArrow.display();
    backArrow.onHover(mouseX, mouseY);

    tenantsRoom.display();
    tenantsRoom.onHover(mouseX, mouseY);

    leftDoor.display();
    leftDoor.onHover(mouseX, mouseY);

    rightDoor.display();
    rightDoor.onHover(mouseX, mouseY);

    if (keyPressed && key == ' ') {
      showHotspot = true;
    } else {
      showHotspot = false;
    }
  }

  void handleMousePressed() {
    if (!pickedUpKeys2) {
      if (mouseX >= tenantsRoom.x && mouseX <= tenantsRoom.x + tenantsRoom.itemWidth && mouseY >= tenantsRoom.y && mouseY <= tenantsRoom.y + tenantsRoom.itemHeight) {
        tenantsRoom.playSound();
        clickedOnDoor = true;
      }
    } else {
      tenantsRoom.switchScene(DOOR_TENANTS_ROOM);
    }
    backArrow.switchScene(ELEVATOR_SCENE);
  }
}

//DISPLAY THIS SCENE IF KEY ISNT PICKED UP
class HallwayFromElevator extends Scene {

  Item backButton;
  Item officeDoor;
  Item entranceDoor;
  Item bulletinBoard;
  Item mailBoxRoom;

  HallwayFromElevator() {
    super("Images/HallwayElevatorView.png", "Audio/Hallway1.mp3");
    backButton = new Item(applet, 886, 919, 152, 109, "Back", "Audio/Nothing.mp3");
    officeDoor = new Item(applet, 1231, 300, 106, 654, "Office", "Audio/Nothing.mp3");
    entranceDoor = new Item(applet, 890, 427, 147, 254, "Exit Building", "Audio/Nothing.mp3");
    bulletinBoard = new Item(applet, 1119, 389, 92, 266, "Bulletin Board", "Audio/Nothing.mp3");
    mailBoxRoom = new Item(applet, 713, 373, 100, 429, "Mailbox Room", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    backButton.display();
    backButton.onHover(mouseX, mouseY);

    officeDoor.display();
    officeDoor.onHover(mouseX, mouseY);

    entranceDoor.display();
    entranceDoor.onHover(mouseX, mouseY);

    bulletinBoard.display();
    bulletinBoard.onHover(mouseX, mouseY);

    mailBoxRoom.display();
    mailBoxRoom.onHover(mouseX, mouseY);

    if (keyPressed && key == ' ') {
      showHotspot = true;
    } else {
      showHotspot = false;
    }
  }

  void handleMousePressed() {
    backButton.switchScene(FRONT_OF_ELEVATOR_SCENE_OPEN);
    officeDoor.switchScene(OFFICE_SCENE);
  }
}

//OFFICE SCENE
class OfficeScene extends Scene {

  Minim minim;
  AudioPlayer sceneStart;


  Item backButton;
  Item desk;
  Item safe;
  Item trashcan;
  Item keysHolder;
  Item namesOnTheWall;
  Item keyRoom;

  OfficeScene() {
    super("Images/Office.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/shitimess.wav");
    backButton = new Item(applet, 856, 872, 252, 156, "Back", "Audio/Nothing.mp3");
    desk = new Item(applet, 526, 456, 834, 340, "Desk", "Audio/Nothing.mp3");
    safe = new Item(applet, 1577, 665, 259, 275, "Safe", "Audio/Nothing.mp3");
    trashcan = new Item(applet, 339, 554, 147, 208, "Trashcan", "Audio/idontthinkanyofthsesethinggonnahelpme.wav");
    keysHolder = new Item(applet, 1261, 206, 214, 109, "Key Holder", "Audio/whatacoinicence.wav");
    namesOnTheWall = new Item(applet, 90, 246, 192, 282, "Investigate", "Audio/maybethesearetryingtotellmesomething.wav");
    keyRoom = new Item(applet, 1577, 665, "Images/Key.png", "Investigate", "Audio/maybethesearetryingtotellmesomething.wav");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    backButton.display();
    backButton.onHover(mouseX, mouseY);

    desk.display();
    desk.onHover(mouseX, mouseY);

    trashcan.display();
    trashcan.onHover(mouseX, mouseY);

    keysHolder.display();
    keysHolder.onHover(mouseX, mouseY);

    namesOnTheWall.display();
    namesOnTheWall.onHover(mouseX, mouseY);

    if (!safeOpen) {
      safe.display();
      safe.onHover(mouseX, mouseY);
    } else {
      if (!pickedUpKeys2) {
        keyRoom.display();
        keyRoom.onHover(mouseX, mouseY);
      }
    }

    if (voiceLineOffice == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineOffice = true;
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
      backButton.switchScene(HALLWAY_FROM_ELEVATOR);
      if (!safeOpen) {
        safe.switchScene(CODE_INPUT_SCENE_SAFE);
      } else {
        if (mouseX >= keyRoom.x && mouseX <= keyRoom.x + keyRoom.itemWidth && mouseY >= keyRoom.y && mouseY <= keyRoom.y + keyRoom.itemHeight) {
          pickedUpKeys2=true;
        }
      }
      desk.switchScene(OFFICE_DESK);
      trashcan.playSound();
      namesOnTheWall.playSound();
      keysHolder.playSound();
    }
  }
}

//OFFICE DESK SCENE
class OfficeDesk extends Scene {

  Item backButton;
  Item newsPaper;
  Item drawer;
  Item penHolder;
  Item phone;
  Item randomPapers;
  Item randomPapers1;
  Item randomPapers2;

  OfficeDesk() {
    super("Images/OfficeDesk.png", "Audio/Hallway1.mp3");
    backButton = new Item(applet, 964, -1, 141, 113, "Back", "Audio/Nothing.mp3");
    newsPaper = new Item(applet, 1113, 431, 299, 362, "News Paper", "Audio/Nothing.mp3");
    drawer = new Item(applet, 1141, 805, 622, 103, "Drawer", "Audio/drawersemptyimnotsurprised.wav");
    penHolder = new Item(applet, 274, 304, 166, 237, "Pen Holder", "Audio/Nothing.mp3");
    phone = new Item(applet, 1079, 144, 344, 241, "Phone", "Audio/Nothing.mp3");
    randomPapers = new Item(applet, 432, 80, 249, 145, "Investigate", "Audio/Nothing.mp3");
    randomPapers1 = new Item(applet, 479, 250, 559, 480, "Investigate", "Audio/Nothing.mp3");
    randomPapers2 = new Item(applet, 1505, 372, 219, 285, "Investigate", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    backButton.display();
    backButton.onHover(mouseX, mouseY);

    newsPaper.display();
    newsPaper.onHover(mouseX, mouseY);

    drawer.display();
    drawer.onHover(mouseX, mouseY);

    penHolder.display();
    penHolder.onHover(mouseX, mouseY);

    phone.display();
    phone.onHover(mouseX, mouseY);

    randomPapers.display();
    randomPapers.onHover(mouseX, mouseY);

    randomPapers1.display();
    randomPapers1.onHover(mouseX, mouseY);

    randomPapers2.display();
    randomPapers2.onHover(mouseX, mouseY);

    if (keyPressed && key == ' ') {
      showHotspot = true;
    } else {
      showHotspot = false;
    }
  }

  void handleMousePressed() {
    backButton.switchScene(OFFICE_SCENE);
    newsPaper.switchScene(OFFICE_NEWSPAPER);
    drawer.playSound();
  }
}

//Newspaper scene of desk
class DeskNewspaper extends Scene {

  Item backButton;
  Item backButton2;
  Item JCM;
  Item KIIS;
  Item Kimtron;
  Item DoNutCross;
  Item EscapeTheFun;
  Item WinterBurnout;
  Item PetalBash;

  DeskNewspaper() {
    super("Images/OfficeNewspaper.png", "Audio/Hallway1.mp3");
    backButton = new Item(applet, 0, 0, 567, 1170, "Back", "Audio/Nothing.mp3");
    backButton2 = new Item(applet, 1351, 0, 567, 1170, "Back", "Audio/Nothing.mp3");
    JCM = new Item(applet, 620, 531, 117, 49, "Investigate", "Audio/Nothing.mp3");
    KIIS = new Item(applet, 622, 378, 100, 57, "Investigate", "Audio/Nothing.mp3");
    Kimtron = new Item(applet, 617, 731, 166, 44, "Investigate", "Audio/Nothing.mp3");
    DoNutCross = new Item(applet, 899, 258, 214, 293, "Investigate", "Audio/Nothing.mp3");
    EscapeTheFun = new Item(applet, 1128, 258, 216, 294, "Investigate", "Audio/Nothing.mp3");
    WinterBurnout = new Item(applet, 967, 556, 317, 225, "Investigate", "Audio/Nothing.mp3");
    PetalBash = new Item(applet, 933, 783, 390, 350, "Investigate", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    backButton.display();
    backButton.onHover(mouseX, mouseY);

    backButton2.display();
    backButton2.onHover(mouseX, mouseY);

    JCM.display();
    JCM.onHover(mouseX, mouseY);

    KIIS.display();
    KIIS.onHover(mouseX, mouseY);

    Kimtron.display();
    Kimtron.onHover(mouseX, mouseY);

    DoNutCross.display();
    DoNutCross.onHover(mouseX, mouseY);

    EscapeTheFun.display();
    EscapeTheFun.onHover(mouseX, mouseY);

    WinterBurnout.display();
    WinterBurnout.onHover(mouseX, mouseY);

    PetalBash.display();
    PetalBash.onHover(mouseX, mouseY);
    if (keyPressed && key == ' ') {
      showHotspot = true;
    } else {
      showHotspot = false;
    }
  }

  void handleMousePressed() {
    backButton.switchScene(OFFICE_DESK);
    backButton2.switchScene(OFFICE_DESK);
  }
}

//CODE INPUT SCENE FOR SAFE
class CodeInputSceneSafe extends Scene {
  Minim minim;
  AudioPlayer sceneStart;
  AudioPlayer goodCode;
  AudioPlayer badCode;



  Item backArrow;

  CodeInputSceneSafe() {
    super("Images/BGCutscene1.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/anothercombinationlock.wav");
    goodCode = minim.loadFile("Audio/thatwasntsohard.wav");
    badCode = minim.loadFile("Audio/thatsnotrightletstryagain.wav");
    backArrow = new Item(applet, 38, 508, "Images/arrowLeft.png", "Back", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    backArrow.display();
    backArrow.onHover(mouseX, mouseY);

    pushMatrix();
    RegularCode = createFont("Fonts/WinchesterRegular.ttf", 100);
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(RegularCode);
    text("CODE:\n" + codeSafe + "\nPRESS ENTER TO SUBMIT", width/2, height/2);
    popMatrix();
    if (voiceLineSafe == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineSafe = true;
        }
      }
    } else {
      //return;
    }

    if (safeOpen) {
      stateHandler.changeStateTo( OFFICE_SCENE );
      if (voiceGood == false) {
        goodCode.play();
        voiceGood = true;
      }
    }
  }

  public void handleMousePressed() {
    backArrow.switchScene(OFFICE_SCENE);
  }

  public void handleKeyPressed() {
    if (key==CODED) {
      if (keyCode==LEFT) {
        println ("left");
      } // if
      else {
        // message
        println ("unknown special key");
      } // else
    } // if
    else
    {
      if (key==BACKSPACE) {
        if (codeSafe.length()>0) {
          codeSafe=codeSafe.substring(0, codeSafe.length()-1);
        } // if
      } // if
      else if (key==RETURN || key==ENTER) {
        println ("ENTER");
        if (codeSafe.equals("389157624")) {
          println("Hurra!");
          safeOpen=true;
          codeSafe="";
        } // if
        else {
          badCode.rewind();
          badCode.play();
          safeOpen=false;
        }
      } // else if
      else {
        codeSafe+=key;
      } // else
      // output
      println (codeSafe);
    } // else
  }
}

//DISPLAY THIS SCENE IF KEY IS PICKED UP
class OutsideTenantsRoom extends Scene {

  Minim minim;
  AudioPlayer sceneStart;

  Item door;

  OutsideTenantsRoom() {
    super("Images/DoorScene.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/sight.wav");
    door = new Item(applet, 441, -8, 1110, 1292, "Investigate", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    door.display();
    door.onHover(mouseX, mouseY);

    if (voiceLineTenantDoor == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineTenantDoor = true;
        }
      }
    } else {
      //return;
    }
  }

  void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      //door.switchScene();
    }
  }
}

//DISPLAY THIS SCENE IF KEY ISNT PICKED UP
class TenantsRoom extends Scene {

  Minim minim;
  AudioPlayer sceneStart;

  Item knife;
  Item otherHand;
  Item pulse;

  TenantsRoom() {
    super("Images/DeadBodyScene.png", "Images/DeadBodyScene1.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/sightafuck.wav");

    knife = new Item(applet, 435, 722, 218, 279, "Check Knife", "Audio/murderweaponrighthand.wav");
    otherHand = new Item(applet, 1195, 734, 166, 163, "Check Hand", "Audio/lefthanded.wav");
    pulse = new Item(applet, 933, 483, 129, 88, "Check Pulse", "Audio/theresnopulse.wav");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    knife.display();
    knife.onHover(mouseX, mouseY);

    otherHand.display();
    otherHand.onHover(mouseX, mouseY);

    pulse.display();
    pulse.onHover(mouseX, mouseY);

    if (voiceLineTenant == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineTenant = true;
        }
      }
    } else {
      //return;
    }
    if (knifeChecked == true && handChecked == true && pulseChecked == true) {
      stateHandler.changeStateTo( END_SCENE );
      m = millis();
    }
  }

  void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      if (mouseX >= knife.x && mouseX <= knife.x + knife.itemWidth && mouseY >= knife.y && mouseY <= knife.y + knife.itemHeight) {
        knife.playSound();
        knifeChecked = true;
      }
      if (mouseX >= otherHand.x && mouseX <= otherHand.x + otherHand.itemWidth && mouseY >= otherHand.y && mouseY <= otherHand.y + otherHand.itemHeight) {
        otherHand.playSound();
        handChecked = true;
      }
      if (mouseX >= pulse.x && mouseX <= pulse.x + pulse.itemWidth && mouseY >= pulse.y && mouseY <= pulse.y + pulse.itemHeight) {
        pulse.playSound();
        pulseChecked = true;
      }
    }
  }
}

//DISPLAY THIS SCENE IF KEY ISNT PICKED UP
class EndScene extends Scene {

  Minim minim;
  AudioPlayer sceneStart;

  EndScene() {
    super("Images/BGCutscene1.png", "Audio/Nothing.mp3", true, 127);
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/hesdeadpart.wav");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

      if (millis() - m > 3000 && millis() - m < 3000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
        }
      }

  }

  void handleMousePressed() {
    //if (!sceneStart.isPlaying()) {
    //}
  }
}
