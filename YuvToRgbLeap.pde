/*
118. name=Leap Motion,size=640x480,fps=45
119. name=Leap Motion,size=680x286,fps=70
120. name=Leap Motion,size=800x800,fps=24
121. name=Leap Motion,size=400x400,fps=85
122. name=Leap Motion,size=384x384,fps=90
123. name=Leap Motion,size=368x368,fps=100
*/

void setup() {
  size(640, 480, P2D);
  
  setupCam();
}

void draw() {
  updateCam();
}
