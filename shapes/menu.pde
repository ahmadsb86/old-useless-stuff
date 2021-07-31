class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  PVector input = new PVector(0, 0);

  Mover(int x, int y) {
    input.set(x, y);
    mass = 1;
    location = new PVector(input.x, 100);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void display() {
    PVector button = new PVector(location.x, location.y);
    PVector cancel = new PVector(location.x, location.y);


    //create
    fill(200);
    noStroke(); 

    if (input.x == int(size.x/2)) {
      if (overCircle(button.x, button.y, 50)) {
        if (mousePressed) {
          start = false;
        } else {
          fill(back);
        }
      }

      ellipse(button.x, button.y, 50, 50);
      fill(0);
      stroke(0);
      line(button.x - 5, button.y - 10, button.x + 5, button.y);
      line(button.x - 5, button.y + 10, button.x + 5, button.y);
      noStroke();
      fill(255);
    }

    if (input.x == int(size.x/2 + 75)) {
      if (overCircle(button.x, button.y, 50)) {
        if (mousePressed) {
          exit();
        } else {
          fill(back);
        }
      }

      ellipse(cancel.x, cancel.y, 50, 50);
      fill(0);
      stroke(0);
      line(cancel.x - 8, cancel.y - 8, cancel.x + 8, cancel.y + 8);
      line(cancel.x - 8, cancel.y + 8, cancel.x + 8, cancel.y - 8);
      noStroke();
    }
    
    
    if (input.x == int(size.x/2 - 75)) {
      if (overCircle(button.x, button.y, 50)) {
        if (mousePressed) {
          link("https://savekashmir.wixsite.com/savekashmir");
        } else {
          fill(back);
        }
      }

      ellipse(cancel.x, cancel.y, 50, 50);
      fill(0);
      stroke(0);
      line(cancel.x, cancel.y - 8, cancel.x, cancel.y + 2);
      ellipse(cancel.x,cancel.y + 10,2,2);
      noStroke();
    }
    
    
    
  }


  void checkEdges() {

    if (location.y > height - input.y) {
      velocity.y *= -1;
      velocity.y += 2;
      location.y = height - input.y;
    }
  }
}
