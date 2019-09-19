int stage = 0;

int speed = 6;
int health;
int lives;

PImage back; //background for title screen
PImage recipe;

//string variables to define the text file for instructions
String[] mission;
String[] instructions;

Boolean[][] controls = new Boolean[3][3];
Player user = new Player(100, 100);

ArrayList<guards> stillguards = new ArrayList<guards>();
ArrayList<Laserguards> shootingguards = new ArrayList<Laserguards>();
ArrayList<Laserguards>automatedguards = new ArrayList<Laserguards>();
ArrayList<MovingShooters> walkerguards = new ArrayList<MovingShooters>();

ArrayList<Beam>bullets = new ArrayList<Beam>();
ArrayList<blowUp>endgames = new ArrayList<blowUp>();

ArrayList<Integer>healthValues = new ArrayList<Integer>();


void setup () {
  size(1000, 700);

  back = loadImage("Start.png");
  recipe = loadImage("Rec.png");

  //loads the text file for instructions
  mission = loadStrings("Instructions.txt");

  //splits the lines in the instructions by a '/' in the text file
  for (int a = 0; a<mission.length; a++)
  {
    instructions = split(mission[a], '/');
  }

  for (int i = 0; i<20; i ++) {
    stillguards.add(new guards(random(80, width-80), random(80, height-80), 20));
  }

  for (int i = 0; i<20; i ++) {
    shootingguards.add(new Laserguards(random(80, width-80), random(80, height-80), 20));
  }
  
    automatedguards.add(new Laserguards(width-80, 80, 20));
    automatedguards.add(new Laserguards(width-80, height-80, 20));

  for (int i = 0; i<20; i ++) {
    walkerguards.add(new MovingShooters(random(80, width-80), random(80, height-80), 20));
  }

  for (int i = 0; i<3; i++) {
    for (int j = 0; j<3; j++) {
      controls[i][j] = false;
    }
  }
}

void draw() {
  levels();
  for(int i = 0; i<healthValues.size(); i++) {
    println(healthValues.get(i));
  }

  //text("Your speed is " + user.spX, width/2, 20);

}
