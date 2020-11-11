import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;
final int OPTIONS  = 5;

//options page
boolean yes;

//game background
PImage back;

//GIF
PImage[] gif;
int Frames;
int f;

//bricks
int[] x;
int[] y;
int brickd;
int n;
int tempx, tempy;
boolean[] alive;
int nB;

//paddle variables
float padx;
float pady;
float padd;

//ball variables
float ballx;
float bally;
float balld;
float vx;
float vy;

//movement variables
boolean Lkey, Rkey;

//scoring
int timer;
int lives;
int score;

//text font variable
PFont amboqia;

//sound FX
Minim minim;
AudioPlayer scoreA, paddle, brick, wall, clap, introA;

void setup() {
  size(800, 600, FX2D);
  mode = INTRO;
  
  //text font
  amboqia = createFont("Amboqia Boriango.otf", 200);
  
  //game background
  back = loadImage("301f0c2b624cf38644f8baf5dfddcc16.jpg");
  
  //GIF
  Frames = 40;
  gif = new PImage[Frames];
  int o = 0;
  while(o < Frames) {
    gif[o] = loadImage("frame_"+o+"_delay-0.04s.gif");
    o = o + 1;
  }
  
  //bricks
  n = 90;
  nB = 90;
  brickd = 40;
  tempx = 50;
  tempy = 100;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  int i = 0;
  while (i < n) {
    alive[i] = true;
    x[i] = tempx;
    y[i] = tempy;
    tempx = tempx + 50;
    if(tempx >= width) {
      tempx = 50;
      tempy = tempy + 50;
    }
    i = i + 1;
  }
  
  yes = true;
  noStroke();
  rectMode(CENTER);
  
  //paddle variables
  padx = width/2;
  pady = height;
  padd = 120;
  
  //ball variables
  ballx = width/2;
  bally = height*5/7;
  balld = 20;
  vx = random(-7, 7);
  vy = random(-7, 7);
  
  //scoring
  timer = 100;
  lives = 3;
  score = 0;
  
  //movement keys
  Lkey = Rkey = false;
  
  //sound FX
  minim = new Minim(this);
  introA = minim.loadFile("DA DA DANCE BABYMETAL Instrumental.mp3");
  scoreA = minim.loadFile("score.wav");
  brick = minim.loadFile("rightpaddle.wav");
  paddle = minim.loadFile("leftpaddle.wav");
  wall = minim.loadFile("wall.wav");
  clap = minim.loadFile("clapping.wav");
}

void draw() {
  if(mode == INTRO) {
    intro();
  } else if(mode == GAME) {
    game();
  } else if(mode == PAUSE) {
    pause();
  } else if(mode == GAMEOVER) {
    gameOver();
  } else if(mode == OPTIONS) {
    options();
  } else {
    println("Error: Mode = " + mode);
  }
}

void tactileRect(int x, int y, int w, int h) {
  if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(150);
    fill(255);
  } else {
    stroke(0);
    fill(150);
  }
}
