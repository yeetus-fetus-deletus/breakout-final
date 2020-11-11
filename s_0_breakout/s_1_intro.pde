void intro() {
  //sound FX
  introA.play();
  
  //GIF
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if(f == Frames) f = 0;
  
  //text font
  textFont(amboqia);
  
  yes = true;
  rectMode(CENTER);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(100);
  text("BREAKOUT!", width/2, height/3);
  
  //start button
  fill(150);
  stroke(0);
  tactileRect(320, 360, 160, 80);
  rect(width/2, 400, 160, 80);
  fill(0);
  textSize(40);
  text("START", 400, 400);
  
  //options button
  fill(150);
  stroke(0);
  tactileRect(320, 460, 160, 80);
  rect(width/2, 500, 160, 80);
  fill(0);
  textSize(30);
  text("OPTIONS", 400, 500);
}

void introClicks() {
  if(mouseX > 320 && mouseX < 480 && mouseY > 360 && mouseY < 440) {
    mode = GAME;
    introA.pause();
    introA.rewind();
  }
  if(mouseX > 320 && mouseX < 480 && mouseY > 460 && mouseY < 540) {
    mode = OPTIONS;
  }
}
