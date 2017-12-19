class Game {

  private Player _p1;
  private Player _p2;

  private Stage _stage;
  private ArrayList<Bomb> bombList = new ArrayList<Bomb>();
  private ArrayList<Bomb> removeBombList = new ArrayList<Bomb>();

  Game(Stage stage, Player p1, Player p2) {
    _stage = stage;
    _p1 = p1;
    _p2 = p2;
  }

  public void next(int time) {

    if (w) _p1.sendCommand(Player.UP);
    if (a) _p1.sendCommand(Player.LEFT);
    if (s) _p1.sendCommand(Player.DOWN);
    if (d) _p1.sendCommand(Player.RIGHT);

    if (up)    _p2.sendCommand(Player.UP);
    if (left)  _p2.sendCommand(Player.LEFT);
    if (down)  _p2.sendCommand(Player.DOWN);
    if (right) _p2.sendCommand(Player.RIGHT);

    if (time % 10 != 0) return;
    
    p1.discreteMutekiCount();
    p2.discreteMutekiCount();
    
    if (w || a || s || d)  _p1.next();
    if (up || left || down || right)  _p2.next();

    if (b1)  setBomb(new Bomb(_p1.getX(), _p1.getY(), _stage, _p1.getRange() ));
    if (b2)  setBomb(new Bomb(_p2.getX(), _p2.getY(), _stage, _p2.getRange() ));

    if (i1){
      println("tuka");
      _p1.use();
    }
    if (i2)  _p2.use();

    for (Bomb bomb : bombList) {
      bomb.count();
      if (bomb.isRemoveTime()) {
        removeBombList.add(bomb);
      }
    }
    for (Bomb rBomb : removeBombList) {
      bombList.remove(rBomb);
    }
    _stage.setDanger(bombList);

    judge();
    
    w = a = s = d = false;
    up = left = down = right = false;
    b1 = b2 = false;
    i1 = i2 = false;

    return;
  }
  
  public void judge(){
    
    if(_stage.getItem(p1.getX(), p1.getY()).getKind() != 0){
      p1.setItem(_stage.getItem(p1.getX(), p1.getY() ));
      _stage.removeItem(p1.getX(), p1.getY());
    }
    if(_stage.getItem(p2.getX(), p2.getY()).getKind() != 0){
      p2.setItem(_stage.getItem(p2.getX(), p2.getY() ));
      _stage.removeItem(p2.getX(), p2.getY());
    }
    
    for(Bomb bomb : bombList){
      for(int [] xy : bomb.getDangerList()){
        for(Bomb bombOther : bombList){
          if(bomb == bombOther) continue;
          if(xy[0] == bombOther.getX() && xy[1] == bombOther.getY() && bomb.isFireTime()){
            bombOther.yuubaku();
          }
        }
      }
      if(bomb.isBrakingBlockTime()){
        for(int [] xy : bomb.getBrakingBlockList()){
          _stage.set(xy[0], xy[1], Stage.NONE); 
        }
      }
      if(bomb.isFireTime()){
        for(int [] xy : bomb.getDangerList()){
          if(!p1.muteki() && xy[0] == p1.getX() && xy[1] == p1.getY()){
            background(0);
            p1.suffer();
            return;
          }
          if(!p2.muteki() && xy[0] == p2.getX() && xy[1] == p2.getY()){
            background(255);
            p2.suffer();
            return;
          }
        }
      }
      

      
      if(p1.getChance() == 0){
        win = 2;
      }
      if(p2.getChance() == 0){
        win = 1;
      }
    }
  }

  void setBomb(Bomb newBomb) {
    for(Bomb bomb : bombList){
      if(bomb.getX() == newBomb.getX() && bomb.getY() == newBomb.getY()){
        return;
      }
    }
    println("bomb");
    bombList.add(newBomb);
  }
}
