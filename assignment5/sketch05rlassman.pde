// Street Lights...

// The array of StreetLight objects....
StreetLight[] lights;
int N = 6;
void setup() {
 size(800, 600);
   smooth();
   background(255);
   frameRate(30);
   // these variables are used in creating the street lights
   float x, y, m = -0.375, c;
   float h = 500, distance = 300;
   // Create N street lights
   lights = new StreetLight[N];
   x = 100; // x location of first street light
   c = height-10; // the intercept for locating the rest of lights
   for (int i = 0; i < N; i++) {
      y = m*x+c;
      // create a new light at <x, y> of height h
      lights[i] = new StreetLight(x, y, h);
      h = h*0.75;
      distance = distance*0.75;
      x += distance;
   }
} // setup
 
void draw() {
   drawScene();
 int i;
   // first draw all the lights (in their current state)
   for (i = 0; i < N; i++) {
      lights[i].display();
   }

   // randomly turn some light on/off
   if ((frameCount % 180) == 0) {
      i = int(random(N));
      if (lights[i].isOn()) {
         lights[i].turnOff();
      } else {
         lights[i].turnOn();
      }
   }
   
   save("sketch04rlassman.jpg");
   
} // draw

// draws the street scene...
void drawScene() {
   // draws the street scene...
   // curb
   smooth();
   fill(0);
   noStroke();
   quad(25, height, width, 300, width, 315, 150, height);
   // sidewalk
   noStroke();
   // fill(85, 82, 77);
   fill(90, 55, 39);
   beginShape();
   vertex(0, height-250);
   vertex(width, 220);
   vertex(width, 301);
   vertex(26, height);
   vertex(0, height);
   vertex(0, height-250);
   endShape(CLOSE);
   // dark background
   noStroke();
   fill(98, 73, 76);
   quad(0, height-249, width, 221, width, 0, 0, 0);
   // road
   noStroke();
   fill(75);
   triangle(149, height, width, 314, width, height);
} // drawScene
