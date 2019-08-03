import processing.serial.*;
import processing.pdf.*;

Serial myPort;
PFont font;
int xPos = 1;
float oldSensorHeight = 0;
float SensorHeight;
boolean open;
boolean measure;

void setup(){
  //fullScreen();
  size(800,480);
  font = createFont("Roboto-Light", 22); 
  //size(800,600);
  background(255);
  frameRate(30);
println(Serial.list());
//String Sensor = Serial.list()[2];
myPort = new Serial(this,Serial.list()[4],115200);

beginRecord(PDF, "love_letter.pdf");
}



void draw(){
 
    
       //whit boxes
    //fill(255);
    //noStroke();
    //rect(0,0,width, 40);
    //rect(0,0,width, height-40);
      //text
    fill(0);
    frameRate(60);
    textFont(font);
    text("Hey,  ________:",40,45);
    text("This is a special letter for you:",40,80);
    text("Sincerely, my feelings for you.", width-370,height-80);
    
    //diagram drawing
    //stroke(map(xPos,0,width*2/3,0,255),0,0);  
    //line(xPos - 1, height, xPos, height- SensorHeight);
    //stroke(map(xPos,0,width,0,255),0,0,30);
    //line(xPos - 1, oldSensorHeight, xPos, SensorHeight);
    stroke(0);
    float yPos = height- SensorHeight;
    float OldyPos = height- oldSensorHeight;
    line(xPos - 1, OldyPos, xPos, yPos);
    
    fill(map(SensorHeight,250,300,100,255),random(0,100),random(0,100),30);
    float r = SensorHeight/30;
    noStroke();
    ellipse(xPos, yPos+random(-8,8),r,r);
    oldSensorHeight = SensorHeight;
    
  
    
    if(xPos >= width){
    xPos  = 0;
    yPos += 40;
    OldyPos += 40;
  } else {
    xPos ++;
  }

  save("here.png");
  
  //int timeDisplay;
  //float m = millis()/1000;
  //  if (m > 0 || m<=30){
  //    //timeDisplay = int(100 - m);
  //    timeDisplay = int(m);
  //    fill(255);
  //    noStroke();
  //    rect(1144,4,60,70);
  //    fill(0);
  //    text("Time:"+timeDisplay, 1100,40);
    //  m *= 0;
    //} 
    //if (m >= 30){
      //m = 0;
    //}
    
    
    //println(m);
  
  
}

void serialEvent(Serial myPort){
  String inString = myPort.readStringUntil('\n');
  
  if(inString !=null){
    inString = trim(inString);
    println(inString);
    int currentSensorRate = int(inString);
    println(currentSensorRate);    
  //int inByte = myPort.read();
  //println(inByte);
    //draw
   SensorHeight = map(currentSensorRate,0,1000,100,400);  
   println(SensorHeight); 
   
  }
}

void mousePressed() {
  endRecord();
  //exit();
  println("PDF saved");
}
