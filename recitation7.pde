int face = 100;
float[] x = new float[face];
float[] y = new float[face];
int[] c1 = new int[face];
int[] c2 = new int[face];
float[] size = new float[face];
float[] speedX = new float[face];
float[] speedY = new float[face];

void setup(){
  size(600,600);
  background(255);
  for(int i = 0; i < face; i++){
    x[i] = random(width);
    y[i] = random(height);
    size[i] = random(50,200);
    c1[i] = color(random(255),random(255),random(255));
    c2[i] = color(random(255),random(255),random(255));
    speedX[i] = random(-10,10);
    speedY[i] = random(-10,10);
  }
  
}

void draw(){
  background(255);
  for (int i = 0; i < 100; i ++){
    display(x[i],y[i],size[i], c1[i], c2[i]);
    
    x[i] = x[i] + speedX[i];
    y[i] = y[i] + speedY[i];
    
    if (x[i]> width || x[i] < 0){
      speedX[i] = -speedX[i];
    }
    if (y[i]> height || y[i] < 0){
      speedY[i] = -speedY[i];
    }
  }
}

void display(float u, float v, float size, color c1, color c2) {
  noStroke();
  fill(c1);
  ellipse(u, v, size, size);
  fill(255);
  ellipse(u-size*0.3, v-size*0.1, 0.15*size, 0.15*size);
  ellipse(u+size*0.3, v-size*0.1, 0.15*size, 0.15*size);
  fill(c2);
  rect(u-size*0.35, v-size*0.05, 0.1*size, 0.5*size);
  rect(u+size*0.25, v-size*0.05, 0.1*size, 0.5*size);
  fill(255);
  arc(u, v + size * 0.25, size*0.55, size*0.55, PI, PI * 2);
}

void keyPressed(){
  if (key == ' '){
    for (int i = 0; i < 100; i ++){
      c1[i] = color(random(255),random(255),random(255));
      c2[i] = color(random(255),random(255),random(255));
    }
  }
}
