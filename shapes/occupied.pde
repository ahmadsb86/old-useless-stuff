boolean occupied(Team t, PVector loc) {
  for (Shape o : t.shapes) {
    if (o.loc.equals(loc)) {
      return true;
    }
  }
  for (Barrier b : barriers) {
    if (loc.equals(b.loc)) {
      return true;
    }
  }
  for (Printer p : printers) {
    if (loc.equals(p.loc)) {
      return true;
    }
  }

  //start of g & l calc

  for (Generator g : t.generators) {

    if (loc.equals(g.loc)) {
      return true;
    }

    //right of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y)) {
      return true;
    }

    //down of g
    if ((loc.x == g.loc.x && loc.y == g.loc.y + blockSize) || (loc.x == t.l.loc.x && loc.y == t.l.loc.y + blockSize)) {
      return true;
    }

    //diagnal of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y + blockSize) || (loc.x == t.l.loc.x + blockSize && loc.y == t.l.loc.y + blockSize)) {
      return true;
    }
  }
  
  
  if(loc.equals(t.l.loc)){
    return true;
  }
  if(loc.x == t.l.loc.x + blockSize && loc.y == t.l.loc.y){
    return true;
  }
  if(loc.x == t.l.loc.x && loc.y == t.l.loc.y + blockSize){
    return true;
  }
  if(loc.x == t.l.loc.x + blockSize && loc.y == t.l.loc.y + blockSize){
    return true;
  }
   


  return false;
}
