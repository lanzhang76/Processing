import processing.serial.*;
import processing.pdf.*;

Serial myPort;
PFont font;
int xPos = 1;
float oldSensorHeight = 0;
float SensorHeight;
boolean open;
boolean measure;
int scene = 1;
String receiverString = "";
String senderString = "";
ArrayList<Character> sender;
ArrayList<Character> receiver;

void setup(){
  //fullScreen();
  size(800,480);
  font = createFont("Roboto-Light", 22); 
  
  sender = new ArrayList<Character>();
  receiver = new ArrayList<Character>();
  background(255);
  frameRate(10);
  //println(Serial.list());
  //String Sensor = Serial.list()[4];
  myPort = new Serial(this,Serial.list()[4],115200);
}



void draw(){

      //println(scene);
      //background(255);
      fill(0);
      textFont(font);
      receiverString = getNameString(receiver);
      senderString = getNameString(sender);
      
      if(receiverString == ""){
        text("Hey,  ________:",40,45);
      }else{
        String result = "Hey, " + receiverString;
        text(result,40,45);
      }

      
      if(senderString != " "){
        String result = "Sincerely, " + senderString;
        text(result,width-300,height-80);
      }
      
     
    if(scene == 1){
               
     
        text("Who would you like to write this letter to? ",width/2,height/2);
        
     }
     
     if(scene == 2){

        text("This is a special letter for you:",40,80);
        text("And what's your name? ",width/2,height/2);
        if(senderString == " "){
          text("Sincerely,", width-370,height-80);
        
        }
     }
    if(scene == 3){
      
       text("This is a special letter for you:",40,80);
    
       //---------------------------------------------------------------------------------------------------drawing the diagram
      stroke(0);
      float yPos = height- SensorHeight;
      float OldyPos = height- oldSensorHeight;
      line(xPos - 0.5, OldyPos, xPos, yPos);
      
      fill(map(SensorHeight,50,400,100,255),random(0,100),random(0,100),30);
      float r = SensorHeight/30;
      noStroke();
      ellipse(xPos, yPos+random(-8,8),r,r);
      
      oldSensorHeight = SensorHeight;
      
      if(xPos >= width){
        xPos  = 0;
        yPos += 40;
        OldyPos += 40;
      background(255);
      } else {
        xPos += 1;
      }

    }
  
}

void serialEvent(Serial myPort){
  String inString = myPort.readStringUntil('\n');
  
  if(inString !=null){
    inString = trim(inString);
    //println(inString);
    int currentSensorRate = int(inString);
    //println(currentSensorRate);    
  
    //draw
   SensorHeight = map(currentSensorRate,0,1000,50,400);  
   println(SensorHeight); 
   
  }
}


String getNameString(ArrayList<Character> name){
  String resultString = "";
  for(int i = 0; i < name.size();i++){
    char temp = name.get(i);
    String sTemp = str(temp);
    resultString += sTemp;
    
  }
  return resultString;
}

void keyPressed(){

  if(scene == 1 && inputCheck(key)){
    receiver.add(key);
  }
  
  if(scene == 1 && key == TAB){
    println("delete");
    receiver.remove(receiver.size()-1);
  }
  
   if(scene == 2 && key == TAB){
    sender.remove(sender.size()-1);
  }
  
  if(scene == 1 && key == ENTER){
    scene += 1;
    println(scene);
  }else if(scene == 2 && key == ENTER){
     scene += 1;
  }
  
  if(scene == 2 && inputCheck(key)){
    sender.add(key);
  }

}


boolean inputCheck(Character c){
   
    if (c == 'A' || c == 'a' || c == 'B' || c == 'b' || c == 'C' || c == 'c' || c == 'D' || c == 'd' || c == 'E' || c == 'e' ||
             c == 'F' || c == 'f' || c == 'G' || c == 'g' || c == 'H' || c == 'h' || c == 'I' || c == 'i' || c == 'J' || c == 'j' ||
             c == 'K' || c == 'k' || c == 'L' || c == 'l' || c == 'M' || c == 'm' || c == 'N' || c == 'n' || c == 'O' || c == 'o' ||
             c == 'P' || c == 'p' || c == 'Q' || c == 'q' || c == 'R' || c == 'r' || c == 'S' || c == 's' || c == 'T' || c == 't' ||
             c == 'U' || c == 'u' || c == 'V' || c == 'v' || c == 'W' || c == 'w' || c == 'X' || c == 'x' || c == 'Y' || c == 'y' ||
             c == 'Z' || c == 'z' || c ==' '){
        return true;
    }else{
        return false;
    }
}
