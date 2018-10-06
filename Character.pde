import processing.core.*;
/**
 * Super class to all characters in 
 * the game: Hero, villain, and minion.
 * Each character is a rectangle with a certain color.
 * @author Nachiket Subbaraman
 * @version May 8, 2016
 */
public class Character{
     
   private int centerX;
   private int centerY;
   private PShape shape;
   private int lives;
   private int velocity;
   //private int[] XPixels;
   //private int[] YPixels;
   
   public Character(int x, int y, PShape sh,  int l, int v){
      centerX = x;
      centerY = y;
      shape = sh;
      lives = l;
      velocity = v;
     // XPixels = new int[height];
      //YPixels = new int[width];
   }
  
   public int getCenterX(){ return centerX;}
   
   public int getCenterY(){ return centerY;}
   
   public void setCenterX(int cX){ centerX = cX;}
   
    public void setCenterY(int cY){ centerY = cY;}
   
   public PShape getShape(){ return shape;}
   
   public int getLives(){ return lives;}
   
   public void setLives(int life){ lives = life;}
   
   public int getVelocity(){ return velocity;}
   
   public void setVelocity(int initVelocity){ velocity = initVelocity;}
  
   public void setXPixels(){
     /**
      int initX = 0;
      boolean found = false;
      for(int i = 0; i<height; i++){
        if(!found){
         for(int j = 0; j<width; j++){
            System.out.println("loopy");
            if(get(i,j) == charColor){
                System.out.println("found it");
                initX = i; //<>//
                found = true;
                break;
            }
         }
        }
      }
      int[] XPixels = new int[(int)this.getShape().height];
      for(int i = 0; i<XPixels.length; i++){ //length is keyword in processing, could that be overriden by an array's length?
          XPixels[i] = initX;
          initX++;
      }
      */
      /**
      int XOrigin = centerX-(height/2);
      int count = 0;
      for(int i = XOrigin; i<XOrigin+height; i++){
         XPixels[count] = i;
         count++;
      }
      */
   }
   
   public void setYPixels(){
     /**
      int initY = 0;
      boolean found = false;
      for(int i = 0; i<height; i++){//x values are vertical
        if(!found){
         for(int j = 0; j<width; j++){//y values are horizontal
            if(get(i,j) == charColor){
                initY = j;
                found = true;
                break;
            }
         }
        }
      }
      int[] YPixels = new int[(int)this.getShape().width];
      for(int i = 0; i<YPixels.length; i++){
          YPixels[i] = initY;
          initY++;
      }
      */
      /**
      int YOrigin = centerY-(width/2);
      int count = 0;
      for(int i = YOrigin; i<YOrigin+width; i++){
         YPixels[count] = i;
         count++;
      }
      */
   }
   
   //public int[] getXPixels(){ return XPixels;}
   
  // public int[] getYPixels(){ return YPixels;}
   
   
   public boolean isDead(){
      if(lives<=0)
        return true;
      return false;
   }
}