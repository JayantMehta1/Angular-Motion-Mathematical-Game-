class Player {
  float x, y, spX, spY;
  int timer;

  Player(float a, float b) {
    this.x = a;
    this.y = b;
    this.spX = 3;
    this.spY = 3;
    this.timer = 2;
  }

  void spawn() {
    fill(0, 0, 255);
    rect(this.x, this.y, 20, 20);
  }
  void boundaries() {
    if (this.x+20>width || this.x<0 || this.y+20>height || this.y<0) {
      this.x = 100;
      this.y = height/2;
    }
  }
  
  void shoot() {
    if (keyPressed == true && keyCode == SHIFT) {
      timer--;
    }
    if (this.timer<0) {
      this.timer = 2;
      bullets.add(new Beam(this.x, this.y, mouseX, mouseY));
    }
  }
}
