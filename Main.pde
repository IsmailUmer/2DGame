PImage sandwich;
PImage pizza;
PImage burger;
PImage basket;
float sandwichX, sandwichY, pizzaX, pizzaY, burgerX, burgerY;
float basketX, basketY;
int score = 0;
int gameMode = 0;



void setup() {
  size(800, 600);

  sandwich = loadImage("Sandwich.png");
  pizza = loadImage("Pizza.png");
  burger = loadImage("Burger.png");
  basket = loadImage("basket.png");
 
  sandwichX = 100;
  sandwichY = 200;
  pizzaX = 300;
  pizzaY = 200;
  burgerX = 500;
  burgerY = 200;
  basketX = width + 200;
  basketY = 100;

 
  basket1 = new Basket(basket, basketX, basketY, 1);
sandwich1 = new Toppings(sandwich, sandwichX, sandwichY);
  pizza1 = new Toppings(pizza, pizzaX, pizzaY);
  burger1 = new Toppings(burger, burgerX, burgerY);
}

void draw() {
  background(255);


  if(gameMode ==0){
  if (sandwich1 != null) {
    sandwich1.render();
  }
  if (pizza1 != null) {
    pizza1.render();
  }
  if (burger1 != null) {
    burger1.render();
  }
  pickTopping();
  basket1.update();
  addToBasket();
  fill(0);
  textSize(30);
  text("Score: " + score, 30, 40);
  }
  
   if(basket1.x < -100){
  gameMode = 1; 
 }
  
  if(basket1.x < -100 && score ==0){
    gameOver();
  }   
  
  if(basket1.x < -100 && score >= 1){
    endGame();
  }
}


//topping objects
Toppings sandwich1, pizza1, burger1;
Basket basket1;




void pickTopping() {
  if (mousePressed) {
    if (sandwich1 != null) {
      if (sandwich1.onTopping(sandwich1)) {
        sandwich1.x = mouseX;
        sandwich1.y = mouseY;
      }
    }

   if (pizza1 != null) {
      if (pizza1.onTopping(pizza1)) {
        pizza1.x = mouseX;
        pizza1.y = mouseY;
      }
    }

   if (burger1 != null) {
      if (burger1.onTopping(burger1)) {
        burger1.x = mouseX;
        burger1.y = mouseY;
      }
    }
  }
}

void addToBasket() {
   if (pizza1 != null){
  if (basket1.putInBasket(pizza1)) {
    pizza1 = null;
    score+=1;
  }
   }
  
if (sandwich1 != null){
  if (basket1.putInBasket(sandwich1)) {
    sandwich1 = null;
    score +=1;
  }
}
if (burger1 != null){
  if (basket1.putInBasket(burger1)) {
    burger1 = null;
    score +=1;
  }
}
}


void gameOver(){ 
  background(120);
  textAlign(CENTER);
  textSize(100);
  fill(0);
  text("Game Over", width/2, height/2);
}

void endGame(){
  background(70);
  textAlign(CENTER);
  textSize(100);
  fill(0);
  text("Score: "+ score, width/2, height/2 +100);
}
