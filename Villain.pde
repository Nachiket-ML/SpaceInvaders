import processing.core.*;
/**
 * A class that represents a Villain in the Block Game.
 * @author Nachiket Subbaraman
 * @version May 8, 2016
 */
public class Villain extends Character{
 
   /**
    * A constructor for the Villain class.
    * @param life The number of lives the villain has
    * @param initCenterX The Villain's initial center X coordinate.
    * @param initCenterY The Villain's initial center Y coordinate.
    * @param shapey The shape of the Villain
    */
   public Villain(int life, int initCenterX, int initCenterY, PShape shapey){
       super(initCenterX, initCenterY, shapey, life, 25);
    }
}