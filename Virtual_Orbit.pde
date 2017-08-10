import ddf.minim.*;
import ddf.minim.analysis.*;

int imageIndex=0;
float xPosition;

PImage[] images1=new PImage[4];
PImage[] images2=new PImage[4];
PImage[] images3=new PImage[4];

Minim minim;
AudioInput in; 

void setup() {
  size(832, 416);
  for (int i = 0; i<4; i++) {
    images1[i]=loadImage(i+".png");
    images2[i]=loadImage("f"+i+".png");
    images3[i]=loadImage("a"+i+".png");
 frameRate(10);
  }
  minim = new Minim(this);
  in= minim.getLineIn();
}

void draw() {

  float level = in.mix.level();
  level *= 100;
  println(level);
   
  if (level<0.5) {
    image(images1[imageIndex], 0, 0);
      imageIndex=(imageIndex+1)% 4;
  } else if (level >=0.5 && level<1.5) {
    image(images2[imageIndex], 0, 0);
          imageIndex=(imageIndex+1)% 4;
  } else if (level >=1.5 && level<2) {
    image(images3[imageIndex], 0, 0);
          imageIndex=(imageIndex+1)% 4;
  }
}