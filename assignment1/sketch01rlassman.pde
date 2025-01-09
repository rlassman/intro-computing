// Assignment #1
// Name: Rebecca Lassman
// E-mail: rlassman@brynmawr.edu
// Created on: 9/10/22
//
//I used a variety of primitive shapes to make a postcard for the fictional planet Tatooine from Star Wars. 
//To give the appearance of a sunset, I used curves to make three layers of sand dunes, and filled them each with a different color.
//The most challenging part was making Luke Skywalker's house because it required many different shapes, and figuring out 
//the position and size for each of them took a lot of trial and error. I also had to figure out the best order to draw these shapes
//in order to make the house look right. Overall, I enjoyed making this sketch, and I'm very pleased with how it turned out.

void setup() {
  size(500,500);
  background(255,192,124);
  noLoop();
  
}

void draw() {
  //Tatooine text
  fill(255,235,160,180);
  textSize(90);
  text("TATOOINE",50,70);
  
  //orange sun
  noStroke();
  fill(229,109,9);
  circle(385,180,45);
  
  //yellow sun
  fill(255,235,160);
  circle(295,130,60);
  
  //orange dunes
  fill(250,157,103);
  beginShape();
  curveVertex(0,300);
  curveVertex(0,300);
  curveVertex(50,275);
  curveVertex(100,270);
  curveVertex(150,250);
  curveVertex(200,240);
  curveVertex(250,250);
  curveVertex(300,230);
  curveVertex(350,250);
  curveVertex(400,280);
  curveVertex(500,300);
  curveVertex(500,300);
  endShape();
  rect(0,300,500,200);
  
  //pink dunes
  fill(216,118,118);
  beginShape();
  curveVertex(0,370);
  curveVertex(0,390);
  curveVertex(50,370);
  curveVertex(100,350);
  curveVertex(150,340);
  curveVertex(200,355);
  curveVertex(250,360);
  curveVertex(300,350);
  curveVertex(350,330);
  curveVertex(400,320);
  curveVertex(500,340);
  curveVertex(500,340);
  endShape();
  quad(0,370,0,500,500,500,500,340);
  
  //purple dunes
  fill(142,89,138);
  beginShape();
  curveVertex(0,450);
  curveVertex(0,450);
  curveVertex(50,400);
  curveVertex(100,375);
  curveVertex(150,385);
  curveVertex(200,400);
  curveVertex(250,410);
  curveVertex(300,430);
  curveVertex(350,435);
  curveVertex(500,450);
  curveVertex(500,450);
  endShape();
  rect(0,450,500,50);
  
  //Luke Skywalker's house
  fill(95,45,92);
  stroke(0);
  arc(205,415,122,90,PI,TWO_PI);
  noStroke();
  rect(198,405,55,35);
  stroke(0);
  arc(186,422,45,50,PI+HALF_PI,TWO_PI+HALF_PI);
  noStroke();
  triangle(158,400,188,398,188,430);
  stroke(0);
  arc(270,422,40,50,PI,PI+HALF_PI+THIRD_PI);
  arc(280,440,30,70,PI,TWO_PI);
  rect(100,430,100,25);
  quad(200,430,215,425,215,450,200,455);
  quad(215,425,250,422,250,440,215,450);
  square(250,422,18);
  arc(150,430,70,60,PI,TWO_PI);
  line(158,400,185,397);
  fill(0);
  arc(283,440,10,50,PI,TWO_PI);
  
  //signature
  textSize(10);
  text("CS109 Fall 2022 Rebecca Lassman",350,490);
  
  save("sketch01rlassman.jpg");
}  
