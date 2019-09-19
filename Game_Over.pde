void finish() {
  textSize(20);
  fill(0);
  text("HEALTH = " + health, width-150, 20);
  text("LIVES = " + lives, width-150, 50);

  if (health<=0) {
    user.x = 100;
    user.y = height/2;
    health=30;
    lives--;
  }

  if (lives <= 0) {
    stage = 0;
    
  }
  
  for (int i=0; i < bullets.size(); i++) {
    if (dist(bullets.get(i).x, bullets.get(i).y, user.x, user.y) < 50) {
      println("shot");
      health--;
    }
  }
}
