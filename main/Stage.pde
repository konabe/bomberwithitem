
class Stage{
   private int _stageWidth;
   private int _stageHeight;
   
   public final static int NONE = 0;
   public final static int WALL = 1;
   public final static int PILLAR = 2;
   public final static int BLOCK = 3;
   public final static int DANGER = 4;
   public final static int BOMB = 5;
   public final static int DANBOMB = 6;
   
   
   private int [][] _stage;
   private Item [][] _items;
   
   Stage(int x, int y){
     _stageWidth = x;
     _stageHeight = y;
     _stage = new int [x][y];
     _items = new Item[x][y];
     init();
   }

   public boolean isAgainst(int x, int y, Player me){
     if(me == p1 && x == p2.getX()&& y == p2.getY()) return true;
     if(me == p2 && x == p1.getX()&& y == p1.getY()) return true;
     return isAgainst(x, y);
   }
   
   public boolean isAgainst(int x, int y){
     if(get(x, y) == NONE || get(x,y) == DANGER) return false;
     return true;
   }
   
   public void setDanger(ArrayList<Bomb> list){
      for(Bomb bomb : list){
        if(bomb.isNatural()){
          set(bomb.getX(), bomb.getY(), BOMB);
        }else if(bomb.isDangerTime()){
          set(bomb.getX(), bomb.getY(), DANBOMB);
        }else if(bomb.isFireTime()){
          set(bomb.getX(), bomb.getY(), DANGER);
          setDanger(bomb);
        }else if(bomb.isSafeTime()){
          set(bomb.getX(), bomb.getY(), NONE);
          removeDanger(bomb);
        } 
      }
   }
   
   private void setDanger(Bomb bomb){
     for(int [] c : bomb.getDangerList()){
       set(c[0],c[1],DANGER);
     }
   }
   
   private void removeDanger(Bomb bomb){
     for(int [] c : bomb.getDangerList()){
       set(c[0], c[1], NONE);
     }
     
   }
   
   // ----
   private void init(){
     
     for(int i = 0; i < _stageWidth; i++){
       for(int j = 0; j < _stageHeight; j++){
         _items[i][j] = new Item(true);
         _stage[i][j] = NONE;
         
         //wall condition
         if(i == 0 || i == _stageWidth - 1){
           _stage[i][j] = WALL;
           continue;
         }
         if(j == 0 || j == _stageHeight - 1){
           _stage[i][j] = WALL;
           continue;
         }
         
         //pillar condition
         if(i % 2 == 0 && j % 2 == 0){
           _stage[i][j] = PILLAR;
           continue;
         }
       }
     }
     for(int i = 0; i < _stageWidth; i++){
       for(int j = 0; j < _stageHeight; j++){
         if(get(i,j) == NONE && Math.random() < 0.5){
           if(i == 1 && j == 1) continue;
           if(i == 2 && j == 1) continue;
           if(i == 1 && j == 2) continue;
           if(i == _stageWidth - 2 && j == _stageHeight - 2) continue;
           if(i == _stageWidth - 2 && j == _stageHeight - 3) continue;
           if(i == _stageWidth - 3 && j == _stageHeight - 2) continue;
           if(Math.random() < 0.2) _items[i][j] = new Item();
           set(i,j,BLOCK);
         }
       }
     }
     
     return;
   }
   
   public int get(int x, int y){
     return _stage[x][y];
   }
   public String getName(int x, int y){
     if(get(x,y) == NONE) return "NONE";
     if(get(x,y) == WALL) return "WALL";
     if(get(x,y) == PILLAR) return "PILLAR";
     if(get(x,y) == BLOCK) return "BLOCK";
     if(get(x,y) == BOMB) return "BOMB";
     if(get(x,y) == DANGER) return "DANGER";
     if(get(x,y) == DANBOMB) return "DANBOMB";
     
     return "NULL" ;
   }
   
   public Item getItem(int x, int y){
     if(_items[x][y] != null){
       return _items[x][y];
     }
     return null;
   }
   
   public void removeItem(int x, int y){
     _items[x][y] = new Item(true);
   }
   
   public void set(int x, int y, int s){
     _stage[x][y] = s;
   }
}
