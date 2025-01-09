RLassmanThingy RLjellyfish1, RLjellyfish2, RLjellyfish3, RLjellyfish4, RLjellyfish5;
float size1, size2, size3, size4, size5;

void setup() {
  size(800,600);
  background(80, 175, 232);
  
  size1 = 70;
  size2 = 110;
  size3 = 40;
  size4 = 50;
  size5 = 80;
  
  RLjellyfish1 = new RLassmanThingy(width/2, height/3, size1);
  RLjellyfish2 = new RLassmanThingy(width/3, height/1.5, size2);
  RLjellyfish3 = new RLassmanThingy(width*2/3, height/2, size3);
  RLjellyfish4 = new RLassmanThingy(width/5, height*3/4, size4);
  RLjellyfish5 = new RLassmanThingy(width*0.8, height*2/3, size5);
}

void draw() {
  background(80, 175, 232);
  
  RLjellyfish1.move();
  RLjellyfish1.display();
  RLjellyfish2.move();
  RLjellyfish2.display();
  RLjellyfish3.move();
  RLjellyfish3.display();
  RLjellyfish4.move();
  RLjellyfish4.display();
  RLjellyfish5.move();
  RLjellyfish5.display();
  
  save("sketch06rlassman.jpg");
}
