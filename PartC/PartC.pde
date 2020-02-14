import processing.sound.*; //importing the sound library
//initialising the sound variables 
SoundFile backgroundMusic; 
SoundFile pointSoundEffect;
SoundFile collisionSoundEffect;
Ball ball; //initialising the ball variable 
HolesAndBars holesAndBars; //initialising the holesAndBars variable
int barHeight=50;
int screenSize=600;
int score=0;

void settings()
{
  size(screenSize, screenSize);
}

void setup()
{
  frameRate(30);
  noStroke();
  textSize(32);

  //creating a new Ball object
  ball = new Ball(2, 30, (int)random(screenSize), 0); 
  //creating a new HolesAndBars object
  holesAndBars = new HolesAndBars(50, 600, screenSize/2 - barHeight/2 - 15, (int)random(screenSize), screenSize/2+85);  

  ball.resetBallPositions(); //resetting the ball postion
  holesAndBars.resetHolePositions(); //resetting the hole positions

  backgroundMusic = new SoundFile(this, "8 Bit Music.wav"); //getting the background music file
  backgroundMusic.amp(0.75); //setting the volume to 0.75
  backgroundMusic.rate(1.25); //increasing the rate by 1.25
  backgroundMusic.play(); //playing the background music from the starting
  backgroundMusic.loop(); //putting the background music on a loop

  pointSoundEffect = new SoundFile(this, "Point.wav"); //getting the point sound effect file 
  pointSoundEffect.amp(0.10); //setting the volume to 0.10

  collisionSoundEffect = new SoundFile(this, "Collision.wav"); //getting the collision sound effect file 
  collisionSoundEffect.amp(0.10); //setting the volume to 0.10
}



void draw()
{


  background(0, 0, 255);

  // write score
  fill(255, 255, 255);
  text(score, screenSize/2, 40);

  //drawing both of the holes and bars
  holesAndBars.drawHolesAndBars();

  //drawing the ball
  ball.drawBall();

  //making the bars and holes move
  holesAndBars.keyPressed();

  // detect collisions between ball and bar
  if (collisionDetected())
  {
    ball.resetBallPositions();
    holesAndBars.resetHolePositions();

    //playing the collision sound effect if collision is detected
    collisionSoundEffect.play();
  }

  //updates the ball position 
  ball.updateBallPosition();

  // update score and reset if necessary
  if (ball.getValuesOfBallY() >= screenSize - ball.getValuesOfBallDiameter()/2)
  {
    score++;
    ball.resetBallPositions();
    holesAndBars.resetHolePositions();

    //plays the point sound effect if the user gets a point
    pointSoundEffect.play();
  }
}


//detects the collision
boolean collisionDetected()
{
  boolean collision = false;

  //this is checking if the y-coordinate of the ball is equal to the y-coordinate of the first hole
  if (ball.getValuesOfBallY()>=holesAndBars.getValuesOfHoleY())  
  {
    //checking if the ball's x-coordinate is in the x-coordinate range of the first bars 
    if ( ( (ball.getValuesOfBallX()>0) && (ball.getValuesOfBallX()-15 < (holesAndBars.getValuesOfHoleX()-26)) ) || ( (ball.getValuesOfBallX()+15 > (holesAndBars.getValuesOfHoleX()+26)) && (ball.getValuesOfBallX()<screenSize) ) ) 
    {
      collision = true;
    }
  }
  //checking if the ball has passed the first bars and hole and is in the space between the first and the second bar so that it is not affected by the movement of the first hole and bars when the ball is under it
  if ( (ball.getValuesOfBallY() > (holesAndBars.getValuesOfHoleY()+50)) && (ball.getValuesOfBallY()<holesAndBars.getValuesOfHole2Y()) )
  {
    collision = false;
  }

  //this is checking if the y-coordinate of the ball is equal to the y-coordinate of the second hole
  if (ball.getValuesOfBallY()>=holesAndBars.getValuesOfHole2Y()) 
  {
    //checking if the ball's x-coordinate is in the x-coordinate range of the second bars 
    if ( ( (ball.getValuesOfBallX()>0) && (ball.getValuesOfBallX()-15 < (holesAndBars.getValuesOfHole2X()-26)) ) || ( (ball.getValuesOfBallX()+15 > (holesAndBars.getValuesOfHole2X()+26)) && (ball.getValuesOfBallX()<screenSize) ) ) 
    {
      collision = true;
    }
  }
  //checking if the ball has passed the second bars and hole and is in the space after the second bar so that it is not affected by the movement of the second hole and bars when the ball is under it
  if (ball.getValuesOfBallY() > (holesAndBars.getValuesOfHole2Y()+50)) 
  {
    collision = false;
  }

  return collision;  //returning the variable collision
}  
