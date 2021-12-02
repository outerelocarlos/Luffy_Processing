//---- Variables Globales ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

int w = 600, h = 800; //dimensiones iniciales de la ventana

color skybox,
strawhat,
strawhat_shadow,
skin,shirt,
control_color;

float[] x;

import controlP5.*; //librería
ControlP5 cp5; //controlador de los botones y demás elementos de la interfaz

//---- Inicialización -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

void setup() { //define las varibles generalmente no reescribibles
  surface.setResizable(false); //el usuario no tiene la libertad de reconfigurar libremente la ventana
  surface.setSize(w, h); //tamaño de la ventana en función de las variables pertinentes  

  skybox = color(180, 224, 243, 255);
  strawhat = color(227, 185, 99, 255);
  strawhat_shadow = color(162, 116, 26, 255);
  skin = color(255, 187, 139, 255);
  shirt = color(15, 151, 181, 255);
  
  x = new float[2];
  x[0] = 0.2*w;
  x[1] = -0.35*w;
  
  /*PImage[] nightmode = {loadImage("sun.png"), loadImage("moon.png"), loadImage("moon.png")};
  
  cp5.addToggle("Night Mode")
    .setValue(0)
    .setImages(nightmode)
    .updateSize()
    .setPosition(100, 100);*/
}

//---- Inicialización -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

void draw() {
  background(255);
  strokeWeight(1.75);

  rectMode(CORNER);
  fill(skybox);
  rect(-0.1*w, -0.1*h, 1.2*w, 1.2*h);

  cloud(x[0], 0.075*h, 0.2*w, 0.1*h);
  cloud(x[1], 0.75*h, 0.3*w, 0.15*h);

  body();
  strawhat();
  ears();
  head(); 
  face();
  shirt();
  
  x[0] += 0.65;
  x[1] += 0.45;
  
  if (x[0] > w + 0.2*w) {
    x[0] = -0.25*w;
  }
  if (x[1] > w + 0.3*w) {
    x[1] = -0.35*w;
  }
}

//---- Dibujo desglosado ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

void body() {
  translate(0, 0.015*h);

  ellipseMode(CENTER);
  stroke(0);
  fill(skin);
  /*translate(0.5*w, 1.175*h);
   beginShape();
   vertex(0, -0.52*w);
   quadraticVertex(0.52*w, -0.52*w, 0.52*w, 0);
   quadraticVertex(0.52*w, 0.52*w, 0, 0.52*w);
   quadraticVertex(-0.52*w, 0.52*w, -0.52*w, 0);
   quadraticVertex(-0.52*w, -0.52*w, 0, -0.52*w);
   endShape();
   translate(-0.5*w, -1.175*h);*/
  ellipse(0.5*w, 1.035*h, 1.05*w, 0.5*h);

  noStroke();
  rectMode(CENTER);
  rect(0.5*w, 0.75*h, 0.24*w, 0.2*h);

  stroke(0);
  line(0.38*w, 0.5*h, 0.38*w, 0.792*h);
  line(0.62*w, 0.5*h, 0.62*w, 0.792*h);

  line(0.25*w, 0.875*h, 0.4*w, 0.875*h);
  //line(0.4*w, 0.875*h, 0.45*w, 0.89*h);
  bezier(0.4*w, 0.875*h, 0.425*w, 0.875*h, 0.45*w, 0.875*h, 0.45*w, 0.89*h);

  translate(w, 0);
  line(-0.25*w, 0.875*h, -0.4*w, 0.875*h);
  //line(0.4*w, 0.875*h, 0.45*w, 0.89*h);
  bezier(-0.4*w, 0.875*h, -0.425*w, 0.875*h, -0.45*w, 0.875*h, -0.45*w, 0.89*h);
  translate(-w, 0);

  translate(0, -0.015*h);
}

void strawhat() {
  stroke(0);
  fill(strawhat);
  translate(0.5*w, h/3.);
  beginShape();
  vertex(0, -0.4*w);
  quadraticVertex(0.4*w, -0.4*w, 0.4*w, 0);
  quadraticVertex(0.4*w, 0.4*w, 0, 0.4*w);
  quadraticVertex(-0.4*w, 0.4*w, -0.4*w, 0);
  quadraticVertex(-0.4*w, -0.4*w, 0, -0.4*w);
  endShape();

  ellipseMode(CENTER);
  fill(strawhat);
  ellipse(0, 0.075*h, 1.1*w, h/1.9);

  fill(strawhat_shadow);
  ellipse(0, 0.095*h, 1.1*w, h/1.9);

  noStroke();
  fill(strawhat_shadow);
  ellipse(0, 0.09*h, 1.1*w, h/1.9);
}

void ears() {
  stroke(0);
  fill(skin);
  rotate(-PI/8);
  ellipse(-0.4*w, 0.1*h, 0.125*w, 0.15*h);
  rotate(PI/4);
  ellipse(0.4*w, 0.1*h, 0.125*w, 0.15*h);
  rotate(-PI/8);
  translate(-0.5*w, -h/3.);
  
  bezier(0.15*w, 0.5*h, 0.15*w, 0.52*h, 0.22*w, 0.58*h, 0.25*w, 0.58*h);
  bezier(0.16*w, 0.55*h, 0.16*w, 0.57*h, 0.18*w, 0.58*h, 0.21*w, 0.5825*h);
  translate(w, 0);
  scale(-1, 1);
  bezier(0.15*w, 0.5*h, 0.15*w, 0.52*h, 0.22*w, 0.58*h, 0.25*w, 0.58*h);
  bezier(0.16*w, 0.55*h, 0.16*w, 0.57*h, 0.18*w, 0.58*h, 0.21*w, 0.5825*h);
  translate(w, 0);
  scale(-1, 1);
}

void head() {
  translate(0.5*w, 0.5*h);
  rotate(PI/4);
  beginShape();
  vertex(0, -0.3*w);
  quadraticVertex(0.3*w, -0.3*w, 0.3*w, 0);
  quadraticVertex(0.3*w, 0.3*w, 0, 0.3*w);
  quadraticVertex(-0.3*w, 0.3*w, -0.3*w, 0);
  quadraticVertex(-0.3*w, -0.3*w, 0, -0.3*w);
  endShape();
  rotate(-PI/4);
  translate(-0.5*w, -0.5*h);

  fill(0);
  translate(0.5*w, 0.44*h);
  beginShape();
  vertex(0, -0.33*w);
  quadraticVertex(0.33*w, -0.33*w, 0.33*w, 0);
  quadraticVertex(0.33*w, 0.33*w, 0, 0.33*w);
  quadraticVertex(-0.33*w, 0.33*w, -0.33*w, 0);
  quadraticVertex(-0.33*w, -0.33*w, 0, -0.33*w);
  endShape();
  translate(-0.5*w, -0.44*h);

  fill(skin);
  noStroke();
  translate(0.5*w, 0.456*h);
  beginShape();
  vertex(0, -0.32*w);
  quadraticVertex(0.32*w, -0.32*w, 0.32*w, 0);
  quadraticVertex(0.32*w, 0.32*w, 0, 0.32*w);
  quadraticVertex(-0.32*w, 0.32*w, -0.32*w, 0);
  quadraticVertex(-0.32*w, -0.32*w, 0, -0.32*w);
  endShape();
}

void face() {
  noFill();
  stroke(0);
  strokeWeight(2.15);
  line(-0.2*w, -0.05*h, -0.08*w, -0.035*h);
  line(0.08*w, -0.035*h, 0.2*w, -0.05*h);
  strokeWeight(1.75);

  line(-0.01*w, 0.04*h, -0.02*w, 0.11*h);
  bezier(-0.02*w, 0.11*h, -0.013*w, 0.116*h, -0.016*w, 0.113*h, -0.01*w, 0.12*h);
  line(0.02*w, 0.12*h, 0.035*w, 0.12*h);

  bezier(-0.15*w, 0.1935*h, -0.13*w, 0.165*h, 0.13*w, 0.17*h, 0.12*w, 0.2*h);
  line(-0.13*w, 0.165*h, -0.11*w, 0.18*h);
  line(0.13*w, 0.17*h, 0.10*w, 0.185*h);

  //line(0.02*w, 0.21*h, 0.04*w, 0.24*h);
  //line(-0.03*w, 0.2*h, -0.04*w, 0.25*h);
  bezier(0.02*w, 0.21*h, 0.015*w, 0.215*h, 0.0375*w, 0.235*h, 0.0425*w, 0.24*h);
  bezier(-0.03*w, 0.2*h, -0.035*w, 0.19*h, -0.045*w, 0.24*h, -0.04*w, 0.25*h);

  strokeWeight(1.25);
  line(0.113*w, -0.027*h, 0.12*w, -0.015*h);
  line(0.155*w, -0.0345*h, 0.155*w, -0.015*h);
  line(0.215*w, -0.022*h, 0.2*w, -0.0055*h);

  line(-0.113*w, -0.027*h, -0.12*w, -0.015*h);
  line(-0.155*w, -0.0345*h, -0.155*w, -0.015*h);
  line(-0.215*w, -0.022*h, -0.2*w, -0.0055*h);
  strokeWeight(1.75);

  line(0.135*w, 0.11*h, 0.133*w, 0.13*h);
  line(0.18*w, 0.11*h, 0.185*w, 0.125*h);
  bezier(0.115*w, 0.115*h, 0.133*w, 0.125*h, 0.185*w, 0.12*h, 0.2*w, 0.11*h);

  ellipseMode(CENTER);
  fill(255);
  ellipse(-0.155*w, 0.035*h, 0.165*w, 0.165*w);
  ellipse(0.155*w, 0.035*h, 0.165*w, 0.165*w);
  noStroke();
  ellipse(-0.155*w, 0.035*h, 0.1675*w, 0.1616*w);
  ellipse(0.155*w, 0.035*h, 0.1675*w, 0.1616*w);
  fill(0);
  ellipse(-0.155*w, 0.035*h, 0.04*w, 0.04*w);
  ellipse(0.155*w, 0.035*h, 0.04*w, 0.04*w);

  translate(-0.5*w, -0.456*h);
}

void shirt() {
  translate(0, 0.015*h);
  stroke(0);
  fill(shirt);

  /*bezier(0.275*w, 0.81*h, 0.265*w, 0.85*h, 0.4*w, h, 0.4*w, h);
   bezier(0.125*w, 0.84*h, 0.075*w, 1.05*h, 0.05*w, h, 0.1*w, h);
   line(0.125*w, 0.84*h, 0.275*w, 0.81*h);
   line(0.4*w, h, 0.1*w, h);*/

  beginShape();
  vertex(0.275*w, 0.81*h);
  bezierVertex(0.265*w, 0.85*h, 0.4*w, h, 0.4*w, h);
  vertex(0.1*w, h);
  bezierVertex(0.05*w, h, 0.075*w, 1.05*h, 0.15*w, 0.84*h);
  bezierVertex(0.16*w, 0.81*h, 0.18*w, 0.82*h, 0.2*w, 0.82*h);
  bezierVertex(0.26*w, 0.82*h, 0.28*w, 0.79*h, 0.275*w, 0.81*h);
  endShape();

  translate(w, 0);
  scale(-1, 1);
  beginShape();
  vertex(0.275*w, 0.81*h);
  bezierVertex(0.265*w, 0.85*h, 0.4*w, h, 0.4*w, h);
  vertex(0.1*w, h);
  bezierVertex(0.05*w, h, 0.075*w, 1.05*h, 0.15*w, 0.84*h);
  bezierVertex(0.16*w, 0.81*h, 0.18*w, 0.82*h, 0.2*w, 0.82*h);
  bezierVertex(0.26*w, 0.82*h, 0.28*w, 0.79*h, 0.275*w, 0.81*h);
  endShape();
  translate(w, 0);
  scale(-1, 1);

  translate(0, -0.015*h);
}

//---- Esquematización de las nubes -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

void cloud(float x, float y, float w, float h) {  
  noStroke();
  fill(255);  
  ellipse(x, y, w, h);
  ellipse(x-0.25*w, y+0.25*h, w, h);
  ellipse(x+0.25*w, y+0.25*h, w, h);
}
