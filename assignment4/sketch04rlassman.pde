// Assignment #4
// Name: Rebecca Lassman
// E-mail: rlassman@brynmawr.edu
// Created on: 10/27/22

//I created a bar graph to display different countries' human populations in 2020. After finding the data set, I put
//the country names and populations into two arrays. I then used a loop to repeatedly draw rectangles for the
//bars, using the map() function to scale them based on population. In the loop, I used a conditional to display
//the country's name and population when the mouse is over its bar. I added labels to the x and y axis, a title, and
//the data's source. One challenging aspect was deciding the scale for the y axis labels, since the numbers
//are so large. I decided it was most effective to count by 100 millions.

String country[];
int population[];
float x1, y1, x2, y2;
float minPop, maxPop;
PFont f;

void setup() {
  size(1200, 800);
  background(255);
  f = createFont("Times New Roman",18,true);
  
  //inputs data from data file
  String[] lines = loadStrings("world_pop.csv");
  
  //creates 2 data arrays
  country = new String[lines.length-1];
  population = new int[lines.length-1];
  
  //populates arrays
  for (int i=1; i<lines.length; i++) {
    String[] pieces = split(lines[i], ",");
    country[i-1] = pieces[1];
    population[i-1] = int(pieces[62]);
  }
  
  //calculates min & max population
  maxPop = max(population);
  minPop = min(population);
  
  //sets up graph area
  x1 = width*0.05;
  y1 = height*0.05;
  x2 = width*0.95;
  y2 = height*0.95;
}

void draw() {
  background(255);
  float N = country.length;
  float barSpace = (x2-x1)/N;
  float barW = barSpace*0.8;
  float x = x1;
  
  //draws graph area
  rectMode(CORNERS);
  noStroke();
  fill(230);
  rect(x1, y1, x2, y2);
  
  //draws bar graph
  rectMode(CORNER);
  textFont(f);
  for (int i=0; i<N; i++) {
    float h = map(population[i], minPop, 1500000000, 0, y2-y1);
    float y = y2-h;
    fill(0,113,4);
    rect(x, y, barW, h);
    //displays country & population when mouse hovers over bar
    if (mouseX>=x && mouseX<=x+barW && mouseY>=y && mouseY<=y+h+10) {
      textAlign(CENTER);
      text(country[i],width*2/3,height/3);
      text(str(population[i])+" people",width*2/3,height/3+20);
    }
    
    x+=barSpace;
  }
  
  //draws title
  fill(0);
  textAlign(CENTER);
  textFont(f, 30);
  text("Countries' Populations in 2020", width/2, height/25); 
  
  //draws y axis numbers
  stroke(0);
  textFont(f, 15);
  for (int i=0; i<=1500; i+=100) {
    float yVal = map(i, 0, 1500, y2, y1);
    text(str(i), x1-25, yVal);
    line(x1, yVal, x1-5, yVal);
  }
  
  //draws y axis label
  push();
  float xText=width*0.01;
  float yText=height/2;
  translate(xText, yText);
  rotate(3*PI/2);
  text("population (in millions)", 0, 0);
  pop();
  
  //draws x axis label
  text("Countries", width/2, height-20);
 
  //draws source
  textAlign(LEFT);
  text("Source: World Population Data (https://vincentarelbundock.github.io/Rdatasets/datasets.html)", width/2, height/13);
  
  //draws signature
  textFont(f, 12);
  text("CS109 Fall 2022 Rebecca Lassman", width*0.85, height*0.98);
  
  save("sketch04rlassman.jpg");
}
