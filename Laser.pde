import processing.core.*;
/**
 * A class representing the attributes
 * for a laser in this game. 
 * @author Nachiket Subbaraman
 * @version May 8, 2016
 */
public class Laser{
   
  //The character that shot the laser
  private Character character;
  //The X coordinate of the center of the laser
  private int centerX;
  //The Y coordinate of the center of the laser
  private int centerY;
  private PShape shape;
  private int velocity; 
  //The X coordinates of the pixels the Laser encompasses
  private int[] XPixels;
  //The Y coordinates of the pixels the Laser encompasses
  private int[] YPixels;
  
  /**
   * The constructor for a Laser 
   * @param centerXCoord The initial center X coordinate of the laser
   * @param centerYCoord The initial center Y coordinate of the laser
   * @param c The character that shot the laser
   */
  public Laser(int centerXCoord, int centerYCoord, Character c){
     character = c;
     centerX = centerXCoord;
     centerY = centerYCoord;
     shape = createShape(RECT, 10, 10, 50, 13);//x, y, width, height
     shape.setFill(color(0));
     XPixels = new int[height];
     YPixels = new int[width];
     velocity = 10;//4 pixels per frame
  }
  /**
   * A method that returns the character
   * @return character The character
   */
  public Character getCharacter() { 
      return character;
  }
  
  /**
   * A method that gets the center x coordinate
   * @return centerX the center x coordinate
   */
  public int getCenterX(){
    return centerX;
  }
  
  /**
   * A method that sets the new center X coordinate
   * @param newCenterX The new center X coordinate
   */
  public void setCenterX(int newCenterX){ 
    centerX = newCenterX;
  }
  
  /**
   * A method that returns the center Y coordinate
   * @return centerY The center Y coordinate
   */
  public int getCenterY(){ 
    return centerY;
  }
  
  /**
   * A method that sets the new center Y coordinate
   * @param newCenterY The new center Y coordinate
   */
  public void setCenterY(int newCenterY){
    centerY = newCenterY;
  }
  
  /**
   * A method that returns the shape of a Laser
   * @return shape The shape
   */
  public PShape getShape(){ 
    return shape;
  }
  
  /**
   * A method that returns the velocity of a laser
   * @return velocity The velocity
   */
  public int getVelocity(){ 
    return velocity;
  }
  
  /**
   * A method that sets the velocity of a lasaer
   * @param v The new velocity
   */
  public void setVelocity(int v){
    velocity = v;
  }
  
  /**
   * A method that returns the X coordinates of the pixels of a laser
   * OBSOLETE METHOD
   * @return XPixels the X coordinates of the pixels
   */
  public int[] getXPixels(){
      int XOrigin = centerX-(height/2);
      int count = 0;
      for(int i = XOrigin; i<XOrigin+height; i++){
         XPixels[count] = i;
         count++;
      }
      return XPixels;
  }
  
  /**
   * A method that returns the Y coordinates of the pixels
   * of a laser
   * OBSOLETE METHOD
   * @return YPixels the Y coordinates of the pixels
   */
   public int[] getYPixels(){
      int YOrigin = centerY-(width/2);
      int count = 0;
      for(int i = YOrigin; i<YOrigin+width; i++){
         YPixels[count] = i;
         count++;
      }
      return YPixels;
  }
}