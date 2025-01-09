// Assignment #5
// Name: Rebecca Lassman
// E-mail: rlassman@brynmawr.edu
// Created on: 11/12/22

//My StreetLight class creates a streetlight located at (x,y) of height h. All streetlights are created with the light off, but they can be
//turned on or off using the turnOn() and turnOff() methods. The diplay() method displays the streetlight by calling the drawLight() method,
//which uses Processing shapes to draw a streetlight. drawLight() uses the isOn() method to determine whether to draw the streetlight on
//or off. The most challenging part of this class was drawing the streetlight. All of the sizes of the shapes had to be based off of h, so
//it required some trial and error to determine the widths and heights for each shape.

class StreetLight {
  
  //attributes
  float x, y; //location of the bottom of the streetlight
  float h; //height of streetlight
  boolean on; //is the streetlight on?
  
  //constructor
  StreetLight(float x, float y, float h) {
    this.x = x;
    this.y = y;
    this.h = h;
    on = false;
  }
  
  //behaviors
  
  //returns true if light is on
  boolean isOn() {
    return on;
  }
  
  //turns the light on
  void turnOn() {
    on=true;
  }
  
  //turns the light off
  void turnOff() {
    on=false;
  }
  
  //displays streetlight
  void display() {
     drawLight();
  }
  
  //draws streetlight
  void drawLight() {
    push();
    float pollW = h/15;
    float baseW = pollW*3;
    float lampBaseW = pollW*1.2;
    float quadW = pollW*1.6;
    float lampW = quadW*1.2;
    float topEllipseW = pollW*2.4;
    float topW = pollW/2;
    
    float pollH = h*0.6;
    float baseH = h*0.05;
    float lampH = h*0.2;
    float topEllipseH = h*0.02;
    float triH = h*0.12;
    
    noStroke();
    fill(39);
    
    //draws light
    if (isOn()) { //checks if light is on
      fill(255, 224, 64, 40);
      ellipse(x, y-baseH/2-pollH-2*baseH-lampH/3, lampW*1.3, lampH);
      fill(255, 224, 64);
    } else {
      fill(173);
    }
    ellipse(x, y-baseH/2-pollH-2*baseH-lampH/3, lampW, lampH);
    
    //draws base
    fill(39);
    rectMode(CENTER);
    rect(x, y, baseW, baseH, 5);
    
    //draws poll
    rectMode(CORNER);
    rect(x-pollW/2, y-pollH-baseH/2, pollW, pollH);
    
    //draws bottom of lamp
    fill(39);
    rect(x-lampBaseW/2, y-baseH/2-pollH-baseH, lampBaseW, baseH, 4);
    quad(x-lampBaseW/2, y-baseH/2-pollH-baseH, x+lampBaseW/2, y-baseH/2-pollH-baseH, x+quadW/2, y-baseH/2-pollH-2*baseH, x-quadW/2, y-baseH/2-pollH-2*baseH);
    
    //draws top of lamp
    ellipse(x, y-baseH/2-pollH-2*baseH-lampH*0.6, topEllipseW, topEllipseH);
    triangle(x-topEllipseW/2, y-baseH/2-pollH-2*baseH-lampH*0.6, x+topEllipseW/2, y-baseH/2-pollH-2*baseH-lampH*0.6, x, y-baseH/2-pollH-2*baseH-lampH*0.6-triH);
    square(x-topW/2, y-baseH/2-pollH-2*baseH-lampH*0.6-triH, topW);
    
    pop();
  }
}
