void pause() {
  //play button
  tactileRect(760, 10, 30, 30);
  rect(775, 25, 30, 30);
  fill(0);
  stroke(0);
  triangle(769, 18, 769, 32, 781, 25);
  
  //pause text
  fill(255, 255, 0);
  textSize(75);
  textAlign(CENTER, CENTER);
  text("PAUSE", 400, 500);
}

void pauseClicks() {
  mode = GAME;
}
