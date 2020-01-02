/*  Snake Game Walk-Through
 *
 * @Author: Allen Thoe        int[] x = new int[2];
                                 x[0] = "FIRST INT"
                                 
                              ArrayList<Integer> x = new Array();
                                 x.get(0) = "FIRST INT"
                                 x.add(index,Value);
 * @Date: 1/2/2020
 */
 
 int numLines;
 float w;
 Apple[] apple;
 Snake snake;
 int gameState;
 
 void setup(){
    size(600,600);
    numLines = 20;
    w = width/numLines;
    apple = new Apple[3];
    for(int i = 0; i < apple.length; i++){
      apple[i] = new Apple();
    }
    snake = new Snake();
    frameRate(10);
    gameState = 0;
    textSize(44);
 }
 
 void draw(){
   if(gameState == 0){
     background(0);
     drawGrid();
     for(int i = 0; i < apple.length; i++){
       apple[i].display();
       if(apple[i].isEaten(snake)){
         println("OUCH");
         apple[i] = new Apple();
       }
     }
     snake.display();
     snake.move();
     if(snake.checkTail()){
       text("YOU RAN INTO YOURSELF!", 40,40);
       gameState = 1;
     }
   }
 }
 
 void drawGrid(){
    stroke(255,0,255);
    for(int i = 0; i < numLines; i++){
      line(0, i*w, width, i*w); //HORIZONTAL
      line(i*w, 0, i*w, height);
   }
 }
 
 void keyPressed(){
    if(keyCode == LEFT && snake.dir != "RIGHT"){
      snake.dir = "LEFT";
    } else if(keyCode == RIGHT && snake.dir != "LEFT"){
      snake.dir = "RIGHT";
    } else if(keyCode == UP && snake.dir != "DOWN"){
      snake.dir = "UP";
    } else if(keyCode == DOWN && snake.dir != "UP"){
      snake.dir = "DOWN";
    }
 }
 
 void mousePressed(){
     setup();
 }

class Apple{
  
   int x, y;
   
   Apple(){
      x = (int)random(numLines);
      y = (int)random(numLines);
   }
   
   void display(){
      fill(0,255,0); //GREEN
      rect(x*w, y*w, w, w);
   }
   
   boolean isEaten(Snake s){
      if(x == s.x.get(0) && y == s.y.get(0)){
        s.x.add(0,x);  //.add(index, value)
        s.y.add(0,y);
        return true;
      } else {
        return false;
      }
   }
  
}
  
class Snake{
  
   ArrayList<Integer> x, y;
   String dir;  //DIRECTION HEAD IS MOVING
   
   Snake(){
      x = new ArrayList();
      y = new ArrayList();
      x.add(5);
      y.add(10);
      dir = new String();
   }
  
   void display(){
      fill(255,0,0);  //RED
      for(int i = 0; i < x.size(); i++){  //x and y are same size()
        rect(x.get(i)*w, y.get(i)*w, w, w);
      }
   }
   
   void move(){
     switch(dir){
        case "UP":
          if(y.get(0) > 0){
            for(int i = x.size()-1; i > 0; i--){
              x.set(i, x.get(i-1));  //.set(INDEX, VALUE)
              y.set(i, y.get(i-1));
            }
            y.set(0, y.get(0)-1); //MOVE HEAD
          } else { gameState = 1;}
          break;
        case "DOWN":
          if(y.get(0) < numLines - 1){
            for(int i = x.size()-1; i > 0; i--){
              x.set(i, x.get(i-1));  //.set(INDEX, VALUE)
              y.set(i, y.get(i-1));
            }
            y.set(0, y.get(0)+1); //MOVE HEAD
          } else { gameState = 1;}
          break;
        case "LEFT":
          if(x.get(0) > 0){
            for(int i = x.size()-1; i > 0; i--){
              x.set(i, x.get(i-1));  //.set(INDEX, VALUE)
              y.set(i, y.get(i-1));
            }
            x.set(0, x.get(0)-1); //MOVE HEAD
          } else { gameState = 1;}
          break;
        case "RIGHT":
          if(x.get(0) < numLines - 1){
            for(int i = x.size()-1; i > 0; i--){
              x.set(i, x.get(i-1));  //.set(INDEX, VALUE)
              y.set(i, y.get(i-1));
            }
            x.set(0, x.get(0)+1); //MOVE HEAD
          } else { 
            text("YOU HIT THE WALL!", 20, 20);
            gameState = 1;
          }
          break;
     }
     
   }
   
   boolean checkTail(){
     for(int i = 1; i < x.size(); i++){
        if(x.get(0) == x.get(i) && y.get(0) == y.get(i)){
          return true;
        }
     }
     return false;
   }
}
