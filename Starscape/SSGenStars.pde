class SSGenStars extends SSGen
{


  SSGenStars(PGraphics canvas)
  {
    super(canvas);
  }


  public void render()
  {
    getCanvas().beginDraw();

    // Draw some stars

    // Style
    getCanvas().fill(255);
    getCanvas().noStroke();
    
    /*
    // Draw
    for (int i = 0;  i < 1024;  i++)
    {
      float x = random(getCanvas().width);
      float y = random(getCanvas().height);
      float r = 8 * pow( random(1), 3);
      getCanvas().ellipse(x, y, r, r);
    }
    */
    drawDrunkStars(1024);
    
    
    getCanvas().endDraw();
  }
  // render
  
  
  /*
  
  Devise galactic L-system
  
  We don't need an entire galaxy. We just want to be positioned within a starfield.
  
  This means 3-dimensional space. And most of it will probably be behind the viewer, oh well.
  
  Let's use a drunken walker to deposit stellar clusters for now.
  
  */
  
  
  private void drawDrunkStars(int pop)
  // Simple looped drunk-walk star drawist
  {
    float x = getCanvas().width / 2.0;
    float y = getCanvas().height / 2.0;
    float z = 0;
    
    PVector pos = new PVector(x, y, z);
    PVector posLast = pos.get();
    
    for(int i = 0;  i < pop;  i++)
    {
      // Record history
      posLast = pos.get();
      
      // Step in a random direction
      float step = random(getCanvas().width * 0.5) * pow(random(1.0), 2);
      PVector dir = PVector.random3D();
      dir.mult(step);
      pos.add(dir);
      x = pos.x;
      y = pos.y;
      z = pos.z;
      
      // Constrain to texture
      x = abs(x);
      y = abs(y);
      z = abs(z);
      x = x % getCanvas().width;
      y = y % getCanvas().height;
      z = z % getCanvas().height;  // No Z barrier available
      pos.set(x,y,z);
      
      // Determine visible radius
      float zNorm = z / float(getCanvas().height);
      float r = pow(zNorm, 2);
      float randomAbsoluteMagnitude = random(8);
      float rr = r * randomAbsoluteMagnitude;
      
      // Draw star
      getCanvas().ellipse(x, y, rr, rr);
      
      // Draw connection lines
      getCanvas().stroke(255,0,0,64);
      getCanvas().line(pos.x, pos.y,  posLast.x, posLast.y);
      getCanvas().noStroke();
    }
  }
  // drawDrunkStars
  
  
  
  /*
  
  // Template for L-system used to grow starfields
  
  void drawFractalTree()
  // Constructs the instruction string and renders it
  {
    // Construct instruction string
    int maxDepth = 10;
    int depth = int(maxDepth * mouseY / height) + 1;
    String instructions = createInstructionsFractalTree(depth);
    // Diagnose instruction string
    println("Instruction: " + instructions);
    
    
    // Stylise
    stroke(255);
    
    
    // Compute nice segment length parameter
    // Look at the initial stem length, which will be about half the total size
    // Set default length:
    float len = 8;
    
    // Diagnose initial stem
    int count = 0;
    for(int i = 0;  i < instructions.length();  i++)
    {
      if(instructions.charAt(i) == '1')
      {
        // The stem is still growing
        count++;
      }
      else
      {
        // The stem has split or swerved
        break;
      }
    }
    // Set length
    len = 0.5 * height / (float)count;
    
    
    
    // Parse instruction string to render
    for(int i = 0;  i < instructions.length();  i++)
    {
      // Get character at cursor
      char c = instructions.charAt(i);
      
      // Execute draw instruction
      switch(c)
      {
        case '0':
          // Draw terminating branch
          line(0, 0,  0, len);
          translate(0, len);
          break;
        case '1':
          // Draw non-terminating branch
          // Currently identical to terminating branch
          line(0, 0,  0, len);
          translate(0, len);
          break;
        case '[':
          // Create left branch
          pushMatrix();
          rotate(-QUARTER_PI);
          break;
        case ']':
          // Create right branch
          popMatrix();
          rotate(QUARTER_PI);
          break;
        default:
          break;
      }
    }
  }
  // drawFractalTree
  
  
  String createInstructionsFractalTree(int depth)
  // Applies grammar to construct an instruction string 
  {
    // Initialise instruction string
    String instructions = "0";
    
    // Iterate over instructions
    for(int j = 0;  j < depth;  j++)
    {
      
      // Create cache for new instructions
      // We use this because we cannot guarantee that the instructions will remain the same size as we iterate
      ArrayList instructionFragments = new ArrayList();
      
      // Step through instructions
      for(int i = 0;  i < instructions.length();  i++)
      {
        // Get character at cursor
        char c = instructions.charAt(i);
        
        // Apply rules
        switch(c)
        {
          case '0':
            instructionFragments.add("1[0]0");
            break;
          case '1':
            instructionFragments.add("11");
            break;
          default:
            instructionFragments.add(""+c);
            break;
        }
      }
      
      // Compile fragments into new instruction string
      instructions = "";
      for(int i = 0;  i < instructionFragments.size();  i++)
      {
        instructions += (String) instructionFragments.get(i);
      }
      
    }
    
    // Complete function
    return(instructions);
  }
  // createInstructionsFractalTree

*/

}
// SSGenStars

