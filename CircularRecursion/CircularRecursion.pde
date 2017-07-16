ArrayList<Circle> firstCircles = new ArrayList<Circle>();

boolean showText = true;
String myText = "PRESS THE MOUSE BUTTON";
PFont myFont;
float textSize = 50;

int maxLevel = 5;
float startingDiameter = 400;
float diameterFactor = .5;
float startingSpeed = .5;
float speedFactor = 1.9;
float framesPerUpdate = 1;

//float strokeWeight = 1;
color circleStroke = color(0);
color circleFill = color(255, 0, 0, 128);

void setup()
{
  size(1600, 900);
  background(255);
  
  translate(width / 2, height / 2);
  
  myFont = createFont("Georgia", 64);
  textFont(myFont);
  textSize(textSize);
  textAlign(CENTER, CENTER);
}

void mousePressed()
{
  if (showText == true)
    firstCircles.add(new Circle(new PVector(width / 2, height / 2), 0, startingDiameter, 0, startingSpeed));  
    
  showText = false;

}

void draw()
{
  background(255);
  
  if(showText) 
  {
    fill(0);
    text(myText, width / 2, height / 2);
  }
  
  for(Circle c : firstCircles)
  {
    c.makeRotate();
    c.display();
  }
}
