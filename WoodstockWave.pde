float arcStart;
float arcEnd;
int diameter;
float maxArcEnd = radians(360);
float movement = 0.0;
float speed = PI/100;
int i;

void setup() {
  size(400, 400);
  background(23,73,26);
  noFill();
  stroke(73,123,76);
  strokeWeight(3);
  arcStart = radians(0);
  arcEnd = arcStart;
}

void draw() {
  background(23,73,26);
  fill(73,123,76);
  ellipse(200,200,60,60);
  i = 0;
  diameter =575;
  noFill();
  
  while (diameter >= 60) {
    arcEnd = map(tan(movement + (maxArcEnd / diameter * i)), -1, 1, arcStart, maxArcEnd);
    arc(200, 200,diameter, diameter, arcStart, arcEnd);
    diameter -= 20;
    i ++;
  }
   //arcEnd += radians(1); 
   movement += speed;


}
