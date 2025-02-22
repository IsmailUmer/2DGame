class Toppings{
  float x,  y;
  PImage image;
  
  Toppings( PImage image, float x, float y ){
   this.image = image;
   this.x = x;
   this.y = y;  
   imageMode(CENTER);
   image.resize(100, 100);
  }
 
  void render(){
    image(image, x, y);    
  }  
  
  boolean onTopping(Toppings topping){
   return (dist(mouseX, mouseY, topping.x, topping.y) < 50);
  }
}
