runningGround rg;


import controlP5.*;
ControlP5 cp;

int numBalls = 5;
float spring = 0.05;
float gravity = 1;
float friction = -0.5;
Ball[] balls = new Ball[numBalls];

void setup(){
  size(1000,1000);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(100, 150), i, balls);
  }
  rg = new runningGround(balls);
  UI();
}

void draw() {
  background(0);
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();  
  }
  rg.update();
  rg.display();
  
  
  surface.setTitle("frameRate: " + nfc(frameRate, 2));
  //saveFrame();
}
