class Basket{
  float x,  y , speedX;
  PImage image;
  
  Basket( PImage image, float x, float y , float speedX){
   this.image = image;
   this.x = x;
   this.y = y;  
   imageMode(CENTER);
   image.resize(150, 150);
   this.speedX = speedX;
  }
 
 void update(){
   render();
   moveBasket();
 }
 
  void render(){
    image(image, x, y);    
  }  
  
  void moveBasket(){
    x = x - speedX;
  }
  
  boolean putInBasket(Toppings topping){
    return (dist(this.x , this.y , topping.x , topping.y) <50);
  }
}
