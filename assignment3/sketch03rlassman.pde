// Assignment #3
// Name: Rebecca Lassman
// E-mail: rlassman@brynmawr.edu
// Created on: 10/13/22

//I created several functions to draw simple shapes, then called them repetitively to create a mandala pattern. 
//The functions have several parameters to control the location, size, angle, and color of the shapes. I used
//the sin() and cos() functions in for loops to repeatedly draw the shapes around a center point in order to create 
//the mandala pattern. The most difficult part of this assignment was controlling the angle of the shapes so that 
//each shape pointed away from the center. It took me awhile to realize that adding a parameter to specify the shape's 
//angle would achieve this.

void setup() {
 size(displayWidth, displayHeight); 
 background(255,151,151);
 noLoop();
}

void draw() {
  float x1=width/2, y1=height/2, x2, y2;
  float angle, delta, theta;
  color c;
  
  //background lines
  stroke(255);
  spokes(x1,y1,200,height);
  
  //pink circle
  noStroke();
  fill(191,97,196,200);
  circle(x1,y1,height);
  
  //purple petals
  c=color(137,45,203,200);
  angle=radians(270);
  delta=2*PI/8;
  theta=45;
  for(int i=0; i<8; i++) {
    x2 = x1+height*0.5*cos(angle);
    y2 = y1+height*0.5*sin(angle);
    pointedPetal(x2,y2,150,theta,c);
    angle+=delta;
    theta+=45;
  }
  
  //dark blue petals
  c=color(84,60,222,200);
  angle=radians(292.5);
  theta=22.5;
  for(int i=0; i<8; i++) {
    x2 = x1+height*0.25*cos(angle);
    y2 = y1+height*0.25*sin(angle);
    curvedPetal(x2,y2,250,300,theta,c);
    angle+=delta;
    theta+=45;
  }
  
  //light blue petals
  c=color(70,206,232,200);
  angle=radians(270);
  delta=2*PI/16;
  theta=45;
  for(int i=0; i<16; i++) {
    x2 = x1+height*0.3*cos(angle);
    y2 = y1+height*0.3*sin(angle);
    pointedPetal(x2,y2,100,theta,c);
    angle+=delta;
    theta+=22.5;
  }
  
  //green octagon
  c=color(32,198,72,200);
  polygon(x1,y1,200,8,0,c);
  
  //yellow star
  c=color(247,247,72,200);
  polygon(x1,y1,200,3,90,c);
  polygon(x1,y1,200,3,150,c);
  
  //orange hexagon
  c=color(225,168,54,100);
  polygon(x1,y1,100,6,0,c);
  
  //orange center lines
  stroke(225,168,54);
  spokes(x1,y1,48,70);
  
  //red circle
  noStroke();
  fill(232,26,26,150);
  circle(x1,y1,50);
  
  //signature
  fill(0);
  textSize(20);
  text("CS109 Fall 2022 Rebecca Lassman", width*0.8, height*0.98);
  
  save("sketch03rlassman.jpg");
}

void spokes(float x, float y, float n, float l) {
  //draws n lines from center (x, y) of length l
  float x2, y2;
  float angle=0;
  float delta = 2*PI/n;
  for(float i=0; i<=n; i++) {
    x2 = x+l*cos(angle);
    y2 = y+l*sin(angle);
    line(x,y,x2,y2);
    angle+=delta;
  }
}

void polygon(float x, float y, float r, float n, float theta, color c) {
  //draws polygon centered at (x, y) with n sides, radius r, angled at theta, and of color c
  push();
  translate(x,y);
  rotate(radians(theta));
  float x2, y2;
  float angle=0;
  float delta=2*PI/n;
  fill(c);
  beginShape();
  for(int i=0; i<n; i++) {
    x2 = 0+r*cos(angle);
    y2 = 0+r*sin(angle);
    vertex(x2, y2);
    angle+=delta;
  }
  endShape(CLOSE);
  pop();
}

void pointedPetal(float x, float y, float sz, float theta, color c) {
  //draws petal shape with the point at (x, y) of size sz, angled at theta, and of color c
  fill(c);
  push();
  translate(x,y);
  rotate(radians(theta));
  beginShape();
  curveVertex(0,0);
  curveVertex(0,0);
  curveVertex(sz,1/3*sz);
  curveVertex(sz,sz);
  curveVertex(1/3*sz,sz);
  curveVertex(0,0);
  curveVertex(0,0);
  endShape();
  pop();
}

void curvedPetal(float x, float y, float w, float h, float theta, color c) {
 //draws half ellipse centered at (x, y) of width w & height h, angled at theta, and of color c
 fill(c);
 push();
 translate(x,y);
 rotate(radians(theta));
 arc(0,0,w,h,PI,TWO_PI);
 pop();
}
