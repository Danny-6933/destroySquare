Bird b;
int score;
boolean gameOver;

ArrayList<Cloud> clouds = new ArrayList<Cloud>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

void setup() {
  size(400,400);
  b = new Bird();
  score = 0;
  gameOver = false;
  clouds.add(new Cloud());
  pipes.add(new Pipe());
  
}
void draw() {
 background(85,140,240);
 
 for (int i = 0; i < clouds.size(); i+=2) {
  clouds.get(i).update();
  clouds.get(i).show();
 }
 
 if (frameCount % 100 == 0) {
  clouds.add(new Cloud());
 }
 
 b.show();
 b.update();
 
 for (int i = 0; i < pipes.size(); i+=3) {
   pipes.get(i).collide(b);
   pipes.get(i).update();
   pipes.get(i).show();
   if (b.x == pipes.get(i).x+30) {
    score ++;
   }
 }
 checkGameOver();
 if (gameOver) {
   endGame();
 }
 
 if (frameCount % 100 == 0) {
    pipes.add(new Pipe());
 }
 fill(0);
 textSize(40);
 textAlign(CENTER, CENTER);
 text(score, 15, 15);
}

void keyPressed() {
  b.jump();
}

void checkGameOver() {
  for (int i = 0; i < pipes.size(); i+=3) {
    if (pipes.get(i).collided) {
      gameOver = true;
    }
  }
}

void endGame() {
  noLoop();
  fill(200, 100, 50, 200);
  rect(-10, -10, width+15 ,height+15);
  fill(250,30,50);
  textSize(70);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/3);
  text("Score: " + score, width/2, height/2);
}

class Bird {
  int x;
  float y;
  float velocity;
  float gravity;
  int lift;
  
  Bird() {
    x = 50;
    y = 30;
    velocity = 0;
    gravity = .7;
    lift = 13;
  }
  
  void show() {
    noStroke();
    fill(235,176,34);
    ellipse(x,y,30,30);
  }
  
  void jump() {
    if (y > 0) {
      velocity -= lift;
      y += velocity;
    }
    
  }
  
  
  void update() {
    if (y < (height - 20)) {
      velocity += gravity;
      velocity *= .9;
      y += velocity;
    } else {
      velocity = 0;
    }
  }
}

class Pipe {
  int x;
  int top;
  int bottom;
  int w;
  int score;
  boolean collided;
  
  Pipe() {
    x = width;
    w = 40;
    top  = (int)(Math.random() * height/2);
    bottom = top + 150;
    score = 0;
    collided = false;
  }
  
  void show() {
    stroke(40,185,85);
    fill(50,200,100);
    rect(x, 0, w, top);
    rect(x-10,top,w+20,15);
    rect(x, bottom, w, (height-bottom));
    rect(x-10, bottom-15, w+20, 15);
  }
  
  void update() {
    x--;
  }
  
  void collide(Bird b) {
    int xPos = b.x + 14;
    float yPos = b.y;

    if (xPos >= x && xPos <= x+w) {
      if (yPos < top+25|| yPos > bottom-25) {
        collided =  true;
      }
    }
  }
}

class Cloud {
  int x;
  int y;
  
  Cloud() {
    x = 600;
    y = (int)(Math.random() * 100) + 5;
  }
  
  void show() {
    fill(255);
    noStroke();
    rect(x, y, 125, 40);
    ellipse(x, y, 80, 80);
    ellipse(x+125, y, 80, 80);
    ellipse(x+63, y-30, 80, 80);
  }
  
  void update() {
    x -= 2;
  }
}
