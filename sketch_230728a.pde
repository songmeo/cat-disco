import moonlander.library.*;
import ddf.minim.*;

Moonlander moonlander;
PFont font;
int t;
int interval = 6;
PFont zigBlack;
PImage img;

void setup() {
  // Uncomment the following lines for the final submission:
  //noCursor();
  //fullScreen();

  frameRate(60);

  // This sets the screen size and 2D- or 3D mode
  size(800, 800, P3D);
  
  noFill();

  // Parameters:
  // - PApplet
  // - soundtrack filename (relative to sketch's folder)
  // - beats per minute in the song
  // - how many rows in Rocket correspond to one beat (4 or 8 is recommended)
  moonlander = Moonlander.initWithSoundtrack(this, "data/example-music-140bpm.mp3", 140, 4);

  // start Moonlander
  moonlander.start("localhost", 1338, "data/syncdata.rocket");
  
}

void draw() {
  // pink background
  background(255, 192, 203);
  moonlander.update();

  translate(width/2, height/2, -100); // Move object to middle of screen and 100 units out
  int scene = moonlander.getIntValue("scene"); // scene switching
  
   // rainbow stroke
   strokeWeight(random(3, 10));
   stroke(random(255), random(255), random(255));


  if(scene == 1) {
    float rotation = (float) moonlander.getValue("box-rotation"); // Get rotation value from rocket
    rotation = radians(rotation);
    // Rotate the box below with the value from Rocket.
    rotate(rotation); 
    rotateY(rotation/2);
    rotateZ(rotation/4);
    box(random(200, 270));

  } else if (scene == 2) {
    fill(random(200,300), 0, 160);
    float rotation = (float) moonlander.getValue("sphere-rotation"); // Get rotation value from rocket
    rotation = radians(rotation);
    rotate(rotation); 
    rotateY(rotation/2);
    rotateZ(rotation/4);
    //sphereDetail(mouseX / 4, mouseY / 4);
    sphere(random(100, 150));
    fill(255);
    img = loadImage("cool_cat.jpg");
    //translate(width / 2, height / 2);
    translate(232, 192, 0);
    image(img, -img.width / 2, -img.height / 2);

  } else if (scene == 3) {
    translate(-width/2, -height/2);

    zigBlack = createFont("Ziggurat-Black", 32);
    textFont(zigBlack);
    text("GAME OVER", width/2 - 100, height/2);
    
    int rows = 10;
    int cols = 10;

    int cellHeight = height/rows;
    int cellWidth = width/cols;

    textSize(28);

    for(int y = 0; y < rows; y++){
      for(int x = 0; x < cols; x++){
    
        //get a random ascii letter
        char c = '!';
        c += random(93);
    
        //calculate cell position
        int pixelX = cellWidth * x;
        int pixelY = cellHeight * y;
    
        //add half to center letters
        pixelX += cellWidth/2;
        pixelY += cellHeight/2;
    
        fill(random(256));
        text(c, pixelX, pixelY);
      }
    }
  }
}
