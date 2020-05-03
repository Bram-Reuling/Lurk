/* 
How to use the hotspot system (Class and Tab name = Item)
To declare an item: Item [name];
In setup, initialize item: i = new Item(this, [X Position], [Y Position], "[Image file name]", "[Item name]", "[Sound File name]");


//A game made by Team Late Text V5
import processing.sound.*;

Item i;
Item i2;
SoundFile backgroundSound;

void setup() {
  fullScreen();
  //size(500, 500);
  i = new Item(this, width/2, height/2, "arrow.png", "Arrow", "YEET.mp3"); 
  backgroundSound = new SoundFile(this, "sound.wav");
  backgroundSound.amp(0.40);
  backgroundSound.play();
  backgroundSound.loop();
}

void draw() {
  background(0);
  i.display();
  i.onHover();
}

void mousePressed() {
  i.playSound();
}
*/
