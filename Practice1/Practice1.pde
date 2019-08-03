float a,b;
color colorA;
boolean colorChanged = false;

void setup(){
  size(480,360);
  background(0);
  colorMode(HSB,360,100,100);//Hue,Saturation and Brightness
  stroke(255);
  line(width/4,0,width/4,height);
  line(width/2,0,width/2,height);
  line(width*3/4,0,width*3/4,height);
  line(width,0,width,height);
}

void draw(){
  
  a = mouseX;
  b = mouseY;
    
  float time = millis();
  println(time);
  //colorA = color(a,b,100);
  //background(colorA);
}

void mousePressed(){
  if (colorChanged == false){
    background(a,100,100);
    colorChanged = true;
  } else {
    background(b,100,100);
    colorChanged = false;
  }
}
