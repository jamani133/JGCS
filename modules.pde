class Test extends ScriptRect {
  Test(Grid g, int px, int py, int sx, int sy) {
    super(g, px, py, sx, sy);
    name = "Test Module";
  }
  
  
  
  
  void render_content() {
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(size.y);
    text(millis(), pos.x+(size.x/2), pos.y+(size.y/2));
  }
  
  
}
