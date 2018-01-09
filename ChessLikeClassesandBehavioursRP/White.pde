class WhiteSquare {
  int x;
  int y;
  int size;
  int col;
  float food;
boolean colorState;

  WhiteSquare(int x, int y, int size, boolean colorState) {
    this.x = x;
    this.y = y;
    this.size = size;

    this.colorState = colorState;
  }
}