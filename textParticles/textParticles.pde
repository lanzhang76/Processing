//Declare one object from my textObject Class
textObject textS;
//making my particle system rn
ArrayList<textObject> letterObjects = new ArrayList();
PVector posMouse, posLetter;
float dist;
float hue;
int range1 = 150;
int range2 = 240;
int range3 = 400;
PFont gothic;


void setup(){
  size(800,800);
  colorMode(HSB,360,100,100);
  gothic = createFont("franklin-gothic-bold.ttf",20);
  
  //WHEN instantiate ONE text object:
  //
  //posLetter =new PVector(width/2,height/2);
  //textS = new textObject(posLetter.x,posLetter.y,hue);
  //assign an initial value to it
  //textS.assignLetter("S");
  
 
  //WHEN instantiate a BUNCH of textObject:
  //
  for (int i = 40; i< width; i += width/20){
    for(int p = 40; p < height; p += height/20){     
      PVector pos = new PVector(i,p);
      textObject letter = new textObject(pos.x,pos.y,255);
      letter.assignLetter("S");
      letterObjects.add(letter);
      int totalSize = letterObjects.size();
      //println(totalSize);
    }  
  }
}

void draw(){
  //re-draw background 
  background(360,0,0);
  textFont(gothic);
  
  //calculate distance from mousePos to the letterPos
  posMouse = new PVector(mouseX,mouseY);
  
  // GET ALL OBJECTS FROM THE SYSTEM TO MAKE CHANGES
  for (textObject part : letterObjects) {
    dist = posMouse.dist(part.getPos());
    hue = map(dist,0,800,0,360); // hue is determined by the distance 
    part.assignColor(hue);
    part.show();  
    if(dist<=150){
     part.assignLetter("S");
   } else if(dist > range1 && dist <=range2){
     part.assignLetter("H");
   } else if (dist > range2 && dist <= range3){
     part.assignLetter("I");
   } else {
     part.assignLetter("T");
   }
  }
  
  //BELOW is with one object:
  //
  //dist = posMouse.dist(posLetter); 
  //hue = map(dist,0,350,0,360);
  //textS.assignColor(hue);
  //textS.show();
   
  //change to a different Letter if dist is smaller than 20
   //if(dist<=20){
   //  textS.assignLetter("Q");
   //} else {
   //  textS.assignLetter("S");
   //}
}
