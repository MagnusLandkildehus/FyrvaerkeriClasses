class Rocket{
  int bang = 0;
  float fuse = 1.0;
  color rocketColor;
  float xpos, ypos;
  float fuseFrames;
  float movex, movey = 0;
  float expand = 0;
  float dheight;
  
  Rocket(int b, float f, color c, float h){
    bang = b;
    fuse = f;
    rocketColor = c;
    fuseFrames = (f/120)*5*60;
    dheight = -1 * h;
  }
  
  void drawRocket(){
    if (movey>dheight) {
      pushMatrix();
      stroke(#ff0000);
      fill(#ff0000);
      rect(xpos-5,ypos-10+movey,10,5);
      fill(#ffffff);
      rect(xpos-5,ypos-5+movey,10,5);
      fill(#ff0000);
      rect(xpos-5,ypos+movey,10,5);
      fill(#ffffff);
      rect(xpos-5,ypos+5+movey,10,5);
      fill(#ff0000);
      triangle(xpos-5,ypos-10+movey,xpos+5,ypos-10+movey,xpos,ypos-20+movey);
      stroke(#000000);
      line(xpos,ypos-10+movey,xpos,ypos+40+movey);
      popMatrix();
      fuseFrames--;
      if (fuseFrames<0){
        movey = movey - 2;
      }
    }
    if (movey<=dheight) {
      if (expand < 80) {
        pushMatrix();
        //circle(xpos+movex,ypos+movey,10+expand);
        translate(xpos,ypos+dheight);
        stroke(rocketColor);
        fill(rocketColor);
        for (int i = 0; i < 8; i++){
          rotate(i*((2*PI)/8));
          rect(0+expand,0,20,5,2,2,2,2);
        }
        popMatrix();
        expand++;
      }
    }
    
  }
  
  void setPos(float x, float y){
    xpos=x;
    ypos=y;
  }
  
  
  
}
