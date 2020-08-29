class Laserguards extends guards {
  int timer;
  Laserguards(float a, float b, float c) {
    super(a, b, c);
    this.timer = 2;
  }

  void shoot() {
    if (keyPressed == true && keyCode == SHIFT) {
      timer--;
    }
    if (this.timer<0) {
      this.timer = 2;
      bullets.add(new Beam(this.x, this.y, user.x, user.y));
    }
  }
  
  void autoshoot() {
       if (random(100)>90) {
      timer--;
    }
    if (this.timer<0) {
      this.timer = 5;
      bullets.add(new Beam(this.x, this.y, user.x, user.y));
    }    
  }
  
  
}

//funvtion between user and light, run 4 times aong with distance
