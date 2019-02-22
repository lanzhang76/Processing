import processing.sound.*;
SoundFile file;
//declare
PFont font;
PImage bg;
PImage[] fpics = new PImage[20];
//
int pick;
int index;
int smoothie;
int pictureA = 1;
int pictureB = 2;
int pictureC = 0;
int pictureD = 0;
boolean spinach;
String[] stage = new String[20];
String[] fruit = {"","Kale! ","Spinach! ","Strawberry! ","Blueberry! ","Banana! ","Orange! "};
String[] result = new String[10];
//index
void setup() {
  size(800, 400);
  font = createFont("Roboto-Light", 17); 
  bg = loadImage("bg.png");
  file = new SoundFile(this, "Happy walk.mp3");
  file.play(); 
  
  for (int i=0; i < 16; i++){
  fpics [i] = loadImage(i+".png");}

  //string options
  stage[0]="Hey, welcome to Maxi's smoothie shop! I pick the veggies and fruit from my grandma's farm in Upstate NY. To start with, do you like Kale-[LEFT] or Spinach-[RIGHT]?";
  stage[1]="For your second selection, would you like Strawberry-[UP] or Blueberry-[DOWN]?";
  stage[2]="For your final selection, would you prefer Banana-[LEFT] or Orange-[RIGHT]?";
  stage[3]="";
  
  //results
  result[0]="";
  result[1]="Thanks for waiting. Here's your Kale-Strawberry-Banana smoothie!\nHope you enjoy it.";
  result[2]="Thanks for waiting. Here's your Kale-Strawberry-Orange smoothie!\nHope you enjoy it.";
  result[3]="Thanks for waiting. Here's your Kale-Blueberry-Banana smoothie!\nHope you enjoy it.";
  result[4]="Thanks for waiting. Here's your Kale-Blueberry-Orange smoothie!\nHope you enjoy it.";
  result[5]="Thanks for waiting. Here's your Spinach-Strawberry-Banana smoothie!\nHope you enjoy it.";
  result[6]="Thanks for waiting. Here's your Spinach-Strawberry-Orange smoothie!\nHope you enjoy it.";
  result[7]="Thanks for waiting. Here's your Spinach-Blueberry-Banana smoothie!\nHope you enjoy it.";
  result[8]="Thanks for waiting. Here's your Spinach-Blueberry-Orange smoothie!\nHope you enjoy it.";
  
} 
  

void draw(){
  background(bg);
  fill(0);
  textFont(font);
  //on the screen, this will always shows
  text(fruit[pick]+stage[index]+result[smoothie], width * 27.5/100, height*2.8/5, 365, 200);
  image(fpics[pictureA],266,45,133,133);
  image(fpics[pictureB],386,45,133,133);
  image(fpics[pictureC],333,45,133,133);
  image(fpics[pictureD],0,0);
}   

void keyPressed() {
  //ask for Kale or Spinach
    if(key == CODED){
      if (index == 0 && pick == 0 && keyCode == LEFT){
        pick = 1;
        println("kale");
        spinach = false;
        index = 1;
        smoothie = 0;   
        pictureA = 3;//fruit image-strawberry
        pictureB = 4;//fruit image-blueberry
      } else if (index == 0 && pick == 0 && keyCode == RIGHT) {
        pick = 2;
        println("Spinach");
        spinach = true;
        pictureA = 3;//fruit image-strawberry
        pictureB = 4;//fruit image-blueberry
        index = 1;
        smoothie = 0;   
      }       
      } 

 
 //Kale, ask for base 2 strawberry or blueberry
if (key == CODED){
if (spinach == false && index == 1 && pick == 1 && keyCode == UP){
        pick = 3; 
        index = 2;
        smoothie = 0;
        println("strawberry");
       pictureA = 5;//fruit image-banana
       pictureB = 6;//fruit image-orange
      } else if (spinach == false && index == 1 && pick == 1 && keyCode == DOWN) {
        pick = 4;
        index = 2; 
        smoothie = 0;
        println("blueberry");
        pictureA = 5;//fruit image-banana
        pictureB = 6;//fruit image-orange
      }   
  }
  
 //spinach, ask for base 2 strawberry or blueberry 
if (key == CODED){
if (spinach == true && index == 1 && pick == 2 && keyCode == UP){
        pick = 3; 
        index = 2;//Asking base 2
        smoothie = 0;//EMPTY
        println("strawberry");
        pictureA = 5;//fruit image-banana
       pictureB = 6;//fruit image-orange
      } else if (spinach == true && index == 1 && pick == 2 && keyCode == DOWN) {
        pick = 4;
        index = 2;//Asking base 2
        smoothie = 0; //EMPTY
        println("blueberry");
        pictureA = 5;//fruit image-banana
        pictureB = 6;//fruit image-orange
      }   
  }
  

//~~~~~~~Kale, STRAWBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == false && index == 2 && pick == 3 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 1;
          println("Banana");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 7;
          pictureD = 15;
      } else if (spinach == false && index == 2 && pick == 3 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 2;
          println("Orange");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 8;
          pictureD = 15;
      }   
  }

//~~~~~~~Kale, BLUEBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == false && index == 2 && pick == 4 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 3;
          println("Banana");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 9;
          pictureD = 15;
      } else if (spinach == false && index == 2 && pick == 4 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 4;
          println("Orange");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 10;
          pictureD = 15;
      }   
  }

//~~~~~~~SPINACH, STRAWBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == true && index == 2 && pick == 3 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 5;
          println("Banana");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 11;
          pictureD = 15;
      } else if (spinach == true && index == 2 && pick == 3 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 6;
          println("Orange");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 12;
          pictureD = 15;
      }   
  }

//~~~~~~~SPINACH, BLUEBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == true && index == 2 && pick == 4 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 7;
          println("Banana");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 13;
          pictureD = 15;
      } else if (spinach == true && index == 2 && pick == 4 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 8;
          println("Orange");
          //result PICS
          pictureA = 0;
          pictureB = 0;
          pictureC = 14;
          pictureD = 15;
      }   
  }

if (key == CODED){
  if ( pick == 0 && index == 3 && keyCode == SHIFT){
          pick = 0;//EMPTY
          index = 0; 
          smoothie = 0;
          pictureA = 1;
          pictureB = 2;
          pictureC = 0;
          pictureD = 0;
  }
}



}
