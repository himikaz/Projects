class Ball {
  //initialising the variables 
  private int ballX, ballY;
  private int ballInc;
  private int ballDiameter;

  //default
  public Ball(int ballInc, int ballDiameter, int ballX, int ballY)
  {
    this.ballInc=ballInc;
    this.ballDiameter=ballDiameter;
    this.ballX=(int)random(screenSize);
    this.ballY=0;
  }

  public void drawBall()
  {

    // draw ball
    fill(255, 255, 255);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
  }

  public void updateBallPosition()
  {

    // update ball position
    ballY += ballInc;
  }


  // reset the ball to a random position at the top of the screen
  public void resetBallPositions()
  {
    ballX=(int)random(screenSize);
    ballY=0;
  }

  //getting the value of the x-coordinate of the ball
  public int getValuesOfBallX()
  {
    return ballX;
  }

  //getting the value of the y-coordinate of the ball
  public int getValuesOfBallY()
  {
    return ballY;
  }

  //getting the value of the diameter of the ball
  public int getValuesOfBallDiameter()
  {
    return ballDiameter;
  }
}
