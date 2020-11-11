void game() {
  image(back, 0, -50, 800, 800);
  rectMode(CENTER);
  fill(255);
  circle(padx, pady, padd);
  circle(ballx, bally, balld);
  
  //ball
  if(timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }
  
  //paddle movement
  if(Lkey == true) padx = padx - 10;
  if(Rkey == true) padx = padx + 10;
  if(padx < padd/2) padx = padd/2;
  if(padx > width-(padd/2)) padx = width-(padd/2);
  
  //ball movement
  if(dist(ballx, bally, padx, pady) <= balld/2 + padd/2) {
     vx = (ballx-padx)/10;
     vy = (bally-pady)/10;
     paddle.rewind();
     paddle.play();
  }
  if(ballx < balld/2 || ballx > width-balld/2) {
    vx = vx * -1;
    wall.rewind();
    wall.play();
  }
  if(bally < balld/2) {
    vy = vy * -1;
    wall.rewind();
    wall.play();
  }
  
  //lives
  if(bally > height+15) {
    lives--;
    ballx = width/2;
    bally = height*3/4;
    padx = width/2;
    pady = height;
    timer = 100;
  }
  
  //bricks
  int i = 0;
  //alive[i] = true;
  while (i < n) {
    if(alive[i] == true) {
      manageBricks(i);
    }
    i = i + 1;
  }
  
  //scoreboard
  fill(0, 255, 0);
  textAlign(LEFT);
  textSize(20);
  text("Score: " + score, 20, 25);
  text("Lives:  " + lives, 19, 50);
  timer = timer - 1;
  
    if(score == n*100 || lives <= 0) {
      mode = GAMEOVER;
    }
  
  //pause button
  fill(150);
  stroke(0);
  tactileRect(760, 10, 30, 30);
  rect(775, 25, 30, 30);
  stroke(0);
  strokeWeight(3);
  line(771, 17, 771, 33);
  line(779, 17, 779, 33);
  strokeWeight(1);
}

void manageBricks(int i) {
  if(y[i] == 100) fill(255, 0, 0);
  if(y[i] == 150) fill(230, 0, 255);
  if(y[i] == 200) fill(150, 0, 255);
  if(y[i] == 250) fill(90, 0, 255);
  if(y[i] == 300) fill(0, 255, 255);
  if(y[i] == 350) fill(255);
  circle(x[i], y[i], brickd);
  if(dist(ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
    vx = (ballx-x[i])/5;
    vy = (bally-y[i])/5;
    brick.play();
    alive[i] = false;
    score = score + 100;
    brick.pause();
    brick.rewind();
  }
}

void gameClicks() {
  if(mouseX > 760 && mouseX < 790 && mouseY > 10 && mouseY < 40) {
    mode = PAUSE;
  }
}
