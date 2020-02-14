class HolesAndBars
{
  //initialising the variables 
  private int holeX;
  private int barHeight=50;
  private int screenSize=600;
  private int holeY = screenSize/2 - barHeight/2 - 15;
  private int hole2X = (int)random(screenSize);
  private int hole2Y = screenSize/2+85;

  //default
  public HolesAndBars(int barHeight, int screenSize, int holeY, int hole2X, int hole2Y)
  {
    this.barHeight = barHeight;
    this.screenSize = screenSize;
    this.holeY = holeY;
    this.hole2X = hole2X;
    this.hole2Y = hole2Y;
  }

  public void drawHolesAndBars()
  {
    // draw bar
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(0, screenSize/2 - barHeight/2, screenSize, barHeight);

    // draw hole in bar
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(holeX, screenSize/2, barHeight, barHeight);

    //draw second bar
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(0, (screenSize/2 - barHeight/2)+125, screenSize, barHeight);

    // draw hole in second bar
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(hole2X, screenSize/2+125, barHeight, barHeight);
  }


  // reset the hole positions
  public void resetHolePositions()
  {
    holeX=screenSize/2;
    hole2X = (int)random(screenSize);
  }

  //moving the holes
  public void keyPressed()
  {
    if (keyPressed)
    {
      // handle keyboard input
      if (key == 'S' || key == 's')
      {
        holeX += 5;
      } else if (key == 'A' || key == 'a')
      {
        holeX -= 5;
      } else if (key == 'X' || key == 'x')
      {
        hole2X += 5;
      } else if (key == 'Z' || key == 'z')
      {
        hole2X -= 5;
      }
    }
  } 


  //getting x-coordinate of hole 1
  public int getValuesOfHoleX()
  {
    return holeX;
  }

  //getting y-coordinate of hole 1
  public int getValuesOfHoleY()
  {
    return holeY;
  }

  //getting x-coordinate of hole 2
  public int getValuesOfHole2X()
  {
    return hole2X;
  }

  //getting y-coordinate of hole 2
  public int getValuesOfHole2Y()
  {
    return hole2Y;
  }
}
