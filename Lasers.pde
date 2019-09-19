class Beam {

  float x, y, speedX, speedY;
  float deltaX;
  float deltaY;
  float hyp;
  float targX, targY;
  Beam(float x1, float y1, float x2, float y2) {

    this.x = x1;
    this.y = y1;

    this.deltaX = x2-x1;
    this.deltaY = y2-y1;

    this.hyp = dist(x1, y1, x2, y2);

    this.speedX = speed * (this.deltaX/this.hyp);
    this.speedY = speed * (this.deltaY/this.hyp);

    this.targX = x2;
    this.targY = y2;
  }

  void make() {

    stroke(0, 255, 0);
    strokeWeight(2);
    line(this.x, this.y, this.x + this.speedX, this.y + this.speedY);
    noStroke();
  }

  void move() {
    this.x += this.speedX;
    this.y += this.speedY;
  }

  void removals() {
    for (int i=0; i < bullets.size(); i++) {
      if (bullets.get(i).x < 0 || bullets.get(i).x > width || bullets.get(i).y < 0 || bullets.get(i).y > height) {
        bullets.remove(i);
        i--;
      } else if (dist(bullets.get(i).x, bullets.get(i).y, targX, targY) < 30) {
        bullets.remove(i);
        i--;

        for (int j = 0; j<3; j ++) {
          endgames.add(new blowUp(targX, targY));
        }
      }
    }
  }
}


class blowUp {
  float x, y;
  int r, g, b;
  float spX, spY;
  int counter;

  blowUp(float takeX, float takeY) {
    this.x = takeX;
    this.y = takeY;
    this.r = floor(random(255));
    this.g = floor(random(255));
    this.b = floor(random(255));
    this.spX = random(-5, 5) + 1;
    this.spY = random(-5, 5) + 1;
    counter = 20;
  }

  void process() {
    fill(r, g, b);
    ellipse(this.x, this.y, 10, 10);

    this.x += spX;
    this.y += spY;
  }

  void checkTime () {
    if (keyPressed && keyCode == CONTROL) {
      counter--;
      if (this.counter<0) {
        for (int i = 0; i<endgames.size(); i ++) {
          endgames.remove(i); 
          i--;
          counter = 20;
        }
      }
    }
  }
}
