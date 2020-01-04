class Snake{
  
   ArrayList<Integer> x, y;
   String dir;  //DIRECTION HEAD IS MOVING
   float r, g, b;
   float snakeW;
   float dx;
   
   Snake(){
      x = new ArrayList();
      y = new ArrayList();
      x.add(5);
      x.add(6);
      y.add(10);
      y.add(10);
      dir = new String();
      snakeW = w;
   }
  
   //TODO: ADD STYLE
   void display(){
       //RED
      
      for(int i = 0; i < x.size(); i++){  //x and y are same size()
          if(i%2 == 0){
             b = 200; 
          } else {
             b = 0;
          }
          snakeW = i;
          snakeW = map(snakeW, 0, x.size(), w+5, w/4); 
          r =i;
          r = map(r, 0, x.size(), 255, 100);
          dx = (w - snakeW)/2;
          if(i%2 == 0){
             r = 0;
             b = 255; 
          } else {
             b = 0;
          }

        fill(r,g,b);
        stroke(100,0,0);
        rect(x.get(i)*w+dx, y.get(i)*w+dx, snakeW, snakeW, 8);
        if(i == 0){
          //EYES
           noStroke();
           fill(255);
           circle(x.get(0)*w + w/3, y.get(0)*w+w/3+1, w/4); 
           circle(x.get(0)*w + 2*w/3, y.get(0)*w+w/3+1, w/4); 
           fill(0);
           circle(x.get(0)*w + w/3+1, y.get(0)*w+w/3+2, w/10); 
           circle(x.get(0)*w + 2*w/3+1, y.get(0)*w+w/3+2, w/10);           
        }
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
          } else { 
            fill(255,0,0);
            text("YOU HIT THE WALL!", 18, 202);
            fill(0,0,255);
            text("YOU HIT THE WALL!", 20, 200);
            gameState = 1;
          }
          break;
        case "DOWN":
          if(y.get(0) < numLines - 1){
            for(int i = x.size()-1; i > 0; i--){
              x.set(i, x.get(i-1));  //.set(INDEX, VALUE)
              y.set(i, y.get(i-1));
            }
            y.set(0, y.get(0)+1); //MOVE HEAD
          } else { 
            fill(255,0,0);
            text("YOU HIT THE WALL!", 18, 202);
            fill(0,0,255);
            text("YOU HIT THE WALL!", 20, 200);;
            gameState = 1;
          }
          break;
        case "LEFT":
          if(x.get(0) > 0){
            for(int i = x.size()-1; i > 0; i--){
              x.set(i, x.get(i-1));  //.set(INDEX, VALUE)
              y.set(i, y.get(i-1));
            }
            x.set(0, x.get(0)-1); //MOVE HEAD
          } else { 
            fill(255,0,0);
            text("YOU HIT THE WALL!", 18, 202);
            fill(0,0,255);
            text("YOU HIT THE WALL!", 20, 200);
            gameState = 1;
          }
          break;
        case "RIGHT":
          if(x.get(0) < numLines - 1){
            for(int i = x.size()-1; i > 0; i--){
              x.set(i, x.get(i-1));  //.set(INDEX, VALUE)
              y.set(i, y.get(i-1));
            }
            x.set(0, x.get(0)+1); //MOVE HEAD
          } else { 
            fill(255,0,0);
            text("YOU HIT THE WALL!", 18, 202);
            fill(0,0,255);
            text("YOU HIT THE WALL!", 20, 200);
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
