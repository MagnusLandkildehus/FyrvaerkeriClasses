class Button{
  float x, y, w, h;
  String text;
  color c;

  Button(float x_, float y_, float w_, float h_, String text_, color c_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = text_;
    c = c_;
  }
  
  void drawButton(){
    pushMatrix();
    if (mousePress == true && mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
      stroke(#b3b3b3);
      fill(#b3b3b3);
    } else {
      stroke(c);
      fill(c);
    }
    rect(x,y,w,h);
    popMatrix();
  }
}
