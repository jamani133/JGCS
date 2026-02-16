class ScriptRect{
  
    PVector pos = new PVector(100,100); //position of module in px
    PVector size = new PVector(100,100); //size of module in px
    boolean selected = false; //active module, used for keyboard
    PVector min_size = new PVector(1,1); //minimum size of module in px, will be rounded up to GU (grid unit)
    boolean resizing = false;
    boolean moving = false;
    PVector prv = new PVector(0,0);
    String name = "Basic Module, no function";
    boolean kms = false;
    
    Grid masterGrid;
    
    void render_content(){}
    void click_content(PVector i_pos){}
    void special_click_content(PVector i_pos){}
    void drag_start_content(PVector i_pos){}
    void drag_content(PVector i_pos){}
    void drag_end_content(PVector i_pos){}
    
    
    ScriptRect(Grid g, int px, int py, int sx, int sy){
      masterGrid = g;
      min_size = snapUp2D(min_size,g.size); //round to next GU
      reposition(px,py,sx,sy);
      
      
    }

    
    void render(){
        fill(0);
        stroke(selected?120:60);
        strokeWeight(3);
        rect(pos.x+2,pos.y+2,size.x-4,size.y-4,3);
        fill(selected?120:60);
        noStroke();
        triangle(pos.x+size.x-2,pos.y+size.y-2,   pos.x+size.x-30,pos.y+size.y-2,      pos.x+size.x-2,pos.y+size.y-30);
        rect(pos.x+2,pos.y+2,25,25,3);
        render_content();
      
        if(moving){
            noFill();
            stroke(100,255,0);
            strokeWeight(2);
            rect(prv.x,prv.y,size.x,size.y,5);
        }
        if(resizing){
            noFill();
            stroke(100,255,0);
            strokeWeight(2);
            rect(pos.x,pos.y,max(min_size.x,prv.x-pos.x),max(min_size.y,prv.y-pos.y),5);
        }
    }

    void click(PVector i_pos){
        if(i_pos.x < pos.x || pos.x+size.x < i_pos.x || i_pos.y < pos.y || pos.y+size.y < i_pos.y || masterGrid.click_used){
          selected = false;
          return;
        }
        
        selected = true;
        click_content(i_pos);
        masterGrid.click_used = true;
    }

    void click_special(PVector i_pos){
        if(i_pos.x < pos.x || pos.x+size.x < i_pos.x || i_pos.y < pos.y || pos.y+size.y < i_pos.y || masterGrid.click_used){
          selected = false;
          return;
        }
        selected = true;
        masterGrid.click_used = true;
        if(i_pos.x > pos.x && i_pos.y > pos.y && i_pos.x < pos.x+25 && i_pos.y < pos.y+25){
            masterGrid.popup = new DeletePopup(this);
            return;
        }
        
        special_click_content(i_pos);
        
    }
    
    void drag_start(PVector i_pos){
        if(i_pos.x < pos.x || pos.x+size.x < i_pos.x || i_pos.y < pos.y || pos.y+size.y < i_pos.y || masterGrid.click_used){
          selected = false;
          return;
        }
        masterGrid.click_used = true;
        selected = true;
        if(i_pos.x < pos.x+size.x && i_pos.y < pos.y+size.y && (pos.x+size.x-i_pos.x) + (pos.y+size.y-i_pos.y) < 30 ){
            resizing = true;
            prv = i_pos;
            return;
        }
        if(i_pos.x > pos.x && i_pos.y > pos.y && i_pos.x < pos.x+25 && i_pos.y < pos.y+25){
            moving = true;
            prv = i_pos;
            return;
        }
        drag_start_content(i_pos);
        
    }
    
    void drag(PVector i_pos){
        prv = i_pos;
        if(resizing || moving  || masterGrid.click_used){
          return;
        }
        drag_content(i_pos);
    }
    
    void drag_end(PVector i_pos){
        if(masterGrid.click_used){
          return;
        }
        if(resizing){
            resizing = false;
            size.x = max(min_size.x,  snapRound(i_pos.x-pos.x,masterGrid.size.x));
            size.y = max(min_size.y,  snapRound(i_pos.y-pos.y,masterGrid.size.y));
            return;
        }
        if(moving){
            moving = false;
            pos = snapRound2D(i_pos,masterGrid.size);
            return;
        }
        drag_end_content(i_pos);
    }

    void reposition(int px,int py, int sx, int sy){ //set position in GU
        pos.x = px*masterGrid.size.x;
        pos.y = py*masterGrid.size.y;
        size.x = max(min_size.x,sx*masterGrid.size.x);
        size.y = max(min_size.x,sy*masterGrid.size.y);
    }
    
    void delete(){
        kms=true;
        masterGrid.popup = null;
        masterGrid.checkKills();
    }
}
