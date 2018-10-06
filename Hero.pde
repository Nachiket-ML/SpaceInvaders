import processing.core.*;
/**
 * The Hero class that represents a hero
 * in the Block Game
 * @author Nachiket Subbaraman
 * @version May 8, 2016
 */
public class Hero extends Character{
     
   /**
    * A constructor for the Hero class.
    * @param life The number of lives the Hero has
    * @param initCenterX The Hero's initial center X coordinate.
    * @param initCenterY The Hero's initial center Y coordinate.
    * @param shapey The shape of the Hero
    */
    public Hero(int life, int initCenterX, int initCenterY, PShape shapey){
       super(initCenterX, initCenterY, shapey, life, 10);
    }
}