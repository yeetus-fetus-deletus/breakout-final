void gameOver() {
  //GIF
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if(f == Frames) f = 0;
  
  scoreA.play();
  
  yes = false;
  rectMode(CORNER);
  tactileRect(320, 360, 160, 80);
  rect(320, 360, 160, 80);
  textAlign(CENTER, CENTER);
  textSize(80);
  if(lives > 0) {
    fill(255);
    text("YOU WIN!", width/2, height/3);
    clap.play();
  } else if(lives <= 0) {
    fill(255);
    text("YOU LOSE!", width/2, height/3);
  }
  
  fill(150);
  stroke(0);
  tactileRect(320, 460, 160, 80);
  rect(320, 460, 160, 80);
  
  //text
  fill(0);
  textSize(30);
  text("RESTART", 400, 400);
  text("OPTIONS", 400, 500);
  
}

void reset() {
  score = 0;
  lives = 3;
  n = nB;
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
    scoreA.pause();
    scoreA.rewind();
    clap.pause();
    clap.rewind();
  }
  padx = width/2;
  pady = height;
  ballx = width/2;
  bally = height*5/7;
  timer = 100;
}

void gameOverClicks() {
  if(mouseX > 320 && mouseX < 460 && mouseY > 360 && mouseY < 440) {
    reset();
    mode = INTRO; 
  }
  if(mouseX > 320 && mouseX < 460 && mouseY > 460 && mouseY < 540) {
    mode = OPTIONS;
  }
  
}
