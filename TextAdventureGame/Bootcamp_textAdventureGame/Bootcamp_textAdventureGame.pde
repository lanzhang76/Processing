//declare
PFont font;
int pick;
int index;
int smoothie;
boolean spinach;
String[] stage = new String[20];
String[] fruit = {"","Kale! ","Spinach! ","Strawberry! ","Blueberry! ","Banana! ","Orange! "};
String[] result = new String[10];
//index
void setup() {
  size(1000, 600);
  font = createFont("Roboto-Light", 18); 

  //string options
  stage[0]="Hey, welcome to Maxi's smoothie shop! We freshly pick our veggies and fruit from my grandparents' farm in Upstate NY. To start with, do you like Kale-[LEFT] or Spinach-[RIGHT]";
  stage[1]="For your second selection, would you like Strawberry-[UP] or Blueberry-[DOWN]";
  stage[2]="For your final selection, would you prefer Banana-[LEFT] or Orange-[RIGHT]";
  stage[3]="";
  //results
  result[0]="";
  result[1]="Thanks for waiting. Here's your Kale-Strawberry-Banana smoothie! Hope you enjoy it.";
  result[2]="Thanks for waiting. Here's your Kale-Strawberry-Orange smoothie! Hope you enjoy it.";
  result[3]="Thanks for waiting. Here's your Kale-Blueberry-Banana smoothie! Hope you enjoy it.";
  result[4]="Thanks for waiting. Here's your Kale-Blueberry-Orange smoothie! Hope you enjoy it.";
  result[5]="Thanks for waiting. Here's your Spinach-Strawberry-Banana smoothie! Hope you enjoy it.";
  result[6]="Thanks for waiting. Here's your Spinach-Strawberry-Orange smoothie! Hope you enjoy it.";
  result[7]="Thanks for waiting. Here's your Spinach-Blueberry-Banana smoothie! Hope you enjoy it.";
  result[8]="Thanks for waiting. Here's your Spinach-Blueberry-Orange smoothie! Hope you enjoy it.";
  
} 
  

void draw(){
  background(0);
  textFont(font);
  //on the screen, this will always shows
  text(fruit[pick]+stage[index]+result[smoothie], width/4, height*2/3, 500, 300);
}   

void keyPressed() {
  //ask for Kale or Spinach
  if (index == 0 && pick == 0){
    if(key == CODED){
      if (keyCode == LEFT){
        pick = 1;
        println("kale");
        spinach = false;
      } else if (keyCode == RIGHT) {
        pick = 2;
        println("Spinach");
        spinach = true;
      }   
        index = 1;
        smoothie = 0;
        
      }  
  }
  //}
 
 //Kale, ask for base 2 strawberry or blueberry
if (key == CODED){
if (spinach == false && index == 1 && pick == 1 && keyCode == UP){
        pick = 3; 
        index = 2;
        smoothie = 0;
        println("strawberry");
      } else if (spinach == false && index == 1 && pick == 1 && keyCode == DOWN) {
        pick = 4;
        index = 2; 
        smoothie = 0;
        println("blueberry");
      }   
     
  }
  
 //spinach, ask for base 2 strawberry or blueberry 
if (key == CODED){
if (spinach == true && index == 1 && pick == 2 && keyCode == UP){
        pick = 3; 
        index = 2;//Asking base 2
        smoothie = 0;//EMPTY
        println("strawberry");
      } else if (spinach == true && index == 1 && pick == 2 && keyCode == DOWN) {
        pick = 4;
        index = 2;//Asking base 2
        smoothie = 0; //EMPTY
        println("blueberry");
      }   
  }
  

//~~~~~~~Kale, STRAWBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == false && index == 2 && pick == 3 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 1;
          println("Banana");
      } else if (spinach == false && index == 2 && pick == 3 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 2;
          println("Orange");
      }   
  }

//~~~~~~~Kale, BLUEBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == false && index == 2 && pick == 4 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 3;
          println("Banana");
      } else if (spinach == false && index == 2 && pick == 4 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 4;
          println("Orange");
      }   
  }

//~~~~~~~SPINACH, STRAWBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == true && index == 2 && pick == 3 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 5;
          println("Banana");
      } else if (spinach == true && index == 2 && pick == 3 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 6;
          println("Orange");
      }   
  }

//~~~~~~~SPINACH, BLUEBERRY, now ask for base 3 whether want Banana or Orange~~~~~~
 
if (key == CODED){
  if (spinach == true && index == 2 && pick == 4 && keyCode == LEFT){
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 7;
          println("Banana");
      } else if (spinach == true && index == 2 && pick == 4 && keyCode == RIGHT) {
          pick = 0;//EMPTY
          index = 3;//EMPTY
          smoothie = 8;
          println("Orange");
      }   
  }




}
