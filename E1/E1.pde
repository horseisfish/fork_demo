boolean[][] grid ;

// Number of columns and rows in the grid
int cols = 10 ;
int rows = 10 ;
int cellWidth = 0 ; 
int cellHeight = 0 ;

PImage win;
final int GAME_RUN=0,GAME_WIN=1;
int gameState=0;

// The grid status color
color turnOnColor = #F0F5FB ;
color turnOffColor = #022547 ;


void setup() {
  size(400,400) ;
  stroke(#95A5B5);
  cellWidth = width / cols  ;
  cellHeight = height / rows ; 
  grid = new boolean[cols][rows] ;
  win=loadImage("win.jpg");
  int area = 1;
  // Part II: Initialization
  for(int i=0;i<3;i++){
    int randomcollast = 0;
    int randomcol = 0;
    int randomrowlast = 0;
    int randomrow=0;

    for(int j=0;j<2;j++){
      do {randomcol = floor(random(3));}
      while(randomcol == randomcollast);
      do {randomrow = floor(random(9));}
      while(randomrow == randomrowlast);
      randomcollast = randomcol;
      randomrowlast = randomrow;
      print("col=",randomcollast+area,"row=",randomrowlast,"\n");
      grid[randomrowlast][randomcollast+area]= true;
      if(randomrowlast+1<=9){
        grid[randomrowlast+1][randomcollast+area]= true;
      }
      if(randomrowlast-1>=0){
        grid[randomrowlast-1][randomcollast+area]= true;
      }
      if(randomcollast+area+1<=9){
        grid[randomrowlast][randomcollast+area+1]= true;
      }
      if(randomcollast+area-1>=0){
        grid[randomrowlast][randomcollast+area-1]= true;
      }      
    }
    area+=3;
    }
}


void draw() {
  background(0) ;
      
   switch(gameState){
    
    case GAME_RUN:
      // grid[][]= true/false; statusColor= turnOnColor/turnOffColor
      for (int i = 0; i < cols; i++) {
            for (int j = 0; j < rows; j++) {
            color statusColor = (grid[i][j]) ? turnOnColor : turnOffColor ;
            fill(statusColor) ;
            rect(cellWidth*i, cellHeight*j, cellWidth, cellHeight) ;  
            }
      }
      // Detcet if all grid[][] is false 
      boolean isAllFalse = true;
       for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
         if(grid[i][j]){
          isAllFalse = false;
          break;
         }
        }
       }
      if (isAllFalse){
      gameState=GAME_WIN;
      } 
     
          
     break;
     
     case GAME_WIN:
     
       image(win,0,0);
       
       if(keyPressed){
         setup();
         //Part II: Initialization
          /*grid[5][5]= true;
          grid[6][5]= true;
          grid[5][6]= true;
          grid[5][4]= true;
          grid[4][5]= true;*/
          gameState=GAME_RUN; 
          
       }
       
     break; 
   }
  
  
  

}

void mouseClicked(){
  int col = mouseX / cellWidth;
  int row = mouseY / cellHeight;
  
  
  grid[col][row] = !grid[col][row];
  if(col+1<=9){
  grid[col+1][row] = !grid[col+1][row];}
  if(col-1>=0){
  grid[col-1][row] = !grid[col-1][row];}
  if(row+1<=9){
  grid[col][row+1] = !grid[col][row+1];}
  if(row-1>=0){
  grid[col][row-1] = !grid[col][row-1];}
}
