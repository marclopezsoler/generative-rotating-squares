int sz = 30;
float [][] rotVal;
float [][] posX;
float [][] posY;
float inc = 0;
boolean isMax = false, isMin = true;

void setup(){
  size(600, 900);
  background(0);
  
  rotVal = new float[19][29];
  posX = new float[19][29];
  posY = new float[19][29];
  
  for(int i = 0; i < 19; i++){
    for(int j = 0; j < 29; j++){
      rotVal [i][j] = 0;
      posX [i][j] = i*sz;
      posY [i][j] = j*sz;
    }
  }
}

void draw(){
  background(0);
  noFill();
  stroke(200);
  strokeWeight(2);
  rectMode(CENTER);
  push();
  translate(sz*0.5, sz*0.5);
        if(inc < 1.2216157E26 && !isMax){
          inc += 1 + (0.01*inc*0.1*inc)/1000;
          if(inc >= 20000){
            isMax = true;
          }
        } else{
          inc += -(1 + (0.01*inc*0.1*inc)/1000);
          
          if(inc <= 0){
            isMax = false;
          }
        }
        
  for(int i = 1; i < 19; i++){
    for(int j = 1; j < 29; j++){
      push();
        rotVal[i][j] = (posX [i][j] + posY [i][j])/inc;
        translate(i*sz, j*sz);
        rotate(rotVal[i][j]);
        rect(0, 0, sz, sz);
      pop();
    }
  }
  pop();
}
