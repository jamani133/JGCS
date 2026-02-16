import java.util.*;

Grid grid = new Grid();

void setup(){
    size(1200,900);
    grid.init();
}

void draw(){
  mouseHandler();
  background(0);
  grid.render();
}
