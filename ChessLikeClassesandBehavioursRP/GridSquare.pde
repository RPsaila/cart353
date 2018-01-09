class GridSquare {

  int x;
  int y;
  int size;
  int col;
  float food;

  GridSquare(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;

    // establish a random amount of food to start with
    this.food = random(500, 1000);

    if (WhiteSquare) {
      this.col = 255;
    } else {
      this.col = 0;
    }
  }

  void render() {

    // if it is a black square
    if (BlackSquare) {

      // reflect the amount of food
      col = (int)map(this.food, 0, 1000, 255, 0);
    }

    fill(col, 10);
    rect(this.x * size, this.y * size, size, size);
  }

  void update() {
    WSquare[i][j].update();
    BSquare[i][j].update();
  }
}

void feed() {
  if (this.black && this.food < 1000) {
    this.food += 10;
  }
}