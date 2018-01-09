class BlackSquare {
  int x;
  int y;
  int size;
  int col;
  float food;
  boolean colorState;

  BlackSquare(int x, int y, int size, boolean colorState) {
    this.x = x;
    this.y = y;
    this.size = size;

    this.colorState = colorState;
  }

  void update() {
    if (colorState && this.food > 0) {
      this.food--;
    }
  }
}