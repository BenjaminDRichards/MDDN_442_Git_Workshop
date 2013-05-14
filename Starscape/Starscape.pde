SS_StarscapeManager starscape_manager;


void setup()
{
  size(1024, 768, JAVA2D);
  
  starscape_manager = new SS_StarscapeManager(width, height);
}


void draw()
{
  // Create feature offset
  PVector featureOffset = new PVector( 1 * sin(frameCount * 0.01),  1 * cos(frameCount * 0.01),  0);
  starscape_manager.moveView(featureOffset);
  starscape_manager.generateStarscape();
  
  image(starscape_manager.getCanvas(), 0,0);
  
  // Render
  //save("renders/frame" + nf(frameCount, 6) + ".png");
}
