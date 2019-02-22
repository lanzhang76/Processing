import de.voidplus.leapmotion.*; 
LeapMotion leap; 
ArrayList<PVector> points; 
PVector fingerpos; 
boolean initial;
PVector prevp;
PVector p;
float a;
float b;
float c;
//PImage keycolor;
 
void setup() {
  //size(1200,800);
  //keycolor = loadImage("color_code.png");
  fullScreen();
  background(245,244,234);
  //image(keycolor,0,0);
  leap = new LeapMotion(this);
  points = new ArrayList<PVector>(); 
  smooth(200);
  
  initial = true;
}
 
void draw() {
  
  int fps = leap.getFrameRate();
  frameRate(fps);
  
  if (leap.getHands().size() == 0) {
    initial = true; // reset coordinates for the drawing
  }
  
  for (Hand hand : leap.getHands()) {
      boolean handIsRight = hand.isRight();
      Finger fingerIndex = hand.getIndexFinger();
      PVector fingerpos  = fingerIndex.getPosition();      
      
      if (handIsRight){
        if (fingerpos.z <= 30) {
          //fill(0);
          //ellipse(fingerpos.x, fingerpos.y, constrain(fingerpos.z, 10, 20), constrain(fingerpos.z, 10, 20));
        }
        else if (fingerpos.z > 30) {
          points.add(new PVector(fingerpos.x, fingerpos.y));
          
        }        
      }
    }

  for (int i = points.size()-1; i >= 1; i--) {
    p = points.get(i);
    prevp = points.get(i-1);  
      float speed = abs(p.x-prevp.x) + abs(p.y-prevp.y);
      float diam=(20/speed);
      float r = constrain(diam,0,15);
      float circleR = constrain(diam,0,6)+random(-0.5,0.5);
      //println(r);
      strokeWeight(r);
      stroke(a,b,c);
      fill(a,b,c);
       if (keyPressed) {
          if (key == '1') {a=9;b=150;c=132;} //green   
          else if (key == '2') {a=244;b=134;c=50;}//orange
          else if (key == '3') {a=164;b=74;c=60;}//red
          else if (key == '4') {a=4;b=82;c=136;}//blue
          else if (key == '5') {a=252;b=213;c=67;}//yellow
          else if (key == '6') {a=252;b=206;c=211;}//pink
          else if (key == '7') {a=156;b=98;c=164;}//purple
          else if (key == '8') {a=232;b=217;c=177;}//cream
          else if (key == '9') {a=0;b=0;c=0;}//black
          else if (key == '0') {a=255;b=255;c=255;}//white
          else {a=0;b=0;c=0;}
        }
      line(p.x,p.y,prevp.x, prevp.y);
      ellipse(p.x,p.y,circleR,circleR);   
    } 
    
  if(initial == true){
      prevp = p;
      points.clear();
      for (int i = points.size()-1; i >= 1; i--){
        points.add(prevp);
      } initial = false;
        stroke(0);
    }
  
       
  }
   
void keyPressed() {
  if (key == ' ') {
    background(245,244,234);
  }
}
