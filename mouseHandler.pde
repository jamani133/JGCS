PVector mouseDownPos = new PVector(0,0);
int mouseDownTime = 0;
boolean mousePrev = false;
boolean dragging = false;

void mouseHandler(){                            //do the mouse shit and give to grid
  PVector mouse = new PVector(mouseX,mouseY);
  if(mousePressed && !mousePrev){
    //new press
    mouseDownTime = millis();
    mouseDownPos = mouse;
  }
  if(!mousePressed && mousePrev){
    //released
    if(!dragging){
      if(millis() - mouseDownTime > 200){
        //special click
        grid.click_special(mouse);
      }else{
        //normal click
        grid.click(mouse);
      }
    }else{
      //end of drag
      grid.drag_end(mouse);
      dragging = false;
    }
  }
  if(mousePressed && (dragging || abs(mouseX-mouseDownPos.x)>2 || abs(mouseX-mouseDownPos.x)>2)){
    if(!dragging){
      //start of drag
      grid.drag_start(mouseDownPos);
      dragging = true;
    }else{
      //drag
      grid.drag(mouse);
    }
  }
  mousePrev = mousePressed;
  grid.click_used = false;
}
