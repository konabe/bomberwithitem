final int blockLength = 45;
final int mapRow = 15;
final int mapCol = 19;
final int infoBarHeight = 45;

int bombId = 0;

boolean w,a,s,d;
boolean b1, i1;
boolean up,left,down,right;
boolean b2, i2;

int win;

Map map;
Game game;
Stage stage;
Player p1;
Player p2;

int time = 0;

void setup()
{
  size(1280, 720);
  stage = new Stage(mapCol, mapRow);
  p1 = new Player(1,  1, 3, stage);
  p2 = new Player(17, 13, 1, stage); //(x, y, dir)
  map = new Map((width - blockLength * mapCol ) / 2 , infoBarHeight, stage, p1, p2);
  game = new Game(stage, p1, p2);
  win = 0;
}

void draw()
{
  if(true){
    if(win != 0){
      map.finish();
      return;
    }
    game.next(time);
    background(255);
    map.print();
    fill(0);
    text(time, 20, 20);
    text(p1.getChance(), 30, 30);
    text(p2.getChance(), width - 30, 30);

  }
  time ++;
}

void keyPressed() {
  switch(key) {
    case 'w':
      w = true;
      break;
    case 'a':
      a = true;
      break;
    case 's':
      s = true;
      break;
    case 'd':
      d = true;
      break;
    case 'z':
      b1 = true;
      break;
    case 'n':
      b2 = true;
      break;
    case 'x':
      i1 = true;
      break;
    case 'm':
      i2 = true;
      break;
  }
  switch(keyCode){
    case UP:
      up = true;
      break;
    case LEFT:
      left = true;
      break;
    case DOWN:
      down = true;
      break;
    case RIGHT:
      right = true;
      break;  
  }
}
