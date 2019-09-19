class MovingShooters extends Laserguards {
  float spX;
  float spY;

  MovingShooters(float a, float b, float c) {
    super(a, b, c);
    this.spX = floor(random(3)) + 1;
    this.spY = floor(random(3)) + 1;
  }

  void walk() {
    this.x += this.spX;
    this.y += this.spY;

    if (this.x<=50 || this.x>=width-50) {
      this.spX *= -1;
    }

    if (this.y<=50 || this.y>=height-50) {
      this.spY *= -1;
    }
  }
}
