SS_StarscapeManager starscape_manager;


void setup()
{
  size(1024, 768, JAVA2D);
  
  starscape_manager = new SS_StarscapeManager(width, height);
}


void draw()
{
  image(starscape_manager.getCanvas(), 0,0);
}
