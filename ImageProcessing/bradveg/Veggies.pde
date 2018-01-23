class VeggieImg {

  //Variables for position
  PImage img;
  float posx;
  float posy;

  // The default fill colour of the Veggie
  color defaultColor;

  //ADDED The hover fill colour of the Veggie
  color collideColor;

  boolean collideColorChange = false;

  // VeggieImg constructor with the specified location and size

  VeggieImg (PImage tempImg, float tempX, float tempY) {

    posx = tempX;
    posy = tempY;
    img = tempImg;
  }

// collide(other)
  // Checks for collision with the other Veggies if any
  // and updates the color of the window (buggy...)

  boolean collide(VeggieImg other) {
    collideColorChange = false;

    float distance = dist(posx, posy, other.posx, other.posy);
    float sumRadius = img.width/2 + other.img.width/2;

    if (distance < sumRadius) {
      collideColorChange = true;
      return true;
    }
    return false;
  }

  void draw() {
    if (collideColorChange == true) {
      //If they collide veggies change to a random color
      tint(random(0, 255));
      //if they no longer collide veggies goes back to its original color
    } else {
      noTint();
    }
    image(img, posx, posy);
    noStroke();
  }
}