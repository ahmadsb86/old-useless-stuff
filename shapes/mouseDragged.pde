Boolean z = false;



void keyReleased() {
  if (key == 'z') {
    if (z == false) {
      z = true;
    } else {
      z = false;
      offset.set(-size.x/2, -size.y/2);
      poffset.set(0, 0);
      zoom = 1;
      
    }
  }
}

void mouseWheel(MouseEvent e) {
  if (z) {
    if (e.getCount() > 0) {
      zoom += 0.1;
    } else if (e.getCount() < 0) {
      zoom -= 0.1;
    }
    zoom = constrain(zoom, 0, 100);
  }
}

// Store the mouse and the previous offset
void mousePressed() {
  if (z) {
    mouse = new PVector(mouseX, mouseY);
    poffset.set(offset);
  }
}

// Calculate the new offset based on change in mouse vs. previous offsey
void mouseDragged() {
  if (z) {
    offset.x = mouseX - mouse.x + poffset.x;
    offset.y = mouseY - mouse.y + poffset.y;
  }
}
