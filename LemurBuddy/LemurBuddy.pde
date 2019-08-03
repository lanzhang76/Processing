import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;

int lf = 10; // Linefeed in ASCII
String myString = null;
Serial myPort; // The serial port
int sensorValue = 0;

void setup() {
  size(100,100);
  // Open the port you are using at the rate you want:
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[4], 9600);
  myPort.clear();
  // Throw out the first reading, in case we started reading 
  // in the middle of a string from the sender.
  myString = myPort.readStringUntil(lf);
  myString = null;
 
 minim = new Minim(this);
  player = minim.loadFile("pur.wav"); 
}

void draw() {
  // check if there is something new on the serial port
  while (myPort.available() > 0) {
  // store the data in myString 
  myString = myPort.readStringUntil(lf);
  // check if we really have something
  if (myString != null) {
    myString = myString.trim(); // let's remove whitespace characters
    // if we have at least one character...
    if(myString.length() > 0) {
       println(myString); // print out the data we just received
       // if we received a number (e.g. 123) store it in sensorValue, we sill use this to change the background color. 
       try {
           sensorValue = Integer.parseInt(myString);
           // As the range of an analog sensor is between 0 and 1023, we need to 
           // convert it in order to use it for the background color brightness
           int sound
           = (int)map(sensorValue, 0, 400, 0, 255);
           background(sound);
       } catch(Exception e){}
       if(myString.equals("P")){
          //if(player.isPlaying() == false){
              player.play();
          //}      
       } else if (myString.equals("S")){
           player.pause();
          }
    }
  }
 }
}
