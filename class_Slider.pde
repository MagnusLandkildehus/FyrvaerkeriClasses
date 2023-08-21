class Slider{
  String sliderText;
  float x, y, len;
  color c;
  float sliderPos;
  
  Slider(float x_, float y_, float len_, color c_, String sliderText_){
    x = x_;
    y  = y_;
    len = len_;
    c = c_;
    sliderText = sliderText_;
    sliderPos = 0.5*len;
  }
  
  void setSliderPos(float sP){
    sliderPos = sP;
  }
  
  void drawSlider(){
    pushMatrix();
    stroke(c);
    fill(c);
    text(sliderText + (sliderPos/1.6) + "%",x,y-10);
    line(x,y,x+len,y);
    circle(x+sliderPos,y,20*(160/len));
    popMatrix();
  }
  
}
