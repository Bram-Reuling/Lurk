//ENTRANCE SCENE
class EntranceScene extends Scene {

  Minim minim;
  AudioPlayer sceneStart;

  Item houseNumber;
  Item door;
  Item streetName;

  rain[] rain;

  EntranceScene() {
    super("Images/Outside.png", "Audio/Outside.mp3");
    rain=new rain[500];
    for (int i=0; i<rain.length; i++) {
      rain[i]=new rain();
    }
    //sceneStart = new SoundFile(applet, "Audio/shititfeelshardtocomebackhere.wav");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/shititfeelshardtocomebackhere.wav");
    houseNumber = new Item(applet, 1176, 207, 96, 105, "Building Number", "Audio/69Gigles.mp3");
    door = new Item(applet, 787, 177, 289, 488, "Enter Building", "Audio/Nothing.mp3");
    //Item(float tempX, float tempY, int tempWidth, int tempHeight, String tempItemName)
    streetName = new Item(applet, 198, 692, 188, 123, "Street Name", "Audio/woosterstreetbringbackbadmemoriesaboutbilly.wav");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    for (int i=0; i<rain.length; i++) {
      rain[i].display();
    }
    houseNumber.display();
    houseNumber.onHover(mouseX, mouseY);

    door.display();
    door.onHover(mouseX, mouseY);

    streetName.display();
    streetName.onHover(mouseX, mouseY);
    if (voiceLineEntrance == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineEntrance = true;
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

  public void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      houseNumber.playSound();
      streetName.playSound();
      door.switchScene(HALLWAY_SCENE);
    }
  }
}

//HALLWAY SCENE
class HallwayScene extends Scene {
  Minim minim;
  AudioPlayer sceneStart;

  Item elevator;
  Item mailboxRoom;
  Item bulletinBoard;
  Item backArrow;

  HallwayScene() {
    super("Images/Hallway.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/smellofmold.wav");
    elevator = new Item(applet, 850, 429, 234, 275, "Elevator", "Audio/Nothing.mp3");
    mailboxRoom = new Item(applet, 1437, -1, 348, 1247, "Mailbox", "Audio/Nothing.mp3");
    bulletinBoard = new Item(applet, 42, 201, 481, 700, "Bulletin Board", "Audio/Nothing.mp3");
    backArrow = new Item(applet, 901, 894, 133, 115, "Back", "Audio/Nothing.mp3");
    //backArrow = new Item(applet, 910, 880, "Images/arrowDown.png", "Back", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    elevator.display();
    elevator.onHover(mouseX, mouseY);

    mailboxRoom.display();
    mailboxRoom.onHover(mouseX, mouseY);

    bulletinBoard.display();
    bulletinBoard.onHover(mouseX, mouseY);

    backArrow.display();
    backArrow.onHover(mouseX, mouseY);

    if (voiceLineHallway == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineHallway = true;
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

  public void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      mailboxRoom.switchScene(MAILBOX_SCENE);
      bulletinBoard.switchScene(BULLETIN_SCENE);
      backArrow.switchScene(ENTRANCE_SCENE);
      if (!pickedUpKeys) {
        elevator.switchScene(FRONT_OF_ELEVATOR_SCENE_CLOSE);
      } else {
        elevator.switchScene(FRONT_OF_ELEVATOR_SCENE_OPEN);
      }
    }
  }
}

//BULLETIN SCENE
class BulletinScene extends Scene {
  Minim minim;
  AudioPlayer sceneStart;

  Item poster;
  Item newsPaper;
  Item backArrow;

  BulletinScene() {
    super("Images/Bulletin.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/maybethisigonnagivemesomenifo.wav");
    poster = new Item(applet, 827, 124, 804, 803, "Poster", "Audio/posters.wav");
    newsPaper = new Item(applet, 415, 112, 360, 501, "News Paper", "Audio/Nothing.mp3");
    backArrow = new Item(applet, 48, 449, 166, 168, "Back", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    poster.display();
    poster.onHover(mouseX, mouseY);

    newsPaper.display();
    newsPaper.onHover(mouseX, mouseY);

    backArrow.display();
    backArrow.onHover(mouseX, mouseY);

    if (voiceLineBulletin == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineBulletin = true;
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

  public void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      backArrow.switchScene(HALLWAY_SCENE);
      newsPaper.switchScene(NEWSPAPER_SCENE);
      poster.playSound();
    }
  }
}

//NEWSPAPER SCENE
class NewsPaperScene extends Scene {
  Minim minim;
  AudioPlayer sceneStart;

  Item backArrow;
  Item number1;
  Item number2;
  Item number3;

  NewsPaperScene() {
    super("Images/Newspaper.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/thisisfromthreeyearsago.wav");
    number1 = new Item(applet, 595, 724, 28, 30, "Investigate", "Audio/481 familiar.wav");
    number2 = new Item(applet, 888, 799, 47, 36, "Investigate", "Audio/481 familiar.wav");
    number3 = new Item(applet, 806, 841, 32, 26, "Investigate", "Audio/481 familiar.wav");
    backArrow = new Item(applet, 167, 409, 213, 196, "Back", "Audio/481 familiar.wav");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    number1.display();
    number1.onHover(mouseX, mouseY);

    number2.display();
    number2.onHover(mouseX, mouseY);

    number3.display();
    number3.onHover(mouseX, mouseY);

    backArrow.display();
    backArrow.onHover(mouseX, mouseY);

    if (voiceLineNewsPaper == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineNewsPaper = true;
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

  public void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      number1.playSound();
      number2.playSound();
      number3.playSound();
      backArrow.switchScene(BULLETIN_SCENE);
    }
  }
}

//MAILBOX SCENE
class MailboxScene extends Scene {
  Minim minim;
  AudioPlayer sceneStart;

  Item badMailbox1;
  Item badMailbox2;
  Item badMailbox3;
  Item goodMailbox;
  Item elevatorKey;
  Item backArrow;

  MailboxScene() {
    super("Images/Mailbox.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/letsseewhatwehavehere.wav");
    badMailbox1 = new Item(applet, 225, 178, 1433, 387, "Mailbox", "Audio/lookslikenothingshere.wav");
    badMailbox2 = new Item(applet, 218, 566, 853, 337, "Mailbox", "Audio/lookslikenothingshere.wav");
    badMailbox3 = new Item(applet, 1389, 566, 269, 343, "Mailbox", "Audio/lookslikenothingshere.wav");
    goodMailbox = new Item(applet, 1075, 566, 312, 334, "Mailbox", "Audio/Nothing.mp3");
    elevatorKey = new Item(applet, 1075, 566, "Images/Key.png", "Key", "Audio/thesemightcominhandy.wav");
    backArrow = new Item(applet, 20, 508, "Images/arrowLeft.png", "Back", "Audio/Nothing.mp3");
  }

  public void doStepWhileInState() {
    super.doStepWhileInState();

    badMailbox1.display();
    badMailbox1.onHover(mouseX, mouseY);

    badMailbox2.display();
    badMailbox2.onHover(mouseX, mouseY);

    badMailbox3.display();
    badMailbox3.onHover(mouseX, mouseY);

    if (!mailBoxOpen) {
      goodMailbox.display();
      goodMailbox.onHover(mouseX, mouseY);
    }

    backArrow.display();
    backArrow.onHover(mouseX, mouseY);

    if (mailBoxOpen) {
      if (!pickedUpKeys) {
        elevatorKey.display();
        elevatorKey.onHover(mouseX, mouseY);
      } else {
        return;
      }
    }

    if (voiceMailbox == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceMailbox = true;
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

  public void handleMousePressed() {
    if (!sceneStart.isPlaying()) {
      backArrow.switchScene(HALLWAY_SCENE);
      badMailbox1.playSound();
      badMailbox2.playSound();
      badMailbox3.playSound();
      if (!mailBoxOpen) {
        m = millis();
        goodMailbox.switchScene(CODEINPUT_SCENE);
      }
    }
    if (mailBoxOpen) {
      if (!pickedUpKeys) {
        elevatorKey.playSound();
        pickedUpKeys = true;
      }
    }
  }
}

//CODE INPUT SCENE FOR MAILBOX
class CodeInputScene extends Scene {
  Minim minim;
  AudioPlayer sceneStart;
  AudioPlayer goodCode;
  AudioPlayer badCode;



  Item backArrow;

  CodeInputScene() {
    super("Images/BGCutscene1.png", "Audio/Hallway1.mp3");
    minim = new Minim(applet);
    sceneStart = minim.loadFile("Audio/thisislockedineedtofindacodeorsmith.wav");
    goodCode = minim.loadFile("Audio/BINGO.wav");
    badCode = minim.loadFile("Audio/nottherightonemaybeishouldkeeplokingaround.wav");
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
    text("CODE:\n" + code + "\nPRESS ENTER TO SUBMIT", width/2, height/2);
    popMatrix();
    if (voiceLineBulletin == false) {
      if (millis() - m > 1000 && millis() - m < 1000 + sceneStart.length()) {
        if (!sceneStart.isPlaying()) {
          sceneStart.play();
          voiceLineBulletin = true;
        }
      }
    } else {
      //return;
    }

    if (mailBoxOpen) {
      stateHandler.changeStateTo( MAILBOX_SCENE );
      if (voiceBingo == false) {
        goodCode.play();
        voiceBingo = true;
      }
    }
  }

  public void handleMousePressed() {
    backArrow.switchScene(MAILBOX_SCENE);
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
        if (code.length()>0) {
          code=code.substring(0, code.length()-1);
        } // if
      } // if
      else if (key==RETURN || key==ENTER) {
        println ("ENTER");
        if (code.equals("481")) {
          println("Hurra!");
          mailBoxOpen=true;
          code="";
        } // if
        else {
          badCode.rewind();
          badCode.play();
          mailBoxOpen=false;
        }
      } // else if
      else {
        code+=key;
      } // else
      // output
      println (code);
    } // else
  }
}
