class guards {
  float x, y, w;
  float finish;
  float myangle;

  guards(float a, float b, float c) {
    this.x = a;
    this.y = b;
    this.w = c;
    this.finish = PI + QUARTER_PI;
    this.myangle = 0;
  }

  void spawn() {
    fill(0);
    rect(this.x, this.y, this.w, this.w);
  }

  void flashlights() {
    fill(255, 0, 0);
    arc(this.x + 10, this.y + 10, 130, 130, this.finish-QUARTER_PI, this.finish);

    this.myangle = (atan2(user.y+10-this.y+10, user.x+10-this.x+10)) - 0.066;

    if (this.myangle<=0) {
      this.myangle += TWO_PI;
    }

    //line(user.x+10, user.y+10, this.x+10, this.y+10);

    //line(this.x+10, this.y+10, this.x+60, this.y+10);
    //line(this.x+10, this.y+10, this.x-60, this.y+10);
    //line(this.x+10, this.y+10, this.x+10, this.y+60);
    //line(this.x+10, this.y+10, this.x+10, this.y-60);

    if (this.finish-QUARTER_PI>=QUARTER_PI && this.finish<TWO_PI) {

      if (this.myangle >this.finish-QUARTER_PI && this.myangle<this.finish && dist(user.x+10, user.y+10, this.x+10, this.y+10)<=80)
      {
        health--;
        fill(0, 0, 200, 100);
        rect(0, 0, width, height);
      }
    } else if (this.finish>= 0 && this.finish<QUARTER_PI) {

      if (this.myangle < this.finish && this.myangle > ((this.finish-QUARTER_PI) -TWO_PI) && dist(user.x+10, user.y+10, this.x+10, this.y+10)<=80)
      {
        health--;
        fill(0, 0, 200, 100);
        rect(0, 0, width, height);
      }
    }
    //textSize(10);
    //text(this.finish-QUARTER_PI, this.x+25, this.y-70, 20);
    //text(this.myangle, this.x+25, this.y-60, 20);
    //text(this.finish, this.x+25, this.y-50, 20);

    this.finish+= 0.01;

    if (this.finish>=TWO_PI) {
      this.finish-= TWO_PI;
    }
  }
}
