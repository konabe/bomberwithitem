class Player{
  
  //readable
  private Stage _stage;
    
  //state
  private int x;
  private int y;
  private int dir;
  
  private int _chance = 2;
  private int _muteki = 0;
  private int _range = 2;
  private int MAXRANGE = 10;
  
  private Item _item;
  
  //command
  private int _nextCommand = 0;  
  public final static int UP = 1;
  public final static int RIGHT = 2;
  public final static int DOWN = 3;
  public final static int LEFT = 4;
  
  Player(int x, int y, int dir, Stage stage){
    this.x = x;
    this.y = y;
    this.dir = dir;
    _stage = stage;
  }
  
  public void use(){
    _item.use();
    println(_range);
    _item = new Item(true);
  }
  
  public void setItem(Item item){
    if(item == null) return ;
    _item = item;
    _item.assignPlayer(this);
  }

  public void sendCommand(int command){
    _nextCommand = command;
    return;
  }
  
  public boolean suffer(){
    if(_chance != 0){
      _chance --;
      _muteki = 10;
      return true;
    }
    return false;
  }
  
  public void discreteMutekiCount(){
    if(_muteki != 0){
      _muteki --;
    }
  }
  
  public boolean muteki(){
    if(_muteki != 0){
      return true;
    }
    return false;
  }
  
  public void next(){
    if(_nextCommand == UP){
        if(_stage.isAgainst(getX(), getY() - 1, this)){
          return;
        }
        if(dir == UP){
          y--;
          return;
        }
        dir = UP;
        return;
    }
    if(_nextCommand == LEFT){
        if(_stage.isAgainst(getX() - 1, getY(), this)){
          return;
        }
        if(dir == LEFT){
          x--;
          return;
        }
        dir = LEFT;
        return;
    }
    if(_nextCommand == DOWN){
        if(_stage.isAgainst(getX(), getY() + 1, this)){
          return;
        }
        if(dir == DOWN){
          y++;
          return;
        }
        dir = DOWN;
        return;
    }
    if(_nextCommand == RIGHT){
        if(_stage.isAgainst(getX() + 1, getY(), this)){
          return;
        }
        if(dir == RIGHT){
          x++;
          return;
        }
        dir = RIGHT;
        return;
    }        
  }
  
  public void increaseRange(){
    if(_range < MAXRANGE){
      _range += 2;
    }
  }
  
  //getter
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public int getDir(){
    return dir;
  }
  public int getChance(){
    return _chance;
  }
  public int getRange(){
    return _range;
  }

}
    
