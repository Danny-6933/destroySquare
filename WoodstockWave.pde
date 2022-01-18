  int status; 
  float pos;
  float speed;
  // 0 = in shape square
  // 1 = being destroyed
  // 2 = destroyed
Box theBox;

void setup() {
  size(600,600);
  background(82,122,67);
  rectMode(CENTER);
  status = 0;
  theBox = new Box();
  pos = -20;
  speed = 0;
}
void draw() {
    background(82,122,67);
  if (pos < 420) {
    ellipse(300,pos,40,40);
    pos += speed;
    speed += .1;
    theBox.show();
  } else {
    ellipse(300,pos,40,40);
    pos += speed;
    speed += .1;
    theBox.destroy();
  }
}

class Box {
  int x;
  int y;
  int Size;
  float yPos;
  float xLeft;
  float xRight;
  float move;

  
  Box () {
    Size = 160;
    x = width/2;
    y = height - Size/2;
    yPos = height - Size;
    xLeft = width/2;
    xRight = width/2;
    move = 0.5;

  }
  void show() {
    rect(x,y,Size,Size);
  }
  void destroy() {
    triangle(x,y-Size/2,x-Size/2,height,x+Size/2,height);
    triangle(xLeft,yPos,xLeft-Size/2,yPos,xLeft-Size/2,yPos+Size);
    triangle(xRight,yPos,xRight+Size/2,yPos,xRight+Size/2,yPos+Size);
    if (yPos <= height) {
      xLeft -= move;
      xRight += move;
      yPos += move * 2;
      move *= 1.1;
    }
  }
  void wreck() {
   triangle(x,y-Size/2,x-Size/2,height,x+Size/2,height);

  }
}
