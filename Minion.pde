import processing.core.*;
/**
 * A class that represents a Minion
 * in the Block Game
 * @author Nachiket Subbaraman
 * @version May 8, 2016
 */
public class Minion extends Character{

   /**
    * A constructor for the Minion class.
    * @param life The number of lives the minion has
    * @param initCenterX The Minion's initial center X coordinate.
    * @param initCenterY The Minion's initial center Y coordinate.
    * @param shapey The shape of the Minion
    */
    public Minion(int life, int initCenterX, int initCenterY, PShape shapey){
       super(initCenterX, initCenterY, shapey, life,  10);
    }
   
}