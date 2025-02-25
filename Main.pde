PImage sandwich, pizza, burger, basket, backgroundImage;
float basketX, basketY;
int score = 0;
int gameMode = 0;
int maxFoodItems = 5;
ArrayList<Toppings> toppingsList = new ArrayList<Toppings>();
Basket basket1;

void setup() {
  size(800, 600);

  // Load images
  backgroundImage = loadImage("GameBg.png"); // The background contains the conveyor belt
  backgroundImage.resize(width, height); // Ensure it matches the screen size

  sandwich = loadImage("Sandwich.png");
  pizza = loadImage("Pizza.png");
  burger = loadImage("Burger.png");
  basket = loadImage("basket.png");

  basketX = width + 200;
  basketY = height - 100;

  // Initialize basket
  basket1 = new Basket(basket, basketX, basketY, 1);

  // Generate food items dynamically
  for (int i = 0; i < maxFoodItems; i++) {
    float startX = -200 * i;  // Space out items along the conveyor
    toppingsList.add(new Toppings(randomFoodImage(), startX, 200, 2));
  }
}

void draw() {
  background(backgroundImage); // Use the background with the built-in conveyor belt

  if (gameMode == 0) {
    for (int i = toppingsList.size() - 1; i >= 0; i--) {
      Toppings topping = toppingsList.get(i);
      topping.update();
      if (mousePressed && topping.onTopping()) {
        topping.x = mouseX;
        topping.y = mouseY;
        topping.isPicked = true;
      }
      if (basket1.putInBasket(topping)) {
        toppingsList.remove(i);
        score += 1;
      }
    }

    basket1.update();

    fill(0);
    textSize(30);
    text("Score: " + score, 30, 40);
  }

  if (basket1.x < -100) {
    gameMode = 1;
  }

  if (basket1.x < -100 && score == 0) {
    gameOver();
  }

  if (basket1.x < -100 && score >= 1) {
    endGame();
  }
}

void gameOver() {
  background(120);
  textAlign(CENTER);
  textSize(100);
  fill(0);
  text("Game Over", width / 2, height / 2);
}

void endGame() {
  background(70);
  textAlign(CENTER);
  textSize(100);
  fill(0);
  text("Score: " + score, width / 2, height / 2 + 100);
}

PImage randomFoodImage() {
  int choice = int(random(3));
  if (choice == 0) return sandwich;
  if (choice == 1) return pizza;
  return burger;
}
