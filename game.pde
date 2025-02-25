class Basket {
  float x, y, speedX;
  PImage image;

  Basket(PImage image, float x, float y, float speedX) {
    this.image = image;
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    imageMode(CENTER);
    image.resize(150, 150);
  }

  void update() {
    moveBasket();
    render();
  }

  void render() {
    image(image, x, y);
  }

  void moveBasket() {
    x -= speedX; // Move the basket from right to left
  }

  boolean putInBasket(Toppings topping) {
    return (dist(this.x, this.y, topping.x, topping.y) < 50);
  }

  // Ensure basket stays on the ground level
  void keepOnGround() {
    this.y = height - 100; // Adjust this based on the actual ground position in your background
  }
}
