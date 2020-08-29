void levels() {
  if (stage == 0) //title screen
  {
    lives = 3; //the user has 3 lives when the game starts
    health = 30;

    image(back, 0, 0, width, height); //uses the background image
    fill(255, 255, 0); //blue text
    textSize(50); //size 50
    textAlign(CENTER); //centers the title
    text("R-R-RUN ESCAPE ROOM!!!!", width/2, height/2); //the name of the game

    textSize(15); // textsize of 15
    fill(0, 255, 0); // green fill colour
    text("Press any key to begin the game", 125, 30); //tells the user to press Shift in order to continue to the game

    fill(0); //back fill colour
    rect(75, height-125, 150, 50); //creates a little rectangle for instructions
    fill(255); // white fill colour
    textSize(25); //text size of 25
    text("Instructions", 150, height-100); //gives a title of instructions

    if (keyPressed) {
      stage = 1;
    }
  }

  if (stage == 1) //instructions
  {
    textSize(15);
    background(0, 0, 255); //blue background
    fill(255, 0, 0); //red fill colour
    textAlign(CENTER);

    textSize(20);
    fill(0, 255, 0); //green fill colour
    text("Press any key to continue", 125, 30);

    //allows the user to continue to the first level from the instructions menu
    if (keyPressed)
    {
      stage = 2;
    }

    //displays the text from the text file that provides instructions to the player
    for (int b = 0; b<instructions.length; b++)
    {
      text(instructions[b], width/2, height/12+b*60);
    }
  }


  if (stage == 2) //first level of the game
  {
    fill(255); //creates a cyan type background
    rect(0, 0, width, height);

    user.spawn();
    user.boundaries();
    panel();
    finish();

    for (int i = 0; i<stillguards.size(); i++) {   
      stillguards.get(i).spawn();
      stillguards.get(i).flashlights();
    }

    for (int i = 0; i<bullets.size(); i++) {
      bullets.get(i).make();
      bullets.get(i).move();
      bullets.get(i).removals();
    }

    for (int s = 0; s<endgames.size(); s++) {
      endgames.get(s).process();
      endgames.get(s).checkTime();
    }

    if (user.x+20>width) //allows the user to continue to the next level
    {
      healthValues.add(health);
      stage = 3;
      user.x = 100; //resets James's x position before moving to the next level
      user.y = height/2; //resets James's y position before moving to the next level
    }
  }


  if (stage == 3) //the second level
  {
    //light blue background
    fill(0, 200, 0, 100);
    rect(0, 0, width, height);

    user.spawn();
    user.boundaries();
    //user.shoot();
    panel();
    finish();

    for (int i = 0; i<shootingguards.size(); i++) {   
      shootingguards.get(i).spawn();
      shootingguards.get(i).flashlights();
      shootingguards.get(i).shoot();
    }

    for (int i = 0; i<automatedguards.size(); i++) {   
      automatedguards.get(i).spawn();
      automatedguards.get(i).autoshoot();
    }

    for (int i = 0; i<bullets.size(); i++) {
      bullets.get(i).make();
      bullets.get(i).move();
      bullets.get(i).removals();
    }

    for (int s = 0; s<endgames.size(); s++) {
      endgames.get(s).process();
      endgames.get(s).checkTime();
    }

    if (user.x+20>width) //allows the user to continue to the next level
    {
      healthValues.add(health);
      stage = 4;
      user.x = 100; //resets James's x position before moving to the next level
      user.y = height/2; //resets James's y position before moving to the next level
    }
  }


  if (stage == 4) //third level
  {
    //light blue background
    fill(0, 100, 100, 100);
    rect(0, 0, width, height);

    user.spawn();
    user.boundaries();
    //user.shoot();
    panel();
    finish();

    for (int i = 0; i<walkerguards.size(); i++) {   
      walkerguards.get(i).spawn();
      walkerguards.get(i).flashlights();
      walkerguards.get(i).shoot();
      walkerguards.get(i).walk();
    }

    for (int i = 0; i<automatedguards.size(); i++) {   
      automatedguards.get(i).spawn();
      automatedguards.get(i).autoshoot();
    }


    for (int i = 0; i<bullets.size(); i++) {
      bullets.get(i).make();
      bullets.get(i).move();
      bullets.get(i).removals();
    }

    for (int s = 0; s<endgames.size(); s++) {
      endgames.get(s).process();
      endgames.get(s).checkTime();
    }

    if (user.x+20>width) //allows the user to continue to the next level
    {
      healthValues.add(health);
      stage = 5;
      user.x = 100; //resets James's x position before moving to the next level
      user.y = height/2; //resets James's y position before moving to the next level
    }
  }

  if (stage == 5) {

    //random generator
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(255);

    background(0);
    image(recipe, 0, 0, width, height); //uses the coffee image as a background for the screen

    fill(r, g, b, a); //uses random colours to fill a text
    textAlign(CENTER);
    textSize(25);

    //text to say the user won the game
    text("Congratulations!! Now, it is time to relax!", width-320, 60);
    text("Enjoy your Coffee!", width-320, 90);

    calc(healthValues);
    fill(255);
    text("Below are your health values from greatest to least", width/2, height-175);
    text(healthValues.get(0), width/2, height-100);
    text(healthValues.get(1), width/2, height-125);
    text(healthValues.get(2), width/2, height-150);


    if (mousePressed) {
      stage = 0;
    }
  }
}




void keyPressed() {
  if (keyCode == UP) {
    controls[0][1] = true;
  }
  if (keyCode == DOWN) {
    controls[2][1] = true;
  }
  if (keyCode == RIGHT) {
    controls[1][2] = true;
  }
  if (keyCode == LEFT) {
    controls[1][0] = true;
  }

  if (key == '0')
  {
    stage = 0;
  }
  if (key == '1')
  {
    stage = 1;
  }
  if (key == '2')
  {
    stage = 2;
  }
  if (key == '3')
  {
    stage = 3;
  }
  if (key == '4')
  {
    stage = 4;
  }
    if (key == '5')
  {
    stage = 5;
  }

  if (key == 'w') {
    user.spX+= 1;
    user.spY+= 1;
  }

  if (key == 's') {
    user.spX-= 1;
    user.spY-= 1;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    controls[0][1] = false;
  }
  if (keyCode == DOWN) {
    controls[2][1] = false;
  }
  if (keyCode == RIGHT) {
    controls[1][2] = false;
  }
  if (keyCode == LEFT) {
    controls[1][0] = false;
  }
}

void mousePressed() {
  //specifies where the mouse must be clicked in order to open the instructions
  if (stage == 0 && mouseX>75 && mouseX<225 && mouseY>height-125 && mouseY<height-75)
  {
    stage = 1;
  }
}

void panel() {
  if (controls[0][1] == true) {
    user.y -= user.spY;
  }
  if (controls[2][1] == true) {
    user.y += user.spY;
  }
  if (controls[1][2] == true) {
    user.x += user.spX;
  }
  if (controls[1][0] == true) {
    user.x -= user.spY;
  }
}
