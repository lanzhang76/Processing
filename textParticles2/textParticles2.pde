ArrayList<textObject> letterObjects = new ArrayList();
PVector posMouse, posLetter;
float dist;
float hue;
int range = 100;
PFont gothic;
float fontSize;
boolean cursorY;
PVector mover;
PVector speed;

void setup(){
  size(800,800);
  gothic = createFont("franklin-gothic-bold.ttf",2);
  //colorMode(HSB,360,100,100);
  
  //NOW instantiate a BUNCH of textObject:
  //
  for (int i = 20; i< width; i += width/30){
    for(int p = 30; p < height; p += height/30){     
      PVector pos = new PVector(i,p);
      textObject letter = new textObject(pos.x,pos.y,255);
      letter.assignLetter("S");
      //letter.show();
      letterObjects.add(letter);
      int totalSize = letterObjects.size();
      println(totalSize);
    }  
  }
  
  mover = new PVector(range,height/2);
  speed = new PVector(10,10);
}

void draw(){
  //re-draw background 
  background(0);
  
  //calculate distance from mousePos to the letterPos
  posMouse = new PVector(mouseX,mouseY);
  mover.add(speed);

  if (mover.x >= width - range || mover.x <= range){
    speed.x *= -1;
  } 
  
  if( mover.y >= height - range || mover.y <= range){
    speed.y *= -1;
  }
  
  
  // GET ALL OBJECTS FROM THE SYSTEM TO MAKE CHANGES
  for (textObject part : letterObjects) {
    dist = mover.dist(part.getPos());
    hue = map(dist,0,800,1,5);
    fontSize = map (dist,0,1000,40,2);
    textFont(gothic,fontSize);
    part.assignColor(hue);
    part.show();  
    
    if(dist<=range){
      part.assignLetter("B");
    } else {
      part.assignLetter("b");
    }
    
    if (mousePressed) {
      cursorY = !cursorY;
    } 
    
    if (cursorY){
      noCursor();
    } 

  }
}
