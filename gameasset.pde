class Toppings {
  float x, y, speedX;
  PImage image;
  boolean isPicked = false;

  Toppings(PImage image, float x, float y, float speedX) {
    this.image = image;
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    imageMode(CENTER);
    image.resize(100, 100);
  }

  void update() {
    if (!isPicked) {
      moveOnBelt();
    }
    render();
  }

  void moveOnBelt() {
    x += speedX; // Move along the conveyor belt
  }

  void render() {
    image(image, x, y);
  }

  boolean onTopping() {
    return (dist(mouseX, mouseY, x, y) < 50);
  }
}
