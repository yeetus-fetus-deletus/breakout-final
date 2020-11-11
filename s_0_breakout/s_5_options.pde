void options() {
  //setup
  fill(100);
  stroke(255);
  strokeWeight(3);
  rectMode(CORNER);
  rect(100, 100, 600, 400, 50);
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(0);
  text("OPTIONS", 400, 150);
  
  //controls
  //easy
  strokeWeight(1);
  stroke(0);
  fill(150);
  tactileRect(150, 300, 150, 75);
  rect(150, 300, 150, 75);
  //medium
  stroke(0);
  fill(150);
  tactileRect(325, 300, 150, 75);
  rect(325, 300, 150, 75);
  //hard
  stroke(0);
  fill(150);
  tactileRect(500, 300, 150, 75);
  rect(500, 300, 150, 75);
  
  //controls text
  fill(0);
  textSize(30);
  text("EASY", 225, 300+(75/2));
  text("MEDIUM", 400, 300+(75/2));
  text("HARD", 575, 300+(75/2));
  
  //exit button
  if(dist(660, 140, mouseX, mouseY) < 20) {
    stroke(255);
    fill(150);
  } else {
    stroke(0);
    fill(150);
  }
  circle(660, 140, 40);
  stroke(0);
  strokeWeight(3);
  line(651, 131, 669, 149);
  line(651, 149, 669, 131);
  strokeWeight(1);
  
  fill(0);
  textSize(25);
  text("DIFFICULTY:", 300, 265);
  
  if(nB == 30) {
    noStroke();
    fill(100);
    rect(450, 250, 100, 30);
    fill(0);
    textSize(25);
    text("EASY", 500, 265);
  }
  if(nB == 60) {
    noStroke();
    fill(100);
    rect(450, 250, 100, 30);
    fill(0);
    textSize(25);
    text("MEDIUM", 500, 265);
  }
  if(nB == 90) {
    noStroke();
    fill(100);
    rect(450, 250, 100, 30);
    fill(0);
    textSize(25);
    text("HARD", 500, 265);
  }
}

void optionsClicks() {
  if(mouseX > 150 && mouseX < 300 && mouseY > 300 && mouseY < 375) {
    n = 30;
    nB = 30;
  }
  if(mouseX > 325 && mouseX < 475 && mouseY > 300 && mouseY < 375) {
    n = 60;
    nB = 60;
  }
  if(mouseX > 500 && mouseX < 650 && mouseY > 300 && mouseY < 375) {
    n = 90;
    nB = 90;
  }
  
  if(dist(660, 140, mouseX, mouseY) < 20) {
    if(yes == true) {
      mode = INTRO;
    } else if(yes == false) {
      mode = GAMEOVER;
    }
  }
}
