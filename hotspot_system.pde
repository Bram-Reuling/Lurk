//Item for the hotspot system
class Item {
  //Data
  //Position of item
  float x;
  float y;

  //Item image
  PImage item;

  //Name of image and item
  String fileName;
  String itemName;

  //Width and height of the item
  int itemWidth;
  int itemHeight;
  
  //Sounds
  SoundFile sound;
  String soundFile;

  //Constructor
  Item(PApplet applet, float tempX, float tempY, String tempFileName, String tempItemName, String tempSoundFile) {
    x = tempX;
    y = tempY;

    fileName = tempFileName;
    item = loadImage(fileName);
    itemName = tempItemName;

    itemWidth = item.width;
    itemHeight = item.height;

    soundFile = tempSoundFile;
    sound = new SoundFile(applet, soundFile);
  }

  //Functions
  void display() {
    pushMatrix();
    item.resize(itemWidth/2, itemHeight/2);
    image(item, x, y);
    popMatrix();
  }

  void onHover(float x, float y) {
    if (mouseX >= x && mouseX <= x + itemWidth/2 && mouseY >= y && mouseY <= y + itemHeight/2) {
      fill(255);
      //textMode(CENTER);
      textSize(30);
      text(itemName, mouseX + 25, mouseY + 12);
    }
  }

  void playSound() {
    if (mouseX >= x && mouseX <= x + itemWidth/2 && mouseY >= y && mouseY <= y + itemHeight/2) {
      if (sound.isPlaying()) {
        return;
      } else {
        sound.amp(0.1);
        sound.play();
      }
    }
  }
}
