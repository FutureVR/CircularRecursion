class Circle
{
  PVector position;
  float diameter;
  float angleOffset;
  int level;
  float speed;
  
  float angle = 0;
  
  Circle parent;
  ArrayList<Circle> children = new ArrayList<Circle>();
  
  Circle(PVector p, int l, float d, float a, float s)
  {
    position = p;
    level = l;
    diameter = d;
    angleOffset = a;
    angle = angleOffset;
    speed = s;
    
    if(level < maxLevel)
    {
      float ang = 0;
      
      for(int i = 0; i < 4; i++)
      {
        PVector addVector = new PVector((diameter / 2) * cos(radians(ang)), (diameter / 2) * sin(radians(ang)));
        ang += 90;
        
        Circle child = new Circle( PVector.add(position, addVector),  level+1,  diameter * diameterFactor,  90*i, speed * speedFactor);
        child.parent = this;
        children.add(child);
      }
    }
  }
  
  
  void makeRotate()
  {
    if(frameCount % framesPerUpdate == 0)
    {
      angle += speed;
      if(level != 0) position.x = parent.position.x + (parent.diameter / 2) * cos(radians(angle));
      if(level != 0) position.y = parent.position.y + (parent.diameter / 2) * sin(radians(angle));
      
      for(Circle c : children)
      {
        c.makeRotate();  
      }
    }
  }
  
  
  void display()
  {
    //fill(circleFill);
    noFill();
    strokeWeight( ((1.3 - (float)level / (float)maxLevel) * 4) * (.25 + .75 * (diameter / startingDiameter)));
    stroke(circleStroke);
    ellipse(position.x, position.y, diameter, diameter);
    
    for(Circle c : children)
    {
      c.display();  
    }
  }
}