import moonlander.library.*;
import ddf.minim.*;
//import com.hamoid.*;

PFont zigBlack;

Moonlander moonlander;

//VideoExport videoExport;

void setup() {
   size(800,800,P3D); //size and background image size need to match
   frameRate(12);
   smooth();
  
   moonlander = Moonlander.initWithSoundtrack(this, "catdisco.mp3", 140, 4);
   moonlander.start("localhost", 1338, "discocat.rocket");
   
   //videoExport = new VideoExport(this);
   //videoExport.startMovie();  
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
      PImage img;
      img = loadImage("data/warning.png");
      image(img, -400, -400);
    } else if(scene == 1){  
     float updown1 = (float) moonlander.getValue("updown1"); // Get value from rocket
     float sidetoside1 = (float) moonlander.getValue("sidetoside1"); // Get value from rocket
     float updown2 = (float) moonlander.getValue("updown2"); // Get value from rocket
     float sidetoside2 = (float) moonlander.getValue("sidetoside2"); // Get value from rocket
      
     PImage img;
     img = loadImage("data/sk4155-image-kwvulaam.jpg"); 
     image(img,-600,-height/2);
     PImage img2;
     img2 = loadImage("data/image-from-rawpixel-id-8153017-png.png"); 
     image(img2,sidetoside1,updown1+random(0,20));
     image(img2,sidetoside2,updown2+random(0,20));
     
     //fill(0);
     //ellipse(sidetoside1, updown1+random(0,20), 80, 60); 
     
    } else if (scene == 2) {
     PImage img;
     img = loadImage("data/sk4155-image-kwvulaam.jpg"); 
     image(img,-600,-height/2);
     
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
      PImage img2;
      img2 = loadImage("data/image-from-rawpixel-id-8153017-png.png"); 
      image(img2,sidetoside1-190,-170);
      image(img2,sidetoside1+1050,-170);

    } else if (scene == 4) {
      fill(random(200,300), 0, 160);
      float rotation = (float) moonlander.getValue("sphere-rotation"); // Get rotation value from rocket
      rotation = radians(rotation);
      rotate(rotation); 
      rotateY(rotation/2);
      rotateZ(rotation/4);
      sphere(random(100, 150));
      PImage img3;
      img3 = loadImage("data/cool_cat.jpg");
      translate(232, 192, 0);
      image(img3, -img3.width / 2, -img3.height / 2);
      
    } else if (scene == 5) {
      PImage img4;
      img4 = loadImage("data/tired_cat.png");
      //translate(0, 0, 0);
      image(img4, -width / 2 + 200, - height / 2 + 210, img4.width / 3, img4.height / 3);
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
    //videoExport.saveFrame();
}

//void keyPressed() {
//  if (key == 'q') {
//    videoExport.endMovie();
//    exit();
//  }
//}

   
   
