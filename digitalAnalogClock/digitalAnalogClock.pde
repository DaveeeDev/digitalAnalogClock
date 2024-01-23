import java.text.SimpleDateFormat;  
import java.util.Date;

//middle x coordinate of the clock
int middleX;
//middle y coordinate of the clock
int middleY;
//spacing between each number in the clock hand
int spacingBetweenNumbers = 40;



void setup() {
  PVector screen = new PVector(1920, 1080);
  size(int(screen.x), int(screen.y));
  fullScreen();
  textAlign(CENTER, CENTER);
  middleX = width/2;
  middleY = height/2;
}



void draw() {
  background(255);
  //outer clock border
  circle(middleX, middleY, 460);
  //inner clock border
  circle(middleX, middleY, 50);
  
  fill(0);
  //draw the full time inside the inner clock border (HH:mm:ss)
  SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");  
  Date time = new Date();
  String stringTime = formatter.format(time);
  text(stringTime, middleX, middleY);
  fill(255);
  
  fill(0);
  //draw the seconds
  for (int space = 220; space >= 30; space -= spacingBetweenNumbers) {
    text(getTime("ss"), calculateEnd(space, "ss", 60).x, calculateEnd(space, "ss", 60).y);
  }
  //draw the minutes
  for (int space = 220 - int(4/3f * spacingBetweenNumbers); space >= 30; space -= spacingBetweenNumbers) {
    text(getTime("mm"), calculateEnd(space, "mm", 60).x, calculateEnd(space, "mm", 60).y);
  }
  //draw the hours
  for (int space = 220 - int(8/3f * spacingBetweenNumbers); space >= 30; space -= spacingBetweenNumbers) {
    text(getTime("HH"), calculateEnd(space, "HH", 24).x, calculateEnd(space, "HH", 24).y);
  }
  fill(255);
}



//get the end coordinates of the individual clock hands
PVector calculateEnd(int stretch, String value, int divider) {
  PVector end = new PVector();
  end.x = int(middleX + stretch * cos(radians(int(getTime(value)) * 360/divider - 90)));
  end.y = int(middleY + stretch * sin(radians(int(getTime(value)) * 360/divider - 90)));
  return end;
}



//get time, enumerator: ["HH", "mm", "ss"]
String getTime(String HHmmss) {
  String stringTime = "0";
  switch (HHmmss) {
    case "HH": {
      SimpleDateFormat formatter = new SimpleDateFormat("HH");  
      Date time = new Date();
      stringTime = formatter.format(time);
      break;
    }
    case "mm": {
      SimpleDateFormat formatter = new SimpleDateFormat("mm");  
      Date time = new Date();
      stringTime = formatter.format(time);
      break;
    }
    case "ss": {
      SimpleDateFormat formatter = new SimpleDateFormat("ss");  
      Date time = new Date();
      stringTime = formatter.format(time);
      break;
    }
  }
  return stringTime;
}
