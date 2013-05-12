class SS_StarscapeManager
// This class creates and holds a starscape canvas for use in backgrounds
{
  private PGraphics canvas;
  
  private SSGenSpace ssGenSpace;
  private SSGenStars ssGenStars;
  
  
  SS_StarscapeManager()
  {
    // Initialise graphics
    resizeCanvas(1024, 1024);
    
    // Initialise starscape generators
    ssGenSpace = new SSGenSpace(canvas);
    ssGenStars = new SSGenStars(canvas);
    
    // Generate the starscape
    generateStarscape();
  }
  
  
  public PImage getCanvas()
  // Returns the canvas externally
  // Although canvas is a PGraphics object,
  //   PGraphics is an implementation of PImage
  {
    return(canvas);
  }
  // getCanvas
  
  
  public void resizeCanvas(int res_x, int res_y)
  // Reinitialises the canvas
  // Loses all current visual data
  {
    // Initialise graphics
    canvas = createGraphics(res_x, res_y, JAVA2D);
  }
  // resizeCanvas
  
  
  public void generateStarscape()
  // Generates a starscape
  {
    // Execute generation calls
    
    // Set background
    ssGenSpace.render();
    
    // Set stars
    ssGenStars.render();
  }
  // generateStarscape
  
}
// StarscapeManager