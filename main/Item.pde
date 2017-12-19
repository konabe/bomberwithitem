class Item{
  
  private Player _p;
  
  private int count = 30;
  
  private int kind = 0;
  public final static int STAR = 1;
  public final static int FLOWER = 2;
  
  public Item(){
    kind = FLOWER; 
  }
  
  public Item(boolean zero){
    kind = 0;
  }
  
  public void assignPlayer(Player p){
    _p = p;
  }
  
  public void count(){
    if(count > 0){
      count --;
    }
  }
  
  public void use(){
    println("use");
    if(kind == STAR){
      return;
    }
    if(kind == FLOWER){
      println("increase");
      _p.increaseRange();
      return;
    }
  }
  
  public int getKind(){
    return kind;
  }
  
}
  
  
