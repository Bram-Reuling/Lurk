class CutScene1 extends Scene {

  private float tintText = 0;
  private float tintTextSkip = 0;
  private float tintTextSubtitle = 0;

  CutScene1() {
    super("Images/BGCutscene1.png", "Audio/FirstCutscene.mp3", true, 127);
    Ornate = createFont("Fonts/WinchesterOrnate.ttf", 200);
    RegularCutscene = createFont("Fonts/WinchesterRegular.ttf", 75);
    RegularSkip = createFont("Fonts/WinchesterRegular.ttf", 50);
    m = millis();
  }

  public void doStepWhileInState() {
    int duration = backgroundSound.length();
    backgroundSound.setGain(-10);
    super.doStepWhileInState();
    if (millis() - m > 20600 && millis() - m < 27000) {
      tintText = tintText + frameRate / 85;
      pushMatrix();
      fill(255);
      textSize(100);
      textAlign(CENTER, CENTER);
      fill(255, tintText);
      textFont(Ornate);
      text("Chapter 1:\nA Call In The Night", width/2, height/2);
      popMatrix();
    } else if (millis() - m > 27000 && millis() - m < 33500) {
      tintText = tintText - frameRate / 85;
      pushMatrix();
      fill(255);
      textSize(100);
      textAlign(CENTER, CENTER);
      fill(255, tintText);
      textFont(Ornate);
      text("Chapter 1:\nA Call In The Night", width/2, height/2);
      popMatrix();
    } else if (millis() - m > 0 && millis() - m < 5000) {
      tintTextSubtitle = tintTextSubtitle + frameRate / 85;
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      fill(255, tintTextSubtitle);
      textFont(RegularCutscene);
      text("*PHONE RINGING*", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 5000 && millis() - m < 6000) {
      tintText = 0;
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Off.Jones): What now?", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 6000 && millis() - m < 9300) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Dispatch): There is a possibility of a 10-31\nin a New York appartment block.", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 9300 && millis() - m < 10500) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Off.Jones): What's the 10-20?", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 10500 && millis() - m < 12100) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Dispatch): 69th Wooster Street.", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 12100 && millis() - m < 15500) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Off.Jones): ...", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 15500 && millis() - m < 18300) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Dispatch): Officer Jones? Hello?", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 18300 && millis() - m < 20600) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Off.Jones): Oh yeah. 10-4, I'm on my way.", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 33500 && millis() - m < 37000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("*CAR DOOR OPENS*", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 37000 && millis() - m < 40000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("*ENGINE OF CAR STARTS*", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 40000 && millis() - m < 48000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("*MUSIC PLAYING AT RADIO*", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 48000 && millis() - m < 52000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("*RADIO BEEPING*", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 52000 && millis() - m < 58000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Radio Person): There is a situation on 69th Wooster Street,\nauthorities have already been notified\n of the situation and are on their way", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 58000 && millis() - m < 61000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("*MUSIC FADES IN*", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 61000 && millis() - m < 65000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularCutscene);
      text("(Off.Jones): Well that was fast", width/2, height/2 + 350);
      popMatrix();
    } else if (millis() - m > 65000 && millis() - m < 72000) {
      tintTextSubtitle = tintTextSubtitle - frameRate / 85;
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      fill(255, tintTextSubtitle);
      textFont(RegularCutscene);
      text("*MUSIC FADES OUT*", width/2, height/2 + 350);
      popMatrix();
    } 

    if (millis() - m > 5000 && millis() - m < 10000) {
      tintTextSkip = tintTextSkip + frameRate / 85;
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      fill(255, tintTextSkip);
      textFont(RegularSkip);
      text("Press SPACE to skip", width - 150, height - 50);
      popMatrix();
    } else if (millis() - m > 10000 && millis() - m < 65000) {
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(RegularSkip);
      text("Press SPACE to skip", width - 150, height - 50);
      popMatrix();
    } else if (millis() - m > 65000 && millis() - m < duration) {
      tintTextSkip = tintTextSkip - frameRate / 85;
      pushMatrix();
      fill(255);
      textAlign(CENTER, CENTER);
      fill(255, tintTextSkip);
      textFont(RegularSkip);
      text("Press SPACE to skip", width - 150, height - 50);
      popMatrix();
    }



    if (millis() - m >= duration) {
      stateHandler.changeStateTo( TIP_SCENE );
      m = millis();
    }
  }

  public void handleKeyPressed() {
    if (key == ' ') {
      stateHandler.changeStateTo( TIP_SCENE );
      m = millis();
    }
  }
}
