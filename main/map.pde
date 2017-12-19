
class Map{ 
  int w = blockLength * mapCol;
  int h = blockLength * mapRow; //map width, map height;
  int xPos, yPos; //abusolute coordinates
  
  Stage stage;
  Player p1;
  Player p2;
  
  Map(int x, int y, Stage stage, Player p1, Player p2){
    xPos = x;
    yPos = y;
    this.stage = stage;
    this.p1 = p1;
    this.p2 = p2;
  }
  
  
  //***********************
  PImage NONE = loadImage("NONE.png");
  PImage WALL = loadImage("WALL.png");
  PImage PILLAR = loadImage("PILLAR.png");
  PImage BLOCK = loadImage("BLOCK.png");
  PImage BOMB = loadImage("BOMB.png");
  PImage DANBOMB = loadImage("DANBOMB.png");
  PImage DANGER = loadImage("DANGER.png");
  PImage ITEM = loadImage("ITEM.png");
  
  //player1
  PImage p1UP = loadImage("p1UP.png");
  PImage p1RIGHT = loadImage("p1RIGHT.png");
  PImage p1DOWN = loadImage("p1DOWN.png");
  PImage p1LEFT = loadImage("p1LEFT.png");
  PImage p1DEATH = loadImage("p1DEATH.png");
  
  //player2
  PImage p2UP = loadImage("p2UP.png");
  PImage p2RIGHT = loadImage("p2RIGHT.png");
  PImage p2DOWN = loadImage("p2DOWN.png");
  PImage p2LEFT = loadImage("p2LEFT.png");
  PImage p2DEATH = loadImage("p2DEATH.png");

  public void finish(){
    textSize(40);
    //background(255);
     if(win == 1){
       text("1P Win", 10, 10);
     }
     if(win == 0){
       text("2P Win", 10, 10);     
     }
  }
  
  void showTitle(){
    
    
  }
  
  void print(){
    rect(xPos, yPos, w, h);
    for(int i = 0; i < mapCol; i++){
      for(int j = 0;  j < mapRow; j++){
        if(stage.getName(i, j)=="NONE")
          if(stage.getItem(i, j).getKind() == 0){
            image(NONE, xPos + blockLength * i, yPos + blockLength * j);
          }else{
            image(ITEM, xPos + blockLength * i, yPos + blockLength * j);
          }
        else if(stage.getName(i, j)=="WALL")
          image(WALL, xPos + blockLength * i, yPos + blockLength * j);
        else if(stage.getName(i, j)=="PILLAR")
          image(PILLAR, xPos + blockLength * i, yPos + blockLength * j);
        else if(stage.getName(i, j)=="BLOCK")
          image(BLOCK, xPos + blockLength * i, yPos + blockLength * j);
        else if(stage.getName(i, j)=="BOMB")
          image(BOMB, xPos + blockLength * i, yPos + blockLength * j);
        else if(stage.getName(i, j)=="DANGER")
          image(DANGER, xPos + blockLength * i, yPos + blockLength * j);
        else if(stage.getName(i, j)=="DANBOMB")
          image(DANBOMB, xPos + blockLength * i, yPos + blockLength * j);
      
        if(i == p1.getX() && j == p1.getY()){
          switch(p1.dir)
          {
            case 1:
            image(p1UP, xPos + blockLength * i, yPos + blockLength * j);
            break;
            case 2:
            image(p1RIGHT, xPos + blockLength * i, yPos + blockLength * j);
            break;
            case 3:
            image(p1DOWN, xPos + blockLength * i, yPos + blockLength * j);
            break;
            case 4:
            image(p1LEFT, xPos + blockLength * i, yPos + blockLength * j);
            break;
            
          }
          if(p1.muteki()==true)
            image(p1DEATH, xPos + blockLength * i, yPos + blockLength * j);
        }
        if(i == p2.getX() && j == p2.getY()){
          switch(p2.dir)
          {
            case 1:
            image(p2UP, xPos + blockLength * i, yPos + blockLength * j);
            break;
            case 2:
            image(p2RIGHT, xPos + blockLength * i, yPos + blockLength * j);
            break;
            case 3:
            image(p2DOWN, xPos + blockLength * i, yPos + blockLength * j);
            break;
            case 4:
            image(p2LEFT, xPos + blockLength * i, yPos + blockLength * j);
            break;
          }
          if(p2.muteki()==true)
            image(p2DEATH, xPos + blockLength * i, yPos + blockLength * j);
            
            
        }
      }
    }
  }
  
}
    
