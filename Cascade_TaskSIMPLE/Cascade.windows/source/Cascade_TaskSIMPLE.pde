import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in;


float angle;

float mainCol;
float innerCol;
float outterCol;

float mainX = 250;
float mainY = 250;

float mainAlpha = 10;


void setup() {
 
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);

  size(500, 500);
  
  background(0);
  smooth();
  
  frameRate(100);
 
}

void draw() {
  //background(255);
  ellipseMode(CENTER);

  mainCol = in.right.level()*4000; //reads the volume of the mic input as colour
  innerCol = in.right.level()*3000;
  outterCol = in.right.level()*2000;

  fill(mainCol,mainAlpha);
  mainCircle();

  fill(mainCol - innerCol, mainCol, outterCol,5);
  innerCircles();

  fill(innerCol - outterCol, mainCol, innerCol,5 );
  outterCircles();

if(mousePressed && mouseButton ==LEFT){
  if(mouseX >= width/2 -50 && mouseX <= width/2 +50 && mouseY >= height/2 -50 && mouseY <= height/2 +50);
{
reset();
}
}
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}

void mainCircle() {
  float main_X = in.right.level()*2000;
  float main_Y = in.right.level()*2000;

  ellipse(mainX, mainY, main_X, main_Y);
}

void innerCircles() {
  float main_X = in.right.level()*1000;
  float main_Y = in.right.level()*1000;

  ellipse( mainX -50 - main_X, mainY, main_X, main_Y);//9oclock
  ellipse(mainX + 50 + main_X, mainY, main_X, main_Y); // 3 oclock

  ellipse(mainX, mainY- 50 - main_Y, main_X, main_Y);// 12 oclcok
  ellipse(mainX, mainY +50 + main_Y, main_X, main_Y);// 6 oclock

  ellipse(mainX -50 - main_X*1.5, mainY- 50 - main_Y*1.5, main_X, main_Y); //10
  ellipse(mainX + 50 + main_X*1.5, mainY +50 + main_Y*1.5, main_X, main_Y); // 4

  ellipse(mainX + 50 + main_X*1.5, mainY- 50 - main_Y*1.5, main_X, main_Y);//2
  ellipse(mainX - 50-main_X*1.5, mainY +50 + main_Y*1.5, main_X, main_Y);// 8
}

void outterCircles() {
  float main_X = in.right.level()*500;
  float main_Y = in.right.level()*500;
 
  ellipse(mainX - 150 - main_X, mainY, main_X, main_Y);
  ellipse(mainX + 150 + main_X, mainY, main_X, main_Y);

  ellipse(mainX, mainY- 150 - main_Y, main_X, main_Y);
  ellipse(mainX, mainY +150 + main_Y, main_X, main_Y);

  ellipse(mainX -200- main_X, mainY- 200-main_Y, main_X, main_Y);
  ellipse(mainX + 200 + main_X, mainY +200+ main_Y, main_X, main_Y);

  ellipse(mainX + 200 + main_X, mainY - 200 - main_Y, main_X, main_Y);
  ellipse(mainX - 200 - main_Y, mainY + 200 + main_Y, main_X, main_Y);
}

void reset(){
fill(0);
rect(0,0,width,height);

}

