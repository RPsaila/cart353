PImage sourceBrad;
PImage destinationBrad;

char saveKey = 's';

//Array storing the Vegetable images
PImage[] veggies = new PImage[12];

//Array using the Veggies
VeggieImg[] veggiesImg = new VeggieImg[12];

//ADDED Index for each Veggie which is being displayed
int veggiesIndex = -1;

void setup () {
  frameRate(90);
  size(747, 1080);
  sourceBrad = loadImage("bp.png");
  background(sourceBrad);
  destinationBrad = createImage(sourceBrad.width, sourceBrad.height, RGB);

  //ADDED for loop to add every veggie
  for (int i = 0; i < veggies.length; i++) {
    veggies [i] = loadImage ("data/veggies/veg" + i + ".png");
  }

  //ADDED for loop with the random values of veggies
  for (int i = 0; i < veggiesImg.length; i++) {
    veggiesImg [i] = new VeggieImg(veggies[i], random(0, width), random(0, height));
  }
}

void draw() {

  // We changed the pixels in destination
  destinationBrad.updatePixels();
  // Display the destination
  image(destinationBrad, 0, 0);
  for (int i=0; i<= veggiesIndex; i++) {
    // A for loop within a for loop which helps to know whether a Veggie interact with another Veggie
    for (int j=0; j<= veggiesIndex; j++) {
      if (i != j) {
        //Checks if veggies collide with each other.
        boolean result = veggiesImg[i].collide(veggiesImg[j]);
        if (result == true) {
          break;
        }
      }
      float threshold = map(mouseX, 0, width-1, 0, 255);

      // Code taken from Example 15-10: Brightness threshold
      // We are going to look at both image's pixels
      sourceBrad.loadPixels();
      destinationBrad.loadPixels();

      for (int x = 0; x < sourceBrad.width; x++ ) {
        for (int y = 0; y < sourceBrad.height; y++ ) {
          int loc = x + y*sourceBrad.width;
          // Test the brightness against the threshold
          if (brightness(sourceBrad.pixels[loc]) > threshold) {
            destinationBrad.pixels[loc] = color(100); // White
          } else {
            destinationBrad.pixels[loc] = color(0);   // Black
          }
        }
      }
    }
    // Display and Update (color change : buggy) the Veggies
    veggiesImg[i].draw();
  }
}

//Makes the veggies appear

void mouseClicked() {
  if (veggiesIndex >= -1) {
    veggiesIndex++;
  } else if (veggiesIndex <= 12) {
    veggiesIndex--;
  }
}

//Saving option

void keyPressed() {
  if (key == saveKey) {
    save("screenshot.png");
  }
}