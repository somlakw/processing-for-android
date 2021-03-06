PShape base;

void drawBase() {
  pushMatrix();
  translate(0, +300, 0);
  rotateY(angle);
  shape(base);
  popMatrix();
}  

void createBase(float r, float h, int ndiv) {
  base = createShape(GROUP);
  PShape side = createShape();
  side.beginShape(QUAD_STRIP);
  side.noStroke();
  side.fill(#59C5F5);
  for (int i = 0; i <= ndiv; i++) {
    float a = map(i, 0, ndiv, 0, TWO_PI);
    float x = r * cos(a); 
    float z = r * sin(a);
    side.vertex(x, +h/2, z);
    side.vertex(x, -h/2, z);    
  }
  side.endShape();
  PShape top = createShape();
  top.beginShape(TRIANGLE_FAN);
  top.noStroke();
  top.fill(#59C5F5);
  top.vertex(0, 0, 0);
  for (int i = 0; i <= ndiv; i++) {
    float a = map(i, 0, ndiv, 0, TWO_PI);
    float x = r * cos(a); 
    float z = r * sin(a);
    top.vertex(x, -h/2, z);   
  }  
  top.endShape();  
  base.addChild(side);
  base.addChild(top);
}