PImage img;

void setup()
{
  size(800, 800);
  loadPixels();
  //load the image of Van Gogh's self-portrait in processing
  img=loadImage("img.jpg");
  //resize the width and height of the image to the size of the window
  img.resize(width, height);
}

// set step as 1 to ensure that for loop works
float step=1; 
// set a variable for the color
color c;
float angle;
float b;

void draw()
{
  //set the color of background of the window as back
  background(0);
  // the angle of the image change with the position of mouse
  if (mousePressed) 
  { 
    //mouseY was converted from a value in the range of 0 to height into a value in the range of 1 to 180
    angle=map(mouseY, 0, height, 1, 180);
  }
  //mouseX was converted from a value in the range of 0 to width into a value in the range of 1 to 180, which influence the final position of the image
  //change the value of step to change the final size of the image 
  step=map(mouseX, 0, width, 1, 180);
  //nested for() loops
  //meet the outer loop condition that i<the width of the image
  //then enter the inner for() loop
  for (float i=0; i<img.width; i+=step) 
  {
    // keep looping until the value of j>= img.height, exit this loop, start executing the outer for() loop
    for (float j=0; j<img.height; j+=step) 
    {
      // get the color of the image
      c=img.get(int(i), int(j));
      //set b as the judgment condition for rotation
      b =brightness(c);

//save the current setting and change of image 
      push();
      //change the position of image
      //keep the image immovable with full screen
      translate(width/2, height/2);
      // convert degrees to radians
      rotate(radians(angle));
      
      push();
      //make the image movable with float
      translate(i-width/2, j-height/2);
      //set an expression with the change of the brightness of the image
      if (b<500) 
      {
        rotate(radians(angle));
      } 
      else 
      {
        rotate(radians(45));
      }
      //fill the current shapes with the color got before
      fill(c);
      noStroke();
      //set the size of the rectangle with the change of the location of the mouse
      rect(0, 0, step, step);
      //restore the original settings of the image
      pop();
      pop();
    }
  }
}
