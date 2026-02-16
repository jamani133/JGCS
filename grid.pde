class Grid{
  
    PVector size = new PVector(100,100); //target grid size, will be rounded to multiple of screen size
  
    boolean creating = false;
    PVector prv = new PVector(0,0);
    
    List<ScriptRect> modules = new ArrayList<ScriptRect>();
  
    void init(){
      size.x = float(width)/round(width/size.x);
      size.y = float(height)/round(height/size.y);
      modules.add(new ScriptRect(this,6,4,2,3));
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
        
        
        for(ScriptRect s : modules){ //render modules
            s.render();
        }
    }
    
    ScriptRect moduleAt(){ // get module at position in px
      return null;
    }

    void click(PVector i_pos){
        for(ScriptRect s : modules){
            s.click(i_pos);
        }
    }

    void click_special(PVector i_pos){
        for(ScriptRect s : modules){
            s.click_special(i_pos);
        }
    }
    
    void drag_start(PVector i_pos){
        for(ScriptRect s : modules){
            s.drag_start(i_pos);
        }
    }
    
    void drag(PVector i_pos){
        prv = i_pos;
        for(ScriptRect s : modules){
            s.drag(i_pos);
        }
    }
    
    void drag_end(PVector i_pos){
        for(ScriptRect s : modules){
            s.drag_end(i_pos);
        }
    }

    
}
