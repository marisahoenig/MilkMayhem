
    /*****************************************
    I am making a game where the milk carton (player) is trying to reach the refridgerator
    at the end of a scrolling background. There will be platforms and enemies (cats) involved
    which the milk must battle to get past and not lose lives.

    
    ******************************************/

#include <stdlib.h>
#include "main.h"
#include "mylib.h"
#include "update.h"
#include "splashscreen.h"
#include "instructions.h"
#include "spritesheet.h"
#include "background.h"
#include "winscreen.h"
#include "losescreen.h"
#include "pausescreen.h"
#include "movebackground.h"

unsigned int buttons;
unsigned int oldButtons;

OBJ_ATTR shadowOAM[128];

PLAYER p;
CAT c;
CAT cats[CATNUM];
int timeToNextCat;

int state;
// state enums
enum { SPLASHSCREEN, INSTRUCTIONSSCREEN, GAMESCREEN, LOSESCREEN, WINSCREEN, PAUSESCREEN };

int currFrame;
enum { PNORM, PLEFT, PRIGHT, PJUMP };

int main() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	loadPalette(splashscreenPal); //load the background's palette

	goToSplash(); //go to splash screen

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		// REG_BG0VOFS = vOff;
		//switch between states
		switch(state) {
        	case SPLASHSCREEN:
	        	updateSplash();
	        	break;
	        case INSTRUCTIONSSCREEN:
	        	updateInstructions();
	        	break;
	        case GAMESCREEN:
	        	updateGame();
	        	break;
	        case LOSESCREEN:
	        	updateLose();
	        	break;
	        case WINSCREEN:
	        	updateWin();
	        	break;
	        case PAUSESCREEN:
	        	updatePause();
	        	break;
        }
	}
}

/** STATES **/

void goToSplash() {
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(31);
	DMANow(3, splashscreenTiles, &CHARBLOCKBASE[0], splashscreenTilesLen/2);
    DMANow(3, splashscreenMap, &SCREENBLOCKBASE[31], splashscreenMapLen/2);
	state = SPLASHSCREEN;
}

//automatically called through switch statement
void updateSplash() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		//press start to go to instructions
		goToInstructions();
	}
}

//initialize everything
void initGame() {
	REG_DISPCTL = MODE0 | BG0_ENABLE| SPRITE_ENABLE; //enable both backgrounds for gameplay
	// REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29);
	// DMANow(3, backgroundTiles, &CHARBLOCKBASE[1], backgroundTilesLen/2);
 //    DMANow(3, backgroundMap, &SCREENBLOCKBASE[29], backgroundMapLen/2);

    DMANow(3, spritesheetPal, SPRITE_PALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);  

    //second background
	REG_BG0CNT = BG_SIZE3 | CBB(0) | SBB(26);
	DMANow(3, movebackgroundTiles, &CHARBLOCKBASE[0], movebackgroundTilesLen/2);
    DMANow(3, movebackgroundMap, &SCREENBLOCKBASE[26], movebackgroundMapLen/2);

    //hide all the sprites at beginning
    hideSprites();

	//create player
	p.row = 128;
	p.col = 112; //exact middle of screen
	p.rd = 0;
	p.cd = 1;
	p.width = 16;
	p.height = 32;
	p.moveState = PNORM;
	p.currFrame = PNORM;
	p.aniCounter = 0;
	p.active = 1;

	c.row = 144;
	c.col = 200;
	c.rd = 0;
	c.cd = 4;
	c.width = 32;
	c.height = 16;
	c.active = 0;

	//initialize score, lives
	// score = 0;
	// prevScore = 0;
	// ones = 0;
	// tens = 0;
	// lives = 3;

	hOff = 0;
}

void goToInstructions() {
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
	DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], instructionsTilesLen/2);
    DMANow(3, instructionsMap, &SCREENBLOCKBASE[30], instructionsMapLen/2);
	state = INSTRUCTIONSSCREEN;
}

void updateInstructions() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		//press start to init and go to game
		initGame();
		goToGame(); 
	}
}

void goToGame() {
	//enable both backgrounds
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	// vOff = gamevOff; //go back to gamevOff
	state = GAMESCREEN;
}

void updateGame() {
	update();
	waitForVblank();
	draw();

	if (BUTTON_PRESSED(BUTTON_START)) {
    	goToPause();
    }
}

void goToPause() {
	REG_DISPCTL = MODE0 | BG2_ENABLE; //enable Pause background in BG2
	REG_BG2CNT = BG_SIZE0 | CBB(2) | SBB(30); //because 256x256 pixels
	// vOff = 0;
	DMANow(3, pausescreenTiles, &CHARBLOCKBASE[2], pausescreenTilesLen/2);
    DMANow(3, pausescreenMap, &SCREENBLOCKBASE[30], pausescreenMapLen/2);
	state = PAUSESCREEN;
}

void updatePause() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToSplash();
	}
}

void goToWin() { //can write on same CBB because never displaying both backgrounds at once
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
	// vOff = 0;
	DMANow(3, winscreenTiles, &CHARBLOCKBASE[0], winscreenTilesLen/2);
    DMANow(3, winscreenMap, &SCREENBLOCKBASE[30], winscreenMapLen/2);
	state = WINSCREEN;
}

void updateWin() {
	if (BUTTON_PRESSED(BUTTON_START)) { //can return to splash
		goToSplash();
	}
}

void goToLose() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
	// vOff = 0;
	DMANow(3, losescreenTiles, &CHARBLOCKBASE[0], losescreenTilesLen/2);
    DMANow(3, losescreenMap, &SCREENBLOCKBASE[30], losescreenMapLen/2);
	state = LOSESCREEN;
}

void updateLose() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToSplash();
	}
}


/** OTHER METHODS **/

void update() {
	//causes moving background to move up
	// gamevOff++; //only increment game counter so when switch states, starts at same spot
	// vOff = gamevOff;

	if(!(BUTTON_HELD(BUTTON_RIGHT) && !(BUTTON_HELD(BUTTON_LEFT)))) {
		//if neither is held, be at the normal state
		p.moveState = PNORM;
	}
	// if(BUTTON_HELD(BUTTON_LEFT)) {
	// 	p.moveState = PLEFT;
	// 	p.col -= p.cd;
	// }
	// if(BUTTON_HELD(BUTTON_RIGHT)) {
	// 	p.moveState = PRIGHT;
	// 	p.col += p.cd;
	// }
	// if (BUTTON_PRESSED(BUTTON_UP)) {
	// 	p.moveState = PJUMP;
	// }

	if (p.moveState == PNORM) {
		p.currFrame = 0;
		p.moveState = p.prevMoveState;
	} else {
		p.aniCounter++;
	}

	if (p.col + p.width >= 240) {
		p.col = 240 - p.width;
	}
	if (p.col <= 0) {
		p.col = 1;
	}

// else if (p.moveState = PJUMP) {
// 		p.currFrame = 3;
// 	} 

	if (BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT)) {
		if (BUTTON_HELD(BUTTON_RIGHT)) {
			p.moveState = PRIGHT;
			p.col += p.cd;
		}
		if (BUTTON_HELD(BUTTON_LEFT)) {
			p.moveState = PLEFT;
			p.col -= p.cd;
		}
		if(p.aniCounter % 30 == 0) {
			// goes through the 3 frames 
			if (p.currFrame < 2) {
				p.currFrame += 1;
			} else if (p.currFrame == 2) {
				p.currFrame = 0;
			}
		}
	}

	// CATS (ENEMIES)
	if (!(time++ % timeToNextCat)) { //after a given amount of time, create a cat w/ pooling
		for(int i = 0; i < CATNUM; i++) { 
			CAT * c = &cats[i];
			if(!c->active) { // the first inactive cat 
				c->active = 1; 		// setting active to TRUE
				c->row = 128;
				c->col = 220;
				timeToNextCat = rand()%30 + 80;
				break;
			}	
		}
	}
	//move the the cat if active
	for(int i = 0; i < CATNUM; i++) { 
		CAT * c = &cats[i];
		if(c->active) {
			updateCat(c);
		}
	}

	// //any active enemies should be moving
	// //checks enemies to see if all have been destroyed
	// gameWin = 1; //assume game would be won
	// for(int i = 0; i < ENEMYNUM; i++) {
	// 	ENEMY * e = &enemies[i];
	// 	if (e->active) {
	// 		updateEnemy(e); //move active enemies
	// 		//only check enemy and player collision if far enough down screen
	// 		if (e->row + e->height >= 135) { 
	// 			collisionEnemyPlayer(e, &p);
	// 		}
	// 		for(int i = 0; i < BULLETNUM; i++) { 
	// 			BULLET * b = &bullets[i];
	// 			if(b->active) {
	// 				collisionCheckEnemy(b, e); //check if any active bullets have hit the enemies
	// 			}			
	// 		}
	// 		gameWin = 0; //if any are active, you have not won yet	
	// 	}
	// }

	//only update the score if it has changed
// 	if (prevScore != score) {
// 		updateScore();
// 	}
}

void draw() {
	//player stored in shadowOAM 0
	shadowOAM[0].attr0 = p.row | ATTR0_TALL;
	shadowOAM[0].attr1 = ATTR1_SIZE32 | p.col;
	shadowOAM[0].attr2 = SPRITEOFFSET16(0, p.currFrame*2); //ref to sprite sheet

	// //draw all the active enemies, hide inactive
	// for(int i = 0; i < ENEMYNUM; i++) { 
	// 	ENEMY * e = &enemies[i];
	// 	if (e->active) { 	// enemy sprites stored in shadowOAM1-25
	// 		shadowOAM[ENEMYSPRITE + i].attr0 = e->row;
	// 		shadowOAM[ENEMYSPRITE + i].attr1 = ATTR1_SIZE16 | e->col;
	// 		shadowOAM[ENEMYSPRITE + i].attr2 = SPRITEOFFSET16((enemies[i].type)*2, 0);
	// 	} else {
	// 		shadowOAM[ENEMYSPRITE + i].attr0 = ATTR0_HIDE;
	// 	}
	// }  

	// //draw all the active bullets, hide inactive
	// for(int i = 0; i < BULLETNUM; i++) { 
	// 	BULLET * b = &bullets[i];
	// 	if (b->active) { 	// //player bullets stored in shadowOAM 26-36
	// 		shadowOAM[BULLETSPRITE + i].attr0 = b->row;
	// 		shadowOAM[BULLETSPRITE + i].attr1 = ATTR1_SIZE8 | b->col;
	// 		shadowOAM[BULLETSPRITE + i].attr2 = SPRITEOFFSET16(0, 8);
	// 	} else {
	// 		shadowOAM[BULLETSPRITE + i].attr0 = ATTR0_HIDE;
	// 	}
	// }   	

	//draw all active seeds (enemy bullets), hide inactive
	for(int i = 0; i < CATNUM; i++) { 
		CAT * c = &cats[i];
		if (c->active) { 	// cat sprites in shadowOAM 1-10
			shadowOAM[CATSPRITE + i].attr0 = ATTR0_WIDE | c->row;
			shadowOAM[CATSPRITE + i].attr1 = ATTR1_SIZE32 | c->col;
			shadowOAM[CATSPRITE + i].attr2 = SPRITEOFFSET16(0, 8);
		} else {
			shadowOAM[CATSPRITE + i].attr0 = ATTR0_HIDE;
		}
	}   
	
	// //draw both digits of the score
	// drawScore(1, ones);
	// drawScore(0, tens);

	// // draw hearts for the lives
	// for (int i = 0; i < 3; i++) { // loop through the 3 lives
	// 	if (i + 1 <= lives) { //draw the ones that are there
	// 		shadowOAM[LIVESPRITE + i].attr0 = 150 | ATTR0_WIDE;
	// 		shadowOAM[LIVESPRITE + i].attr1 = ATTR1_SIZE16 | (24 + (10*i));
	// 		shadowOAM[LIVESPRITE + i].attr2 = SPRITEOFFSET16(0, 9);
	// 	} else { //hide any of the other hearts
	// 		shadowOAM[LIVESPRITE + i].attr0 = ATTR0_HIDE;
	// 	}
	// }	

	//transfer OAM to shadowOAM
	DMANow(3, shadowOAM, OAM, 512);

	waitForVblank(); 
	//if the game was won, go to win screen	
	// if (gameWin) {
	// 	goToWin();
	// }		
}

//update the game score based on hits
// void updateScore() {
// 	if (score <= 0) { //never get negative score
// 		score  = 0;
// 	}
// 	prevScore = score;
// 	//determines math for each digit based on score
// 	ones = score % 10;
// 	tens = score / 10;
// }

//drawn in 48 and 49 shadowOAM
//draw the current score
// void drawScore(int place, int num) {
// 	// shadowOAM[SCORESPRITE + place].attr0 = 150;
// 	// shadowOAM[SCORESPRITE + place].attr1 = ATTR1_SIZE8 | (8*place);
// 	// shadowOAM[SCORESPRITE + place].attr2 = SPRITEOFFSET16(6, num);
// }

//draw the hearts indicating lives
// void drawLives(int lives) {
// 	// for (int i = 0; i < 3; i++) { // 3 lives
// 	// 	if (i + 1 <= lives) {
// 	// 		shadowOAM[LIVESPRITE + i].attr0 = 150 | ATTR0_WIDE;
// 	// 		shadowOAM[LIVESPRITE + i].attr1 = ATTR1_SIZE16 | (24 + (10*i));
// 	// 		shadowOAM[LIVESPRITE + i].attr2 = SPRITEOFFSET16(0, 9);
// 	// 	}
// 	// }	
// }

void hideSprites() {
	//loop through 128 possible sprites and hide
    for (int num = 1; num < 128; num++) {
    	shadowOAM[num].attr0 = ATTR0_HIDE;
    }
}