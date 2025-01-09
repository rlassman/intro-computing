// Assignment #2
// Name: Rebecca Lassman
// E-mail: rlassman@brynmawr.edu
// Created on: 9/15/22

//I used primitive shapes to create a function that draws a mushroom of a specified size 
//and color at a specified location. When called in draw, one is continuously added to the y
//variable, making the mushroom move down the canvas. When the mouse is pressed, the x coordinate
//is set to the mouse's location, and y is set to zero, making the mushroom return to the top of the
//canvas at the mouse's x position. The size and color variables are also randomized. The most difficult
//part of this assignment was figuring out the correct proportions of all the components of the mushroom
//in relation to its width and height, since it took a lot of trial and error. 

void setup() {
  size(600,500);
  background(214,240,255);
}

float x = 300, y = 0, sz = 200;
color c = color(255,88,88);

void draw() {
  background(214,240,255);
  
  //draws mushroom that moves down the screen
  drawMushroom(x,y,sz,c);
  y++;
  
  save("sketch02rlassman.jpg");
}

void drawMushroom(float x, float y, float sz, color c) {
  //draws a mushroom (of size sz and color c) centered at (x,y)
  
  float h = sz;
  float w = 0.6*sz;
  float baseW = w/2;
  float baseH = h/3;
  float capW = w;
  float capH = h/2;
  float spotW = w/10;
  
  //base
  noStroke();
  fill(255,217,185);
  triangle(x,y,x+baseW*1/2,y+baseH,x-baseW*1/2,y+baseH);
  arc(x,y+baseH,baseW,h/5,0,PI);
  
  //cap
  fill(c);
  arc(x,y,capW,capH,PI,TWO_PI);
  arc(x,y,capW,capH/2,0,PI);
  
  //spots on cap
  fill(255);
  circle(x-baseW*2/3,y,spotW);
  circle(x-baseW/3,y-capH/3,spotW);
  circle(x-baseW/10,y+capH/10,spotW);
  circle(x+baseW/1.5,y,spotW);
  circle(x+baseW/2,y-capH/3,spotW);
  circle(x+baseW/10,y-capH/6,spotW);
  
  //eyes
  strokeWeight(5);
  stroke(0);
  noFill();
  arc(x-baseW/3,y-baseH/5,spotW,spotW,PI,TWO_PI); 
  arc(x+baseW/3,y-baseH/5,spotW,spotW,PI,TWO_PI);
  
  //mouth
  arc(x,y,spotW,spotW,0,PI);
  line(x-spotW/2,y,x+spotW/2,y);
  
  //signature
  textSize(10);
  fill(0);
  text("CS109 Fall 2022 Rebecca Lassman",450,490);
}

void mousePressed() {
  //sets variables for new mushroom when mouse is pressed
  x = mouseX;
  y = 0;
  sz = random(150,400);
  c = color(random(100,255),random(100,255),random(100,255));
}
