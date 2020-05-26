int arrowWidth = 100; //width of all the arrows
int arrowHeight = 100; //height of all the arrows
float speed = 0;
float direction = 0;
int y;
void setup()
{
  size(1500,1000);
  fill(0);
}

void draw()
{
  background(255);
  
  for(int downY=-100;downY<height;downY+=arrowHeight*2)
  {
    for(int downX=100;downX<width;downX+=arrowWidth*2)
    {
    fill(0);
    strokeWeight(1);

    beginShape(); //arrow pointing downwards
    vertex(downX, downY - speed);                                        //1st vertex
    vertex(downX+arrowWidth/2, downY+arrowHeight/2 - speed);             //2nd vertex
    vertex(downX+arrowWidth, downY - speed);                             //3rd vertex
    vertex(downX+arrowWidth, downY+arrowHeight - speed);                 //4th vertex
    vertex(downX+arrowWidth/2, downY+arrowHeight+arrowHeight/2 - speed); //5th vertex
    vertex(downX, downY+arrowHeight - speed);                            //6th vertex
    endShape(CLOSE);
    }
  }
  
  for(int upY=0;upY<=height;upY+=arrowHeight*2)
  {
    for(int upX=0;upX<=width;upX+=arrowWidth*2)
    {
    fill(0);
    strokeWeight(1);
  
    beginShape(); //arrow pointing upwards
    vertex(upX, upY+speed);                              //1st vertex
    vertex(upX+arrowWidth/2, upY-arrowHeight/2+speed);   //2nd vertex
    vertex(upX+arrowWidth, upY+speed);                   //3rd vertex
    vertex(upX+arrowWidth, upY+arrowHeight+speed);       //4th vertex
    vertex(upX+arrowWidth/2, upY+arrowHeight/2 + speed); //5th vertex
    vertex(upX, upY+arrowHeight+speed);                  //6th vertex
    endShape(CLOSE);
    }
  }
  
  speed = (speed+1.5) *direction;
  if(speed<100)
  {
    direction =1;
  }

  if(speed>=100)
  {
    direction =-1;
  }
  
}
