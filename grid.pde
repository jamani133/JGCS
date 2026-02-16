class Grid{
  
    PVector size = new PVector(80,80); //target grid size, will be rounded to multiple of screen size
  
    boolean creating = false;
    PVector prv = new PVector(0,0);
    boolean click_used = false;
    PVector new_module_end = new PVector(0,0);
    PVector new_module_start = new PVector(0,0);
    List<ScriptRect> modules = new ArrayList<ScriptRect>();
    Popup popup = null;
    void init(){
      size.x = float(width)/round(width/size.x);
      size.y = float(height)/round(height/size.y);
    }
    
    void popup_render(){
      if(popup != null){
        popup.render();
      }
    }
    
    void popup_click(PVector i_pos){
      if(popup != null){
        popup.click(i_pos);
      }
    }
  
    void render(){
        stroke(80);
        strokeWeight(2);
        for(int i = 1; i<width/size.x;i++){
            for(int j = 1; j<height/size.y;j++){
                line(i*size.x+3,j*size.y,i*size.x-3,j*size.y);  //render grid BG
                line(i*size.x,j*size.y+3,i*size.x,j*size.y-3);
            }
        }
        

        for(int i = modules.size() - 1; i >= 0; i--){ //render modules
            modules.get(i).render();
        }
        
        
        popup_render();
        
    }
    
    void checkKills(){
      for(int i = modules.size() - 1; i >= 0; i--){
        if(modules.get(i).kms){
          modules.remove(i);
        }
      }
    }
    
    ScriptRect moduleAt(){ // get module at position in px
      return null;
    }

    void click(PVector i_pos){
        if(popup != null){
          popup.click(i_pos);
          return;
        }
        for(ScriptRect s : modules){
            s.click(i_pos);
        }
    }

    void click_special(PVector i_pos){
        if(popup != null){
          return;
        }
        for(ScriptRect s : modules){
            s.click_special(i_pos);
        }
    }
    
    void drag_start(PVector i_pos){
        if(popup != null){
          return;
        }
        for(ScriptRect s : modules){
            s.drag_start(i_pos);
        }
        if(!click_used){
          new_module_start = i_pos;
          creating = true;
        }
    }
    
    void drag(PVector i_pos){
        prv = i_pos;
        if(popup != null){
          return;
        }
        if(creating){
          new_module_end = i_pos;
          return;
        }
        for(ScriptRect s : modules){
            s.drag(i_pos);
        }
    }
    
    void drag_end(PVector i_pos){
        if(creating){
          new_module_end = i_pos;
          creating = false;
          popup = new AddModulePopup(this);
        }
        for(ScriptRect s : modules){
            s.drag_end(i_pos);
        }
    }

    void module_selected(String id){
      int px = round(new_module_start.x/size.x);
      int py = round(new_module_start.y/size.y);
      int sx = round((new_module_end.x-new_module_start.x)/size.x);
      int sy = round((new_module_end.y-new_module_start.y)/size.y);
      if(id == "test"){
        modules.add(new Test(this,px,py,sx,sy));
      }
      if(id == "empty"){
        modules.add(new ScriptRect(this,px,py,sx,sy));
      }
    }
    
}
