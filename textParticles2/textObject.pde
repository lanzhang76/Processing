class textObject{
  String displayLetter;
  float textPosX, textPosY;
  float textColor;
  float thick;
  
  textObject(float posX, float posY,float c){
    textPosX = posX;
    textPosY = posY;
    textColor = c;
  }
  
  void assignLetter(String a){
    displayLetter = a;
  }
  
  void show(){   
    colorMode(HSB,360,100,100);
    fill(textColor,70,100);
    //textSize(20);
    text(displayLetter,textPosX, textPosY);
  }
  
  void change(String b){
    displayLetter = b;
  }
  
  PVector getPos(){
    PVector pos = new PVector(textPosX,textPosY);
    return pos;
  }
  
  void assignColor(float newColor){
    textColor = newColor;
  }
}
