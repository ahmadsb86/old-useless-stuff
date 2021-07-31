class boost{
  int type = -1;
  data d = new data();
  boost(int type_){
    type = type_;
    if(type == 1){
      d.setp(blockSize,0,0,0,0,0,0,0);
    }
    if(type == 2){
      d.setp(0,blockSize,0,0,0,0,0,0);
    }
    if(type == 3){
      d.setp(0,0,0,15,0,0,0,0);
    }
    if(type == 4){
      d.setp(0,0,0,0,15,25,15,15);
    }
    
    if(type == 5){
      d.setp(blockSize*2,0,0,0,0,0,0,0);
    }
    if(type == 6){
      d.setp(0,blockSize*2,0,0,0,0,0,0);
    }
    if(type == 7){
      d.setp(0,0,0,25,0,0,0,0);
    }
    if(type == 8){
      d.setp(0,0,0,0,25,35,25,25);
    }
    
    
    if(type == 9){
      d.setp(blockSize*3,0,0,0,0,0,0,0);
    }
    if(type == 10){
      d.setp(0,blockSize*3,0,0,0,0,0,0);
    }
    if(type == 11){
      d.setp(0,0,0,35,0,0,0,0);
    }
    if(type == 12){
      d.setp(0,0,0,0,35,45,35,35);
    }
    
    if(type == 13){
      d.setp(blockSize*4,0,0,0,0,0,0,0);
    }
    if(type == 14){
      d.setp(0,blockSize*4,0,0,0,0,0,0);
    }
    if(type == 15){
      d.setp(0,0,0,50,0,0,0,0);
    }
    if(type == 16){
      d.setp(0,0,0,0,60,70,60,60);
    }
  }
}
