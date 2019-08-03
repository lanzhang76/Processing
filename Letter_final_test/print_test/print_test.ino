#include "Adafruit_Thermal.h"
#include "printer_guacailogo.h"


#include "SoftwareSerial.h"
#define TX_PIN 6 // Arduino transmit  YELLOW WIRE  labeled RX on printer
#define RX_PIN 5 // Arduino receive   GREEN WIRE   labeled TX on printer

SoftwareSerial mySerial(RX_PIN, TX_PIN); // Declare SoftwareSerial obj first
Adafruit_Thermal printer(&mySerial, 4);     // Pass addr to printer constructor

void setup() {
  mySerial.begin(19200);  // Initialize SoftwareSerial
  printer.begin();        // Init printer 

  //name:
  printer.justify('C'); 
  printer.println(F("E r a i n c e ,"));

  //Thank you Message
  printer.doubleHeightOn();
  printer.setLineHeight(80);
  printer.boldOn();
  printer.println(F("T H A N K  Y O U"));
  printer.doubleHeightOff(); 
  printer.boldOff(); 
  printer.setLineHeight(50);
  printer.println(F("FOR PARTICIPATION."));
  printer.setLineHeight(50); 
  

  //guacai logo
  printer.printBitmap(printer_guacailogo_width, printer_guacailogo_height, printer_guacailogo_data);
//QR Code:
//  printer.println(F("Follow us on Wechat"));
//  printer.printBitmap(printer_guacai_width, printer_guacai_height, printer_guacai_data);

//Ending:
  printer.println(F("Art Impact, Boston, 2019"));
  printer.println(F("(Feel free to take it with you)"));
   printer.println(F(" "));
   printer.println(F(" "));
   printer.println(F("------- Tear here -------"));
   printer.setLineHeight(80); 
  printer.println(F(" "));

  
  printer.sleep();      // Tell printer to sleep
  delay(3000L);         // Sleep for 3 seconds
  printer.wake();       // MUST wake() before printing again, even if reset
  printer.setDefault(); // Restore printer to defaults
}

void loop() {

}

