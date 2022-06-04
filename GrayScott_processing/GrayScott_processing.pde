import controlP5.*;

ControlP5 cp5;
Slider f;
Slider k;
Slider s;
/*
int w=640;
 int h=480;
 
 float Dr=0.00002;
 float Dv=0.00001;
 float f=0.022;
 float k=0.051;
 
 float[][] u=new float[h][w];
 float[][] v=new float[h][w];
 
 float dx=0.01;
 float dt=1.0;
 */

GrayScott gs;

PImage uImage;
PImage vImage;

int steps=8;
int time=0;

void setup() {
  frameRate(30);
  //size(1280, 480);
  size(640, 480);
  //size(256, 256);


  cp5=new ControlP5(this);
  f=cp5.addSlider("f")
    .setPosition(20, 20)
    .setRange(0.01, 0.05)
    .setValue(0.022);
  k=cp5.addSlider("k")
    .setPosition(20, 30)
    .setRange(0.05, 0.07)
    .setValue(0.051);
    s=cp5.addSlider("Square Size")
    .setPosition(20,40)
    .setRange(10,100)
    .setValue(20);
    
  uImage=createImage(width, height, GRAY);
  vImage=createImage(width, height, GRAY);

  /*
   for(int y=0;y<height;y++){
   for(int x=0;x<width;x++){
   u[y][x]=1;
   v[y][x]=0;
   
   int squareSize=50;
   if(y>int(height/2)-squareSize&&y<int(height/2)+squareSize&&int(width/2)-squareSize<x&&x<int(width/2)+squareSize){
   u[y][x]=0.5;
   v[y][x]=0.25;
   }
   u[y][x]+=random(0,0.1);
   v[y][x]+=random(0,0.1);
   }
   }
   */

  gs=new GrayScott();
  gs.init();
}

void draw() {
  //loading(gs.u);
  //background(255);

  for (int i=0; i<8; i++) {
    gs.update();
  }
  /*
  loadingFlip(gs.v,vImage);
   */

  //loadingP(gs.u);
  //loadingFlip(gs.u,uImage);
  //loadingThreshold(gs.u, uImage)
  //println(time);
  //if (++time>=steps) {
  //time=0;
  loading(gs.u, uImage);
  image(uImage, 0, 0);
  //}

  //image(vImage,width/2,0);

  //loadingP(gs.v);
  /*
  image(vImage,0,0);
   image(uImage,640,0);
   */
}

void keyPressed() {
  if (key=='u') {
    gs.init();
    gs.setParam(f.getValue(), k.getValue(),int(s.getValue()));
  }
}
