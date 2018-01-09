GridSquare[][] grid;
WhiteSquare[][] WSquare;
BlackSquare[][] BSquare;
int rows;
int cols;
int gridSquareSize;
boolean colorState;


void setup() {

  size(400, 400);
  noStroke();
  rows = 8;
  cols = 8;
  gridSquareSize = 50;

  grid = new GridSquare[cols]rows];
  grid = new GridSquare[cols][rows];


  // do a double for loop to run through the grid 2D array
  // creating new alternating black and white GridSquare objects
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new GridSquare(i, j, gridSquareSize);
      WSquare[i][j] = new WhiteSquare(i, j, gridSquareSize, colorState);
      BSquare[i][j] = new BlackSquare(i, j, gridSquareSize, colorState);
    }
  }
}

void draw() {

  // every time daw runs, we want to go through the grid 2d array and update and render each GridSquare object
  // update represents getting hungry
  // render takes care of drawing
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].update();
      grid[i][j].render();
      BSquare[i][j].update();
    }
  }
  
  // example of modulo code
  
  boolean even;
  
  if(i%2 == 0) {
    even = true;
  }else{
    even = false;
  }
      
  

  // determine which grid slot mouse is over
    int currentHorizSquare = constrain(mouseX/gridSize, 0, 7);
  int currentVertSquare = constrain(mouseY/(gridSize/2), 0, 7);

  // do mouseOver-based feeding only on **valid** grid slots
  if (currentHorizSquare >= 0 && currentHorizSquare <= 7 && currentVertSquare >= 0 && currentVertSquare <= 7) {
    grid[currentHorizSquare][currentVertSquare].feed();
  }
}