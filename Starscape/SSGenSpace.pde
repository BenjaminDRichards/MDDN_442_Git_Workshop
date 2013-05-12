class SSGenSpace extends SSGen
// Space background generator (cosmic microwave background)
{
  color bgCol;
  
  SSGenSpace(PGraphics canvas)
  {
    super(canvas);
    
    bgCol = color(0,0,0);
  }
  
  
  public void render()
  // Override default method
  {
    getCanvas().beginDraw();
    getCanvas().background(bgCol);
    getCanvas().endDraw();
  }
  // render
  
}
// SSGenSpace
