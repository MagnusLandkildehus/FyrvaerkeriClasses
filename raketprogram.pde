ArrayList<Rocket> Rockets = new ArrayList<Rocket>();
ArrayList<Slider> Sliders = new ArrayList<Slider>();
ArrayList<Button> Buttons = new ArrayList<Button>();
color choosenColor = #000000;
boolean mousePress = false;

void setup(){
  size(1000,800);
  Sliders.add(new Slider(820,100,160,#000000,"Detonation height: "));
  Sliders.add(new Slider(820,200,160,#000000,"Fuse time: "));
  Buttons.add(new Button(820,300,160/3,160/3,"",#ff0000));
  Buttons.add(new Button(820,300+160/3,160/3,160/3,"",#00ff00));
  Buttons.add(new Button(820,300+2*160/3,160/3,160/3,"",#0000ff));
  Buttons.add(new Button(820+160/3,300,160/3,160/3,"",#05f3ff));
  Buttons.add(new Button(820+160/3,300+160/3,160/3,160/3,"",#9a25e8));
  Buttons.add(new Button(820+160/3,300+2*160/3,160/3,160/3,"",#e825de));
  Buttons.add(new Button(820+2*160/3,300,160/3,160/3,"",#eba360));
  Buttons.add(new Button(820+2*160/3,300+160/3,160/3,160/3,"",#ecfa23));
  Buttons.add(new Button(820+2*160/3,300+2*160/3,160/3,160/3,"",#23fa9d));
}

void draw(){
  background(#283478);
  pushMatrix();
  fill(#49bd37);
  circle(400,1600,2000);
  fill(#b3b3b3);
  rect(800,0,200,800);
  popMatrix();
  
 for (int i=0; i < Rockets.size(); i++){
   pushMatrix();
   stroke(Rockets.get(i).rocketColor);
   fill(Rockets.get(i).rocketColor);
   Rockets.get(i).drawRocket();
   popMatrix();
 }
 for (int i = 0; i < Sliders.size(); i++) {
   Sliders.get(i).drawSlider();
 }
 for (int i = 0; i < Buttons.size(); i++) {
   Buttons.get(i).drawButton();
 }
 
}

void mousePressed(){
  if (mouseX<800) {
    Rockets.add(new Rocket(5,Sliders.get(1).sliderPos,choosenColor,(Sliders.get(0).sliderPos/160)*700));
    Rockets.get(Rockets.size()-1).setPos(mouseX,mouseY);
   }
   mousePress = true;
   for (int i = 0; i < Buttons.size(); i++) {
    if (mouseX >= Buttons.get(i).x && mouseX <= Buttons.get(i).x + Buttons.get(i).w) {
      if (mouseY >= Buttons.get(i).y && mouseY <= Buttons.get(i).y + Buttons.get(i).h) {
        choosenColor = Buttons.get(i).c;
      }
    }
  }
}

void mouseReleased(){
  mousePress = false;
}

void mouseDragged(){
  for (int i = 0; i < Sliders.size(); i++) {
    if (mouseX >= Sliders.get(i).x && mouseX <= Sliders.get(i).x + Sliders.get(i).len) {
      if (mouseY >= Sliders.get(i).y - 10 && mouseY <= Sliders.get(i).y + 10) {
        Sliders.get(i).setSliderPos((mouseX-Sliders.get(i).x));
      }
    }
  }
}
