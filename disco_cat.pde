import moonlander.library.*;
import ddf.minim.*;
//import com.hamoid.*;

PFont zigBlack;

Moonlander moonlander;
PImage warning;
PImage disco;
PImage cat1;
PImage cat2;
PImage cat3;

void setup() {
   size(800,800,P3D); //size and background image size need to match
   frameRate(12);
   smooth();
   noCursor();
   moonlander = Moonlander.initWithSoundtrack(this, "catdisco.mp3", 140, 4);
   moonlander.start("localhost", 1338, "discocat.rocket");

   warning = loadImage("data/warning.png");
   disco = loadImage("image-from-rawpixel-id-8153017-png.png");
   cat1 = loadImage("sk4155-image-kwvulaam.jpg");
   cat2 = loadImage("cool_cat.jpg");
   cat3 = loadImage("tired_cat.png");
 }

void draw(){
    background(255, 192, 203);
    //rect(frameCount * frameCount % width, 0, 40, height);


    strokeWeight(random(3, 10));
    stroke(random(255), random(255), random(255));
     
    translate(width/2,height/2);
    scale(height*0.001);
     
    int scene = moonlander.getIntValue("scene");
    moonlander.update();

    if(scene == 0){
     image(warning, -400, -400);
    } else if(scene == 1){  
     float updown1 = (float) moonlander.getValue("updown1"); // Get value from rocket
     float sidetoside1 = (float) moonlander.getValue("sidetoside1"); // Get value from rocket
     float updown2 = (float) moonlander.getValue("updown2"); // Get value from rocket
     float sidetoside2 = (float) moonlander.getValue("sidetoside2"); // Get value from rocket
      
     image(cat1,-600,-height/2);
     image(disco,sidetoside1,updown1+random(0,20));
     image(disco,sidetoside2,updown2+random(0,20));
          
    } else if (scene == 2) {
     image(cat1,-600,-height/2);
     
     fill(0);
     ellipse(600, 450+random(0,20), 80, 60); 
     
     strokeWeight(30);  // Thicker
     line(-20, 0, -120, -100);
     line(50,0,200,0);
     line(650, 370, 750, 300);
     line(650, 370, 750, 370);

    } else if (scene == 3) {
      float updown1 = (float) moonlander.getValue("updown1"); // Get value from rocket
      float sidetoside1 = (float) moonlander.getValue("sidetoside1"); // Get value from rocket
      int size1 = (int) moonlander.getValue("size1"); // Get value from rocket
      background(0);
      textSize(400);
      strokeWeight(random(3,10));
      fill(random(250), random(255), 255);
      text("DISCO", sidetoside1, 50);  // Default depth, no z-value specified
      textSize(200);
      fill(255, 153, 255);
      text("CAT", -300, -200);  // Specify a z-axis value
      image(disco,sidetoside1-190,-170);
      image(disco,sidetoside1+1050,-170);

    } else if (scene == 4) {
      fill(random(200,300), 0, 160);
      float rotation = (float) moonlander.getValue("sphere-rotation"); // Get rotation value from rocket
      rotation = radians(rotation);
      rotate(rotation); 
      rotateY(rotation/2);
      rotateZ(rotation/4);
      sphere(random(100, 150));
      translate(232, 192, 0);
      image(cat2, -cat2.width / 2, -cat2.height / 2);
      
    } else if (scene == 5) {
      image(cat3, -width / 2 + 200, - height / 2 + 210, cat3.width / 3, cat3.height / 3);
      noFill();
      stroke(random(200,300), random(20,200), random(255));
      float rotation = (float) moonlander.getValue("box-rotation"); // Get rotation value from rock\et
      rotation = radians(rotation);
      // Rotate the box below with the value from Rocket.
      rotate(rotation); 
      rotateY(rotation/2);
      rotateZ(rotation/4);
      box(300);

    } else if (scene == 6) {
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
    
    saveFrame("frame-##.png");
}
   
   
