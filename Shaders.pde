PShader shader_yuv;
PGraphics tex;

PVector shaderMousePos = new PVector(0,0);
PVector shaderMouseClick = new PVector(0,0);

float threshold = 0.15;

void setupShaders() {
  tex = createGraphics(width, height, P2D);

  shader_yuv = loadShader("yuv_to_gray.glsl"); 
  
  shaderSetSize(shader_yuv);
  shader_yuv.set("threshold", threshold);
}

void updateShaders() {
    shaderSetTexture(shader_yuv, "tex0", cam);
}

//void drawShaders() {
  //filter(shader);
//}

// ~ ~ ~ ~ ~ ~ ~

void shaderSetVar(PShader ps, String name, float val) {
    ps.set(name, val);
}

void shaderSetSize(PShader ps) {
  ps.set("iResolution", float(width), float(height), 1.0);
}

void shaderSetMouse(PShader ps) {
  if (mousePressed) shaderMousePos = new PVector(mouseX, height - mouseY);
  ps.set("iMouse", shaderMousePos.x, shaderMousePos.y, shaderMouseClick.x, shaderMouseClick.y);
}

void shaderSetTime(PShader ps) {
  ps.set("iGlobalTime", float(millis()) / 1000.0);
}

void shaderMousePressed() {
  shaderMouseClick = new PVector(mouseX, height - mouseY);
}

void shaderMouseReleased() {
  shaderMouseClick = new PVector(-shaderMouseClick.x, -shaderMouseClick.y);
}

void shaderSetTexture(PShader ps, String name, PImage tex) {
  ps.set(name, tex);
}
