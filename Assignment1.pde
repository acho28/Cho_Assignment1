PImage FG1;

boolean brush1 = false;
boolean brush2 = false;
int counter;

void setup() {
  size(displayWidth, displayHeight);
  background(191, 245, 255);
  rectMode(CENTER);
  imageMode(CENTER);
  FG1 = loadImage("FG1.png");
  FG1.resize(400, 0);
  for (int w=0; w<height; w+=20) {
    float size = random (25, 100);

    float x = random(width);
    float y = random(height);

    for (float ring = size; ring >= 0; ring -= random(2, 10)) {
      fill(random(256), random(256), random(256));
      ellipse(x, y, ring, ring);
    }
  }
}

void draw() {
  counter++;
  fill(0);
  textSize(20);
  text("Press Q for Character brush. Press W for Crenell brush. Press E to deselect. Press S to save. Press X to clear", 20, 40);
}

void mousePressed() {
  if (brush1 == true) {
    FG1Brush();
  }
}

void mouseDragged() {
  if (brush2 == true) {
    CrenellBrush();
  }
}

void keyPressed() {
  if (key == 'q' || key == 'Q') {
    brush1 = true;
    brush2 = false;
  }

  if (key == 'w' || key == 'W') {
    brush1 = false;
    brush2 = true;
  }

  if (key == 'e' || key == 'E') {
    brush1 = false;
    brush2 = false;
  }

  if (key == 's' || key == 'S') {
    saveFrame("drawing-######.png");
  }

  if (key == 'x' || key =='X') { 
    setup();
  }
}

void FG1Brush() {
  image(FG1, mouseX, mouseY);
}

void CrenellBrush() {
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(counter));
  noFill();
  stroke(255, 8, 231, 60);
  rect(0, 0, 50, 50); 
  popMatrix();
}
