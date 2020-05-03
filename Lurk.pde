//A game made by Team Late Text V5
import processing.sound.*;
public String scene;
int frameSceneMenu = 0;

void setup() {
  smooth();
  fullScreen();
  scene = "Main";
}

void draw() {
  if (scene == "Main") {
    beginSceneMenu();
    doInSceneMenu();
  }
}

void mousePressed(){
  if (scene == "Main"){
    arrow.playSound();
  }
}
