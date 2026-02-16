class AddModulePopup extends Popup{
  Grid masterGrid;
  AddModulePopup(Grid g){
    masterGrid = g;
    init();
  }
  void init(){
    entries.add(new Heading("Add New Module"));
    entries.add(new TextButton("Test Module",color(255,255,0),"test"));
    entries.add(new TextButton("Empty",color(255,255,0),"empty"));
    
  }
  void do_action(String act){
    masterGrid.module_selected(act);
    masterGrid.popup = null;
  }
  void clear(){
    masterGrid.popup=null;
  }
}

class DeletePopup extends Popup{
  ScriptRect module;
  DeletePopup(ScriptRect mod){
    module = mod;
    init();
  }
  void init(){
    entries.add(new Heading(module.name));
    entries.add(new TextButton("Delete",color(255,0,0),"delete"));
  }
  void do_action(String act){
    if(act == "delete"){
      module.delete();
    }
  }
  void clear(){
    module.masterGrid.popup=null;
  }
}
