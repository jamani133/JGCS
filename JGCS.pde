import java.util.*;

Grid grid = new Grid();


PVector mouseDownPos = new PVector(0,0);
int mouseDownTime = 0;
boolean mousePrev = false;
boolean dragging = false;

void setup(){
    size(1900,900);
    grid.init();
}

void draw(){
  
  mouseHandler();
  
  
  
  background(0);
  grid.render();
}
