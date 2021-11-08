Particle[] lemon = new Particle[20];
void setup()
{
  size(800, 800);
  noStroke();
  for (int i = 0; i < lemon.length; i++)
    lemon[i] = new Particle();
  lemon[10] = new OddballParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i < lemon.length; i++) {
    lemon[i].show();
    lemon[i].move();
  }
}
class OddballParticle extends Particle
{
  OddballParticle() {
    myColor = color(0, (int)(Math.random()*256), (int)(Math.random()*256));
    stroke_weight = 0;
  }
}
class Particle
{
  double myX, myY, mySpeed, myAngle, initX, initY;
  int myColor, line_color, stroke_weight;
  Particle()
  {
    myX = myY = 400;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*0.75;
    initX = myX + Math.cos(myAngle) * mySpeed;
    initY = myY + Math.sin(myAngle) * mySpeed;
    myColor = color(255, 0, 0);
    stroke_weight = 3;
    //myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));//color(214,255,250);
  }
  void show() {
    if (stroke_weight == 0) {
      fill(myColor);
      ellipse((float)myX, (float)myY, 69, 69);
    } else
      stroke(myColor);
    strokeWeight(stroke_weight);
    int rand = (int)(Math.random()*2);
    if (rand == 0)
      line((float)myX+1000, (float)myY+1000, (float)myX-1000, (float)myY-1000);
    else
      line((float)myX+1000, (float)myY-1000, (float)myX-1000, (float)myY+1000);
  }
  void move() {
    if (stroke_weight == 3) {
      myX = myX + Math.cos(myAngle) * mySpeed;
      myY = myY + Math.sin(myAngle) * mySpeed;
    } else {
      myX = myX + (int)(Math.random()*41)-20;
      myY = myY + (int)(Math.random()*41)-20;
    }

    if ((myX > 810) || (myX < -10)) {
      myX = 400;
      myAngle = Math.random()*2*Math.PI;
    }
    if ((myY > 810) || (myY < -10)) {
      myY = 400;
      myAngle = Math.random()*2*Math.PI;
    }
  }
}
