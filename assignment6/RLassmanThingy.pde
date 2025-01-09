// Assignment #6
// Name: Rebecca Lassman
// E-mail: rlassman@brynmawr.edu
// Created on: 11/27/22

//My class creates a jellyfish located at (x, y) with the body height size. Each jellyfish's first tentacle is created 
//facing left, and moves at speed 0.5. The display() method displays the jellyfish on the canvas. It uses a loop to repeatedly
//call the drawTentacle() method, which draws a tentacle starting at the given (x, y) values. The switchTentDirection()
//method changes the value of of tentDirection to 1 or -1, which changes the tentacle's direction when drawTentacle() is
//called. The move() method moves the jellyfish up or down, and switched directions when it hits the top or bottom of the
//canvas. It also wiggles the tentacles by calling switchTentDirection(). The most difficult part of this program was figuring
//out how to make the tentacles move slower. I realized that by using an if statement and modulus divison, I could make them 
//switch directions after every 5 pixels the jellyfish moves instead of every 1 pixel.

class RLassmanThingy {
  //attributes
  float x, y; //center of the body
  float size;
  int tentDirection; //-1 for left, 1 for right
  float speed;
  
  //constructor
  RLassmanThingy(float x, float y, float bodySize) {
    this.x = x;
    this.y = y;
    size = bodySize;
    tentDirection = -1; //first tentacle points left
    speed = -0.5; //swims up first
  }
  
  //behaviors
  
  //displays the creature at (x,y), with body height of size
  void display() {
    float bodyH = size;
    float bodyW = bodyH*1.1;
    noStroke();
    fill(248, 188, 255, 200);
    
    //draw tentacles
    float delta = 0;
    float tentSpace = bodyW/12;
    for (int i=0; i<10; i++) {
      drawTentacle(x-bodyW/2.6+delta, y);
      delta+=tentSpace;
      switchTentDirection();
    }
    
    //draw body
    arc(x,y,bodyW,bodyH,PI,TWO_PI);
    arc(x,y,bodyW,bodyH/2,0,PI);
  }
  
  //moves the creature up or down & wiggles tentacles
  void move() {
    y+=speed;
    if (y%5 == 0) {
      switchTentDirection();
    }
    if (y-size/2 <= 0 || y+size*1.5 >= height) {
      speed = -speed;
    }
  }
  
  //draws a tentacle with the top at (x, y)
  void drawTentacle(float x, float y) {
    push();
    strokeWeight(size/20);
    stroke(233, 188, 245, 150);
    noFill();
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(x+(size/10)*tentDirection, y+size/2);
    curveVertex(x-(size/10)*tentDirection, y+size);
    curveVertex(x+(size/10)*tentDirection, y+size*1.5);
    curveVertex(x+(size/10)*tentDirection, y+size*1.5);
    endShape();
    pop();
  }
  
  //changes value of tentDirection
  void switchTentDirection() {
    if (tentDirection == 1) {
      tentDirection=-1;
    } else {
      tentDirection=1;
    }
  }
  
}
