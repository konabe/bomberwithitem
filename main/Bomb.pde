class Bomb {
  private int x, y;
  private int _range = 2;
  
  private Stage _stage;
  
  private int count;
  private ArrayList<int []> brakingBlockList = new ArrayList<int []>();
  private ArrayList<int []> dangerList = new ArrayList<int []>();
 
  private int id = 0;

  Bomb(int x, int y, Stage stage, int range) {
    this.x = x;
    this.y = y;
    _range = range;
    _stage = stage;
    count = 15;
    initDanger();
 
    id = bombId++;
  }

  public int getId(){
    return id;
  }
  
  public boolean isNatural(){
    return 5 <= count;
  }
  public boolean isDangerTime(){
    return 0 <= count && count < 5;
  }
  public boolean isBrakingBlockTime(){
    return count <= -2 && -5 < count;
  }
  public boolean isFireTime(){
    return -2 <= count && count < 0;
  }
  public boolean isSafeTime(){
    return -5 <= count && count < -2;
  }
  public boolean isRemoveTime(){
    return count < -5;
  }
    
  public void yuubaku(){
    count = 0;
  }

  private void initDanger() {
     addDanger(x, y);
    for (int i = 1; i <= _range; i++) {
      if (_stage.get(x + i, y) == Stage.BLOCK){
        int [] c = {x + i, y};
        brakingBlockList.add(c);
        break;
      }
      if (_stage.isAgainst(x + i, y)) {
        break;
      }
      addDanger(x + i, y);
    }
    for (int i = -1; i >= -_range; i--) {
      if (_stage.get(x + i, y) == Stage.BLOCK){
        int [] c = {x + i, y};
        brakingBlockList.add(c);
        break;
      }
      if (_stage.isAgainst(x + i, y)) {
        break;
      }
      addDanger(x + i, y);
    }
    for (int j = 1; j <= _range; j++) {
      if (_stage.get(x, y + j) == Stage.BLOCK){
        int [] c = {x, y + j};
        brakingBlockList.add(c);break;
      }
      if (_stage.isAgainst(x, y + j)) {
        break;
      }
      addDanger(x, y + j);
    }
    for (int j = -1; j >= -_range; j--) {
      if (_stage.get(x, y + j) == Stage.BLOCK){
        int [] c = {x, y + j};
        brakingBlockList.add(c);
        break;
      }
      if (_stage.isAgainst(x, y + j)) {
        break;
      }
      addDanger(x, y + j);
    }
  }

  private void addDanger(int x, int y) {
    int [] coordinate = {x, y};
    dangerList.add(coordinate);
  }
  
  public void count(){
    count--;
  }
  
  //getter 
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getCount() {
    return count;
  }
  public ArrayList<int []> getBrakingBlockList(){
    return brakingBlockList;
  }
  public ArrayList<int []> getDangerList() {
    return dangerList;
  } 
}
