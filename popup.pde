class Popup{
  List<TextButton> entries = new ArrayList<TextButton>();
  
  
  void render(){
    fill(0,0,0,80);
    noStroke();
    rect(0,0,width,height);
    fill(100,100,100,160);
    stroke(100,100,100,255);
    rect(width/2-220,(height/2)-(((entries.size()*60)+60)/2),440,(entries.size()*60)+10,10);
    for(int i = 0; i < entries.size(); i++){
      entries.get(i).render(new PVector(width/2,(height/2)-(30*entries.size())+(i*60)));
    }
  }
  void do_action(String act){}
  
  void clear(){}
  
  void click(PVector i_pos){
    if(i_pos.x < width/2-220 || width/2+220 < i_pos.x || i_pos.y < (height/2)-(((entries.size()*60)+60)/2) || (height/2)+(30*entries.size())-20 < i_pos.y){
      clear();
    }
    for(int i = 0; i < entries.size(); i++){
      if(entries.get(i).checkCol(  new PVector(width/2,(height/2)-(30*entries.size())+(i*60)),i_pos)){
        if(entries.get(i).action == ""){return;}
        do_action(entries.get(i).action);
        return;
      }
      
    }
  }
}


class TextButton{
  String text = "text";
  String action = "";
  color col = color(255,0,0);
  TextButton(String textt,color c,String act){
    text = textt;
    col = c;
    action = act;
  }
  void render(PVector pos){
    stroke(col);
    if(checkCol(pos,new PVector(mouseX,mouseY))){
      fill(red(col)*0.5,green(col)*0.5,blue(col)*0.5);
    }else{
      fill(red(col)*0.7,green(col)*0.7,blue(col)*0.7);
    }
    strokeWeight(3);
    rect(pos.x-200,pos.y-20,400,40,8);
    fill(255);
    textSize(32);
    textAlign(CENTER,CENTER);
    text(text,pos.x,pos.y);
  }
  boolean checkCol(PVector pos, PVector mouse){
    return mouse.x < pos.x+200 && mouse.x > pos.x-200 && mouse.y < pos.y+20 && mouse.y > pos.y-20;
  }
}


class Heading extends TextButton{
  Heading(String txt){
    super(txt,0,"");
  }
  void render(PVector pos){
    fill(255);
    textSize(32);
    textAlign(CENTER,CENTER);
    text(text,pos.x,pos.y);
  }
}
