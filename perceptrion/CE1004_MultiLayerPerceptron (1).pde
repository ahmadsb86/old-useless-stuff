//Code for a Perceptron 
//by Ahmad Bilal


import static javax.swing.JOptionPane.*;


float[] in = {0, 1};

void setup() {

  size(600, 600);

  AND.giveInput(in[0], in[1]);
  OR.giveInput(in[0], in[1]);
}
void draw() {

  background(175);

  Draw();

  NOT.giveInput(AND.guess(), 0);
  OUTAND.giveInput(NOT.guess(), OR.guess());

  Text();

  shade();
  
}

void mousePressed() {
  click();
}