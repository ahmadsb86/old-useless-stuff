class Barrier{
  PVector loc = new PVector();
  Barrier(float x, float y){
    loc.set(x,y);
  }
  void display(){
    fill(brown);
    rect(loc.x,loc.y, blockSize - blockOff, blockSize - blockOff,5);
  }
}
