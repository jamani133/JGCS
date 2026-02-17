class Test extends ScriptRect {
    Test(Grid g) {
        super(g);
        name = "Test Module";
        module_id = "test";
    }
  
    void render_content() {
        fill(255);
        textAlign(CENTER,CENTER);
        textSize(size.y);
        text(millis(), pos.x+(size.x/2), pos.y+(size.y/2));
    }
 
    void click_content(PVector i_pos){}
    void special_click_content(PVector i_pos){}
    void drag_start_content(PVector i_pos){}
    void drag_content(PVector i_pos){}
    void drag_end_content(PVector i_pos){}
    JSONObject export_content_config() {JSONObject cdata = new JSONObject(); return cdata;}
    void configure_content(JSONObject cdata) {}
}
