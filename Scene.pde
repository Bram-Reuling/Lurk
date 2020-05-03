


class Scene extends State
{
  PImage backgroundImage;
  String filename;

  PImage backgroundImage2;
  String filename2;

  Minim minim;
  AudioPlayer backgroundSound;
  String soundFilename;

  int divideFrameBy;

  boolean fadeIn;

  float tintImage;

  int sceneDuration;

  StateHandler currentSceneState;
  
  //NORMAL SCENE
  //super([backgroundfile], [backgroundmusicfile]);
  Scene( String backgroundFilename, String backgroundSoundFilename ) {
    filename = backgroundFilename;
    soundFilename = backgroundSoundFilename;
  }

  //SCENE WITH ANIMATION
  //super([backgroundFile1], [backgroundFile2], [backgroundMusicFile]);
  Scene(String backgroundFilename, String backgroundFilename2, String backgroundSoundFilename) {
    filename = backgroundFilename;
    filename2 = backgroundFilename2;
    soundFilename = backgroundSoundFilename;
  }

  //NORMAL SCENE WITH FADE
  //super([backgroundFile], [backgroundMusicFile], true, 127);
  Scene(String backgroundFilename, String backgroundSoundFilename, boolean fade, int divideby) {
    filename = backgroundFilename;
    soundFilename = backgroundSoundFilename;
    fadeIn = fade;
    divideFrameBy = divideby;
  }

  //SCENE WITH ANIMATION AND FADE
  //super([backgroundFile], [backgroundFile2], [backgroundMusicFile], true, 127);
  Scene(String backgroundFilename, String backgroundFilename2, String backgroundSoundFilename, boolean fade, int divideby) {
    filename = backgroundFilename;
    filename2 = backgroundFilename2;
    soundFilename = backgroundSoundFilename;
    fadeIn = fade;
    divideFrameBy = divideby;
  }

  void enterState( State oldState )
  {
    frameCounter = 0;
    count = 0;
    if ( backgroundImage == null) {
      println( "Loading image '" + backgroundImage + "'" );
      println( "\tstart =\t" + millis() );
      backgroundImage = loadImage( filename );
      println( "\tend =\t" + millis() );

      if (filename2 != null) {
        println( "Loading image '" + backgroundImage2 + "'" );
        println( "\tstart =\t" + millis() );
        backgroundImage2 = loadImage( filename2 );
        println( "\tend =\t" + millis() );
      }
    }
    if ( backgroundSound == null ) {
      println( "Loading soundfile '" + soundFilename + "'" );
      println( "\tstart =\t" + millis() );
      //backgroundSound = new SoundFile(applet, soundFilename);
      minim = new Minim(applet);
      backgroundSound = minim.loadFile(soundFilename);
      println( "\tend =\t" + millis() );
    }
  }


  public void doStepWhileInState()
  {
    imageMode(CORNER);
    if (backgroundImage2 == null) {
      if (fadeIn == true) {
        pushMatrix();
        tintImage = tintImage + frameRate / divideFrameBy;
        tint(255, tintImage);
        image( backgroundImage, 0, 0, width, height );
        popMatrix();
      } else {
        image( backgroundImage, 0, 0, width, height );
      }
    } else {
      if (fadeIn == true) {
        pushMatrix();
        tintImage = tintImage + frameRate / divideFrameBy;
        tint(255, tintImage);
        image( backgroundImage, 0, 0, width, height );
        popMatrix();
      } else {
        image( backgroundImage, 0, 0, width, height );
      }
      for (frameCounter = 0; frameCounter < 240; frameCounter++) {
      }

      if (frameCounter == 240) {
        count++;
        frameCounter = 0;
      }

      if (count < 300) {
        image( backgroundImage, 0, 0, width, height );
      } else if (count > 300 && count < 310) {
        image( backgroundImage2, 0, 0, width, height );
      } else if (count > 310 && count < 320) {
        image( backgroundImage, 0, 0, width, height );
      } else if (count > 320 && count < 330) {
        image( backgroundImage2, 0, 0, width, height );
      } else if (count >= 330) {
        count = 0;
      }
    }
    if (!backgroundSound.isPlaying()) {
      backgroundSound.play();
      backgroundSound.loop();
    } else {
      return;
    }
  }

  public void stopSound() {
    count = 0;
    backgroundSound.pause();
    backgroundSound.rewind();
    //minim.stop();
  }
}
