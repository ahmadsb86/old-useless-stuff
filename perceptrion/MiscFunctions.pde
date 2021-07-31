int sign(float num) {
  if (num >= 0) {
    return 1;
  }
  return 0;
}


void Draw() {
  textSize(16);
  textAlign(CENTER);
  rectMode(CENTER);

  fill(255);

  line(And.x, And.y, Not.x, Not.y);
  line(Or.x, Or.y, OutAnd.x, OutAnd.y);
  line(Not.x, Not.y, OutAnd.x, OutAnd.y);

  line(InO.x + 8, InO.y, And.x, And.y);
  line(InO.x + 8, InO.y, Or.x, Or.y);
  line(InT.x + 8, InT.y, And.x, And.y);
  line(InT.x + 8, InT.y, Or.x, Or.y);

  rect(Or.x, Or.y, 100, 50);
  rect(And.x, And.y, 100, 50);
  rect(Not.x, Not.y, 100, 50);
  rect(OutAnd.x, OutAnd.y, 100, 50);

  fill(0);

  text("OR", Or.x, Or.y+8);
  text("AND", And.x, And.y+8);
  text("NOT", Not.x, Not.y+8);
  text("AND", OutAnd.x, OutAnd.y+8);

  text("0", InO.x, InO.y + 6);
  text("1", InT.x, InT.y + 6);
}



void shade() {
  if (mouseButton == LEFT) {

    fill(0, 0, 255);

    if (mouseX > Not.x - 50 && mouseX < Not.x + 50 && mouseY > Not.y - 25 && mouseY < Not.y + 25) {
      NOT.train();
      rect(Not.x, Not.y, 100, 50);
      fill(0);
      text("NOT", Not.x, Not.y+8);
    }
    if (mouseX > And.x - 50 && mouseX < And.x + 50 && mouseY > And.y - 25 && mouseY < And.y + 25) {
      AND.train();
      rect(And.x, And.y, 100, 50);
      fill(0);
      text("AND", And.x, And.y+8);
    }
    if (mouseX > Or.x - 50 && mouseX < Or.x + 50 && mouseY > Or.y - 25 && mouseY < Or.y + 25) {
      OR.train();
      rect(Or.x, Or.y, 100, 50);
      fill(0);
      text("OR", Or.x, Or.y+8);
    }
    if (mouseX > OutAnd.x - 50 && mouseX < OutAnd.x + 50 && mouseY > OutAnd.y - 25 && mouseY < OutAnd.y + 25) {
      OUTAND.train();
      rect(OutAnd.x, OutAnd.y, 100, 50);
      fill(0);
      text("AND", OutAnd.x, OutAnd.y+8);
    }
  }
}




void click() {
  if (mouseX > Not.x - 50 && mouseX < Not.x + 50 && mouseY > Not.y - 25 && mouseY < Not.y + 25) {
    NOT.train();
  }
  if (mouseX > And.x - 50 && mouseX < And.x + 50 && mouseY > And.y - 25 && mouseY < And.y + 25) {
    AND.train();
  }
  if (mouseX > Or.x - 50 && mouseX < Or.x + 50 && mouseY > Or.y - 25 && mouseY < Or.y + 25) {
    OR.train();
  }
  if (mouseX > OutAnd.x - 50 && mouseX < OutAnd.x + 50 && mouseY > OutAnd.y - 25 && mouseY < OutAnd.y + 25) {
    OUTAND.train();
  }
}





void Text() {
  text(OR.guess(), Or.x, Or.y-30);
  text(AND.guess(), And.x, And.y-30);
  text(NOT.guess(), Not.x, Not.y-30);
  text(OUTAND.guess(), OutAnd.x, OutAnd.y-30);
}