class AddModulePopup extends Popup{
  Grid masterGrid;
//ArrayList<Registrator> regs;
  AddModulePopup(Grid g){
    masterGrid = g;
    //regs = r;
    init();
  }
  void init(){
    entries.add(new Heading("Add New Module"));
    entries.add(new TextButton("Test",color(255,255,0),"test"));
    entries.add(new TextButton("Basic",color(255,255,0),"basic"));
    
   // for(Registrator r : regs){
   //   entries.add(r.get_entry());
   // }
    
  }
  void do_action(String act){
    masterGrid.module_selected(act);
    clear();
  }
  void clear(){
    masterGrid.popup=null;
  }
}




class DeletePopup extends Popup{
  ScriptRect modul;
  DeletePopup(ScriptRect modu){
    modul = modu;
    init();
  }
  void init(){
    entries.add(new Heading(modul.name));
    entries.add(new TextButton("Delete",color(255,0,0),"delete"));
  }
  void do_action(String act){
    if(act == "delete"){
      modul.delete();
      clear();
    }
  }
  void clear(){
    modul.masterGrid.popup=null;
  }
}
