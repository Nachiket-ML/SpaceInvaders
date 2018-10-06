import processing.core.*; //<>//
import processing.event.*;
/**
 * The main sketch that runs the whole game.
 * @author Nachiket Subbaraman
 * @version May 8, 2016
 */


private PShape villainImage; 
private PShape minion1Image;
private PShape minion2Image;
private PShape heroImage;
private PShape laserImage;
private ArrayList<Laser> lasers;
private Hero hero;
private Villain villain;
private Minion minion1;
private Minion minion2;
private char previousKey;
private boolean randomize;
private PFont font;
  /**
   *The setup method
   */
  void setup() {
     size(1200,700);
     background(#2f4f4f);
     lasers = new ArrayList<Laser>();
     textAlign(CENTER);
     font = loadFont("Consolas-BoldItalic-80.vlw");     
     textFont(font, 80);
     text("START", 600, 350);
     frameRate(30);
     //font = loadFont("DigitalFont.vlw");
     //background = loadImage("SpaceInvadersBackground.png");
     //background = createImage(1000,500, RGB);
     int heroImageX = 1050;
     int heroImageY = 350;
     int minion1ImageX = 50;
     int minion1ImageY = 125;
     int minion2ImageX = 75;
     int minion2ImageY = 375;
     int villainImageX = 100;
     int villainImageY = 250;
     shapeMode(CENTER);
     heroImage = createShape(RECT, 0, 0, 70, 70);
     heroImage.setFill(color(#00bfff));
     villainImage = createShape(RECT, 0 , 0, 70, 70);
     villainImage.setFill(color(#a020f0));
     minion1Image = createShape(RECT, 0, 0, 70, 70);
     minion1Image.setFill(color(#000000));
     minion2Image = createShape(RECT,0, 0, 70,70);
     minion2Image.setFill(color(#000000));
     laserImage = createShape(RECT,0,0,10,2);
     laserImage.setFill(color(200,0,0));
     villain = new Villain(40, villainImageX, villainImageY, villainImage);
     hero = new Hero(3, heroImageX, heroImageY, heroImage);
     minion1 = new Minion(23, minion1ImageX, minion1ImageY, minion1Image);
     minion2 = new Minion(23, minion2ImageX, minion2ImageY, minion2Image);
     villainImage = villain.getShape();
     minion1Image = minion1.getShape();
     minion2Image = minion2.getShape();
     heroImage = hero.getShape();
     shape(villainImage, villainImageX, villainImageY);
     shape(minion1Image, minion1ImageX, minion1ImageY);
     shape(minion2Image, minion2ImageX, minion2ImageY);
     shape(heroImage, heroImageX, heroImageY); //<>//
  }

//for hero:
//use w for up and s for down
//shoot in direction of the mouse
//only if the spacebar is clicked. 
//if a laser collides with a villain or minion
//decrease its health and remove the laser 
//from the screen. if the health is 0,
//decrease the villain's or minion's life by 1.

//for villain & minion:
//always shoot lasers in direction of the hero
//if hit the top of the screen, move to the bottom.
//if hit bottom of the screen, move to the top.
//if the laser collides with the hero
//decrease the hero's health and make the laser dissapear
//if the health of the hero is 0, decrement the hero's life by 1
void draw() {
    //hero movement
    textAlign(CENTER);
    if(frameCount%30 ==0)
       randomize = true;
    else 
       randomize = false;
     background(#2f4f4f);
     shapeMode(CENTER);
     heroMovement();
     if(!minion1.isDead() || !minion2.isDead() || !villain.isDead()){
        moveBadGuys();
        makeBadGuysShootLasers();
        setBadGuysVelocity();
        moveLasers();
      }
      checkCollisions(minion1);
      checkCollisions(minion2);
      checkCollisions(villain);
      checkCollisions(hero);
      if(hero.isDead())
        text("YOU LOSE", 600, 350);
      else if(minion1.isDead() && minion2.isDead() && villain.isDead())
        text("YOU WIN", 600, 350);
         
}

  public void heroMovement(){
     if(keyPressed && !hero.isDead()){
      if(key == 'w'){
        System.out.println("b");
        hero.setCenterY(hero.getCenterY()-hero.getVelocity());
      }
      else if(key == 's'){
        hero.setCenterY(hero.getCenterY()+hero.getVelocity()); 
        rect(hero.getCenterX(), hero.getCenterY(), 20, 20);

      }
     // hero shoots laser if o is pressed
      else if(key=='o' && previousKey!='o'){
        makeLaser(hero);
      }
      previousKey = key;
     }
  }
  //makes a Laser l coming out of character c
  //rotates it
  //TRY MAKING LASERS SHOOT HORIZONTALLY if its too much work giving them an angle
  public void makeLaser(Character c){
      /**
        int YCoordDiff=0;
        int XCoordDiff=0;
        if(c instanceof Hero){
          YCoordDiff = mouseY-l.getCenterY();
          XCoordDiff = mouseX-l.getCenterX();
        }
        else {
          YCoordDiff = c.getCenterY()-hero.getCenterY();
          XCoordDiff = c.getCenterX()-hero.getCenterX();
        }
        float angle = atan(YCoordDiff/XCoordDiff);
        l.setDirection(angle);
        l.rotate(angle);
        lasers.add(l);
        */
        Laser laser = new Laser(c.getCenterX(), c.getCenterY(), c);
        if(c instanceof Hero){
            laser.setVelocity(-laser.getVelocity());//moves to the left
        }
        else if(c instanceof Villain || c instanceof Minion){
            laser.setVelocity(laser.getVelocity());//moves to the right
        }
        laser.setCenterX(c.getCenterX());
        laser.setCenterY(c.getCenterY());
        shape(laser.getShape(), c.getCenterX(), c.getCenterY());
        lasers.add(laser);
    }
  //checks if a laser had a collision with a character
  public void checkCollisions(Character c){
    /**
      c.setXPixels();
      c.setYPixels();
      int[] cXPixels = c.getXPixels();//vertical pixels
      int[] cYPixels = c.getYPixels();//horizontal pixels
      for(int i = 0; i<lasers.size(); i++){
         Laser l = lasers.get(i);
         int[] laserXPixels = l.getXPixels();
         int[] laserYPixels = l.getYPixels();
         for(int j = 0; i<laserXPixels.length; i++){
            for(int k = 0; k<laserYPixels.length; k++){
               System.out.println("noterrorhere");
               for(int m = 0; m<cXPixels.length; m++){
                //System.out.println("errorhere");
                for(int n = 0; n<cYPixels.length; n++){
                       System.out.println("errorhere");
                     if(laserXPixels[j] == cXPixels[m] && laserYPixels[k] == cYPixels[n]){
                        int lives = c.getLives();
                        int health = c.getHealth();
                        if(health>5)
                          c.setHealth(health-5);
                        else if(health<=5 && lives>0){
                           health = 5-health;
                           c.setLives(lives--);
                           c.setHealth(300-health);
                        }
                     }
                  }
               }
            }
         }
      }
     */
     
    int centerX = c.getCenterX();
    int centerY = c.getCenterY();
    for(int i = 0; i<lasers.size(); i++){
       Laser laser = lasers.get(i);
       int laserCenterX = laser.getCenterX();
       int laserCenterY = laser.getCenterY();
       if(Math.abs(centerX-laserCenterX)<=35 && Math.abs(centerY-laserCenterY)<=35){
         Character laserCharacter = laser.getCharacter();
         if(c instanceof Villain && (!minion1.isDead()||!minion2.isDead())) continue;
          else if(laserCharacter instanceof Hero && (c instanceof Villain || c instanceof Minion))
            c.setLives(c.getLives()-1);
          else if((laserCharacter instanceof Villain || laserCharacter instanceof Minion) && c instanceof Hero)
            c.setLives(c.getLives()-1);
       }
    }
     
     
  }
  /**
   * Moves minions and villains by their velocity
   * 10:50  randomize their movement
   */
  public void moveBadGuys(){
   //   hero.setCenterY(hero.getCenterY()+hero.getVelocity());
      int x = (int)(random(3.0));
      int y = (int)(random(2.0));
      if(randomize){
        if(x==0 ){
           if(y==0) minion1.setVelocity(0-abs(minion1.getVelocity()));
           else minion1.setVelocity(abs(minion1.getVelocity()));
        }
        else if(x==1){
           if(y==1) minion2.setVelocity(0-abs(minion2.getVelocity()));
           else minion2.setVelocity(abs(minion2.getVelocity()));
        }
        else if(x==2){
           if(y==0) villain.setVelocity(0-abs(villain.getVelocity()));
           else villain.setVelocity(abs(villain.getVelocity()));
        }
      }
      minion1.setCenterY(minion1.getCenterY()+minion1.getVelocity());
      minion2.setCenterY(minion2.getCenterY()+minion2.getVelocity());
      villain.setCenterY(villain.getCenterY()+villain.getVelocity());
      int heroCenterX = hero.getCenterX();
      int heroCenterY = hero.getCenterY();
      int minion1CenterX = minion1.getCenterX();
      int minion1CenterY = minion1.getCenterY();
      int minion2CenterX = minion2.getCenterX();
      int minion2CenterY = minion2.getCenterY();
      int villainCenterX = villain.getCenterX();
      int villainCenterY = villain.getCenterY();
      if(!hero.isDead())
        shape(heroImage, heroCenterX, heroCenterY);
      if(!minion1.isDead())
        shape(minion1Image, minion1CenterX, minion1CenterY);
      if(!minion2.isDead())
        shape(minion2Image, minion2CenterX, minion2CenterY);
      if(!villain.isDead())
        shape(villainImage, villainCenterX, villainCenterY);
  }
  /**
   * Moves all the lasers on the window
   */
  public void moveLasers(){
    /**
     for(int i = 0; i<lasers.size();i++){
         Laser l = lasers.get(i);
         int angle = l.getDirection();
         int x = l.getCenterX();
         int y = l.getCenterY();
         x+=4*cos(angle);
         y+=4*sin(angle);
         image(laserImage, x, y);
     } 
     */
     for(int i = 0; i<lasers.size(); i++){
        Laser laser = lasers.get(i);
        laser.setCenterX(laser.getCenterX()+laser.getVelocity());
        shape(laserImage, laser.getCenterX(), laser.getCenterY());
        //System.out.println("inlaser");
     }
  }
  /**
   * Makes the bad guys shoot lasers
   * 10:50 randomize the laser shooting pattern
   */
  public void makeBadGuysShootLasers(){
      int x = (int)random(3.0);
       int y = (int)(random(3.0))+1;
      if(randomize){
        if(!minion1.isDead() && !minion2.isDead()){
           if(x==1) makeLaser(minion1);
           else if(x==2) makeLaser(minion2);
           else{
             makeLaser(minion1);
             makeLaser(minion2);
           }
        }
        else if(minion1.isDead() && !minion2.isDead())
            makeLaser(minion2);
        else if(!minion1.isDead() && minion2.isDead())
            makeLaser(minion1);
        else if(minion2.isDead() && minion1.isDead() && !villain.isDead()){
            makeLaser(villain); 
            makeLaser(villain); 
            makeLaser(villain); 
         }
       }
      else{
         if(!minion1.isDead() && !minion2.isDead()){
             if(frameRate%y==0)makeLaser(minion1);
             if(frameRate%y==0 || frameRate%y==1) makeLaser(minion2);
          }
        else if(minion1.isDead() && !minion2.isDead())
              if(frameRate%y==0) makeLaser(minion2);
        else if(!minion1.isDead() && minion2.isDead())
            if(frameRate%y==0) makeLaser(minion1);
        else if(minion2.isDead() && minion1.isDead() && !villain.isDead()){
            makeLaser(villain); 
            makeLaser(villain); 
            makeLaser(villain);
             makeLaser(villain); 
            makeLaser(villain); 
            makeLaser(villain);
             makeLaser(villain); 
            makeLaser(villain); 
            makeLaser(villain);
         }
       }
  }
  
   
   public void setBadGuysVelocity(){
     if (minion1.getCenterY()>673) {
       minion1.setVelocity(-minion1.getVelocity());
     }
     if (minion2.getCenterY()>673) {
       minion2.setVelocity(-minion2.getVelocity());
     }
     if (villain.getCenterY()>673) {
       villain.setVelocity(-villain.getVelocity());
     }
     if (minion1.getCenterY()<27) {
       minion1.setVelocity(-minion1.getVelocity());
     }
     if (minion2.getCenterY()<27) {
       minion2.setVelocity(-minion2.getVelocity());
     }
     if (villain.getCenterY()<27) {
       villain.setVelocity(-villain.getVelocity());
     }
     
   }