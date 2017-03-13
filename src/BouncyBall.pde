// a game 

var ROOM_WIDTH=400;
var ROOM_HEIGHT=400;
var shapeWidth=50;
var shapeHeight=50;
var lifeWidth = 15;
var lifeHeight = 15;


var posX = random(25, 375);
var posY = 200;
var RightOrLeft = ceil(random(0, 2));
var UpOrDown = ceil(random(0, 2));
var score = 0;
var lowSpeed=3;
var highSpeed=5;
var posXLife = 20;
var posYLife = 370;
var missClickCount = 0;
var loseLife1 = false;
var loseLife2 = false;
var loseLife3 = false;
var gameOver = false;


var stepRight = ceil(random(lowSpeed,highSpeed));
var stepLeft = ceil(random(lowSpeed,highSpeed));
var stepDown = ceil(random(lowSpeed,highSpeed));
var stepUp = ceil(random(lowSpeed,highSpeed));

var gameoverScreen = function(ROOM_WIDTH, ROOM_HEIGHT) {
    background(219, 83, 83);
    textSize(50);
    text("Gameover", 86, 200);
    textSize(20);
    text("Your score was: " +score, 116, 255);
};

// movement of ellipse
 
 frameRate(30);
var draw = function() {
    if (gameOver) {
        gameoverScreen();
    }
    else{
        
    
    background(142, 149, 150);
    
    
    fill(31, 242, 231);
    ellipse(posX, posY,shapeWidth , shapeHeight);
    if (loseLife1 === false && loseLife2 === false && loseLife3 === false) {
        for (var posXLife = 20; posXLife <= 60; posXLife += 20) {
    ellipse(posXLife, posYLife, lifeWidth, lifeHeight);
  }
}
    if (loseLife1 === false && loseLife2 === false && loseLife3 === true) {
        for (var posXLife = 20; posXLife <= 40; posXLife += 20) {
    ellipse(posXLife, posYLife, lifeWidth, lifeHeight);
  }
}
      if (loseLife1 === false && loseLife2 === true && loseLife3 === true) {
        for (var posXLife = 20; posXLife <= 20; posXLife += 20) {
    ellipse(posXLife, posYLife, lifeWidth, lifeHeight);
  }
}
       if (loseLife1 === true && loseLife2 === true && loseLife3 === true) {
        for (var posXLife = 20; posXLife <= 0; posXLife += 20) {
    ellipse(posXLife, posYLife, lifeWidth, lifeHeight);
  }
}
    
    if (RightOrLeft === 1) {
       posX +=stepRight;

    }
    else if (RightOrLeft === 2) {
        posX -= stepLeft;
    }

    if (UpOrDown === 1) {
        posY += stepDown;
    }

    else if (UpOrDown === 2) {
        posY -= stepUp;
    }
 
   // checking for collisions
    if (posX > ROOM_WIDTH-shapeWidth/2) {
        stepLeft = ceil(random(lowSpeed,highSpeed));
        RightOrLeft = 2;
        var chance = ceil(random(0, 2));
        if (chance === 1){
            if (UpOrDown===1){
                UpOrDown=2;
            }
            if (UpOrDown===2){
                UpOrDown=1;
            }
        }
    }

    else if (posX < shapeWidth/2) {
        stepRight = ceil(random(lowSpeed,highSpeed));
        RightOrLeft = 1;
        var chance = ceil(random(0, 2));
        if (chance === 1){
            if (UpOrDown===1){
                UpOrDown=2;
            }
            if (UpOrDown===2){
                UpOrDown=1;
            }
        }
    }
   if (posY > ROOM_HEIGHT-shapeHeight/2) {
        stepUp = ceil(random(lowSpeed,highSpeed));
        UpOrDown = 2;
        var chance = ceil(random(0, 2));
        if (chance === 1){
            if (RightOrLeft===1){
                RightOrLeft=2;
            }
            if (RightOrLeft===2){
                RightOrLeft=1;
            }
        }
    }
    else if (posY < shapeHeight/2) {
        stepDown = ceil(random(lowSpeed,highSpeed));
        UpOrDown = 1;
        var chance = ceil(random(0, 2));
        if (chance === 1){
            if (RightOrLeft===1){
                RightOrLeft=2;
            }
             if (RightOrLeft===2){
                RightOrLeft=1;
            }
        }
    }
    
    
    fill(247, 232, 134);
    textSize(20);
    text("Your score is: "+score, 20, 20);
    text("Lives Left!", 0, 350);
    }
};

// mouse actions
var mouseClicked = function() {
    if(((mouseX >= posX && mouseX <= posX + shapeWidth / 2) || (mouseX <= posX && mouseX >= posX - shapeWidth / 2)) && ((mouseY >= posY && mouseY <= posY + shapeHeight / 2) || (mouseY <= posY && mouseY >= posY - shapeWidth / 2))) {
        score += 10;
        lowSpeed++;
        highSpeed++;
    }
    else {
        missClickCount++;
        
    }
    
    if (missClickCount === 1) {
        loseLife3 = true;
    }
    else if (missClickCount === 2) {
        loseLife2 = true; 
    }
    else if (missClickCount >= 3) {
        loseLife1 = true;
        gameOver = true;
        
    }
};



