class rain {
  PImage raindrop;
  int rotation=10;
  float x, y;
  float random;
  int speed=5;
  rain() {
    random=random(1, 100);
    if (random>0 && random <20)
      raindrop=loadImage("Images/RainDrop.png");
    else if (random>20&&random <40)
      raindrop=loadImage("Images/RainDrop2.png");
    else if (random>40&&random <60)
      raindrop=loadImage("Images/RainDrop3.png");
    else if (random>60&&random <80)
      raindrop=loadImage("Images/RainDrop4.png");
    else if (random>80&&random <100)
      raindrop=loadImage("Images/RainDrop5.png");
    x=int(random(0, width+50));
    y=int(random(0, height));
  }

  void display() {
    //imageMode(CENTER);
    //image(raindrop,x,y);
    //rotate(rotation);
    x=x-1.5*speed;
    y=y+6*speed;
    imageMode(CENTER);
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    image(raindrop, 0, 0);

    popMatrix();
    if (y>height+50) y= -10;
    if (x<0) x=width+10;
  }
}
