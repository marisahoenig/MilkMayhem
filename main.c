/*****************************************
Milk Mayhem is a game in which YOU are the milk carton trying to return to the refridgerator
after getting left out in the kitchen. (Don't you hate it when people forget to put the milk away?)

Unfortunately for you, this house has lots of cats which are constantly trying to drink the milk
from your carton. Get back to the refridgerator by running to the right, jumping over and shooting milk 
droplets at the enemy cats. If 3 cats drink your milk, you're an empty carton and didn't make it back. 
However, there are some small cartons of milk that can replenish your supply.

After deflecting 5 cats, you'll reach the fridge, as indicated in the progress bar in the upper right-hand 
corner. Reach the refridgerator to win!

Left, Right Arrows - Move
A - Fire milk droplet
B - Jump
Select - Use cheat to turn into chocolate milk and no cats will harm you

COOL THINGS:
- Palette Row Swapping for harm to player and chocolate milk
- Gravity
- Function Pointers
- Custom Art (and sound! The main music is me playing ukulele)

******************************************/

#include <stdlib.h>
#include "main.h"
#include "mylib.h"
#include "update.h"
#include "splashscreen.h"
#include "instructions.h"
#include "spritesheet.h"
#include "winscreen.h"
#include "losescreen1.h"
#include "losescreen2.h"
#include "pausescreen.h"
#include "movebackground.h"
#include "controls.h"
#include "uke.h"
#include "meow.h"
#include "sounds.h"
#include "lights.h"

unsigned int buttons;
unsigned int oldButtons;

OBJ_ATTR shadowOAM[128];

PLAYER p;
CAT c;
CAT cats[CATNUM];
int timeToNextCat;
int timeToNextHealth;
HEALTH health;
HEALTH hearts[HEALTHNUM];
FRIDGE fridge;
int chocolateMilk;
int counter;

// player bullet
BULLET bullet;
BULLET bullets[BULLETNUM];

// function pointers
void (*state)();

//player different frames for walking
int currFrame;
enum { PNORM, PLEFT, PRIGHT };

int main() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	loadPalette(splashscreenPal); //load the background's palette

	goToSplash(); //go to splash screen

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		//function pointers for state
		state();
	}
}

/** STATES **/

void goToSplash() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(31);
	REG_BG0HOFS = 0;
	DMANow(3, splashscreenTiles, &CHARBLOCKBASE[0], splashscreenTilesLen/2);
    DMANow(3, splashscreenMap, &SCREENBLOCKBASE[31], splashscreenMapLen/2);
	state = updateSplash;
}

//automatically called through switch statement
void updateSplash() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		//press start to go to instructions
		goToInstructions();
	}
}

void goToInstructions() {
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(31);
	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;
	DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], instructionsTilesLen/2);
    DMANow(3, instructionsMap, &SCREENBLOCKBASE[31], instructionsMapLen/2);
	state = updateInstructions;
}

void updateInstructions() {
	if (BUTTON_PRESSED(BUTTON_LEFT)) {
		goToSplash();
	}
	if (BUTTON_PRESSED(BUTTON_RIGHT)) {
		//press start to view controls
		goToControls();
	}
}

void goToControls() {
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(29);
	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;
	DMANow(3, controlsTiles, &CHARBLOCKBASE[0], controlsTilesLen/2);
    DMANow(3, controlsMap, &SCREENBLOCKBASE[29], controlsMapLen/2);
	state = updateControls;
}

void updateControls() {
	if (BUTTON_PRESSED(BUTTON_LEFT)) {
		goToInstructions();
	}
	if (BUTTON_PRESSED(BUTTON_START)) {
		//press start to init and go to game
		initGame();
		goToGame(); 
	}
}

//initialize everything
void initGame() {
	REG_DISPCTL = MODE0 | BG0_ENABLE| BG1_ENABLE | SPRITE_ENABLE; //enable background

    DMANow(3, spritesheetPal, SPRITE_PALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);  

    //hide all the sprites at beginning
    hideSprites();

    //set up the sounds
	setupInterrupts();
	setupSounds();

	//create player
	p.row = SHIFTUP(90);
	p.col = 112; //exact middle of screen
	p.rd = 0;
	p.cd = 2;
	p.width = 32;
	p.height = 64;
	p.moveState = PNORM;
	p.currFrame = PNORM;
	p.direction = RIGHT;
	p.aniCounter = 0;
	p.active = 1;
	p.stopRange = 10;
	p.maxJumpSpeed = SHIFTUP(5);
	p.racc = 40; //row accel

	c.row = 120;
	c.col = 230;
	c.rd = 0;
	c.cd = 1;
	c.width = 64;
	c.height = 32;
	c.active = 0;
	c.living = 0;
	c.moveState = CNORM;
	c.catFrame = CNORM;
	c.aniCounter = 0;

	for (int i = 0; i < CATNUM; i++) {
		cats[i] = c;
	}

	health.row = 140;
	health.col = 240;
	health.cd = 1;
	health.width = 16;
	health.height = 16;
	health.active = 0;

	for (int i = 0; i < HEALTHNUM; i++) {
		hearts[i] = health;
	}

	fridge.row = 32;
	fridge.col = 208;
	fridge.rd = 0;
	fridge.cd = 2;
	fridge.width = 32;
	fridge.height = 64;
	fridge.active = 0;

	//create player's bullets
	bullet.row = 145;
	bullet.col = 0;
	bullet.cd = 2; //move to the right
	bullet.width = 16;
	bullet.height = 16;
	bullet.active = 0;
	bullet.direction = RIGHT;

	for (int i = 0; i < BULLETNUM; i++) {
		bullets[i] = bullet;
	}

	chocolateMilk = 0;

	hOff = 0;
	lives = 3;
	score = 0;
	hurt = 0;
}

void goToGame() {
	//enable both backgrounds
	REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE;

	//first background (main, kitchen)
	REG_BG1CNT = BG_SIZE3 | CBB(1) | SBB(26);
	DMANow(3, movebackgroundTiles, &CHARBLOCKBASE[1], movebackgroundTilesLen/2);
    DMANow(3, movebackgroundMap, &SCREENBLOCKBASE[26], movebackgroundMapLen/2);

 	//second background (lights)
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(25);
	DMANow(3, lightsTiles, &CHARBLOCKBASE[0], lightsTilesLen/2);
    DMANow(3, lightsMap, &SCREENBLOCKBASE[25], lightsMapLen/2);    

	REG_BG1HOFS = hOff;
	REG_BG0HOFS = hOff/2;
	playSoundA(uke, UKELEN, UKEFREQ, 1);
	state = updateGame;
}

void updateGame() {
	update();
	draw();

	if (BUTTON_PRESSED(BUTTON_START)) {
    	goToPause();
    }
}

void goToPause() {
	REG_DISPCTL = MODE0 | BG1_ENABLE; //enable Pause background in BG2
	REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(30); //because 256x256 pixels
	REG_BG1HOFS = 0;
	DMANow(3, pausescreenTiles, &CHARBLOCKBASE[1], pausescreenTilesLen/2);
    DMANow(3, pausescreenMap, &SCREENBLOCKBASE[30], pausescreenMapLen/2);
	state = updatePause;
}

void updatePause() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToSplash();
	}
}

void goToWin() { 
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
	REG_BG0HOFS = 0;
	hOff = 0;
	DMANow(3, winscreenTiles, &CHARBLOCKBASE[0], winscreenTilesLen/2);
    DMANow(3, winscreenMap, &SCREENBLOCKBASE[30], winscreenMapLen/2);
	state = updateWin;
}

void updateWin() {
	if (BUTTON_PRESSED(BUTTON_START)) { //return to splash
		goToSplash();
	}
}

void goToLose() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
	REG_BG0HOFS = 0;
	hOff = 0;
	DMANow(3, losescreen2Tiles, &CHARBLOCKBASE[0], losescreen2TilesLen/2);
    DMANow(3, losescreen2Map, &SCREENBLOCKBASE[30], losescreen2MapLen/2);
	state = updateLose;
}

void updateLose() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToSplash();
	}
	if (counter % 20 == 0) {
		DMANow(3, losescreen2Tiles, &CHARBLOCKBASE[0], losescreen2TilesLen/2);
    	DMANow(3, losescreen2Map, &SCREENBLOCKBASE[30], losescreen2MapLen/2);
	} else {
		DMANow(3, losescreen1Tiles, &CHARBLOCKBASE[0], losescreen1TilesLen/2);
	    DMANow(3, losescreen1Map, &SCREENBLOCKBASE[30], losescreen1MapLen/2);
	}
	counter++;
}

/** OTHER METHODS **/

void update() {
	p.rd += p.racc;
    p.row += p.rd;

	if (BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT)) {
		p.aniCounter++; //increment animation
		if (BUTTON_HELD(BUTTON_RIGHT)) {
			p.direction = RIGHT;
				hOff += p.cd;
			if (fridge.active) {
				fridge.cd = -2;
				updateFridge(&fridge);
			}
		}
		if (BUTTON_HELD(BUTTON_LEFT)) {
			p.direction = LEFT;
				hOff -= p.cd;
			if (fridge.active) {
				fridge.cd = 2;
				updateFridge(&fridge);
			}
		}
		if (p.aniCounter % 30 == 0) {
			// goes through the 3 frames 
			if (p.currFrame < 2) {
				p.currFrame += 1;
			} else if (p.currFrame == 2) {
				p.currFrame = 1;
			}

		}

		// if (hurt && p.aniCounter % 40 == 0) {
		// 	hurt = 0;
		// }
	} else {
		//if neither is held, be at the normal state
		currFrame = 0;
	}
	if (hurt) {
		if (hurtCount > 3) {
			hurt = 0;
			hurtCount = 0;
		}
		hurtCount++;
	}

	if (SHIFTDOWN(p.row) >= 160 - p.height - 1) { //so it won't go below ground
        p.row = SHIFTUP(160 - p.height - 1);
        p.rd = 0;
    }
    if (SHIFTDOWN(p.row) <= 0) { //so it won't go above ceiling
        p.row = SHIFTUP(0);
        p.rd = -p.rd;
    }
    if (p.col + p.width > 240) {
    	p.col = 240-p.width;
    }
    if (p.col < 0) {
    	p.col = 0;
    }

	if (BUTTON_PRESSED(BUTTON_B) && p.rd > -p.stopRange && p.rd < p.stopRange) {//jump
		p.rd = -p.maxJumpSpeed;
	}

	// CATS (ENEMIES)
	if (!(time++ % timeToNextCat)) { //after a given amount of time, create a cat w/ pooling
		for(int i = 0; i < CATNUM; i++) { 
			CAT * c = &cats[i];
			if(!c->living) { // the first inactive cat 
				c->active = 1; 		// setting active to TRUE
				c->living = 1;
				// c->row = 128;
				c->col = 220;
				timeToNextCat = rand()%300 + 87;
				break;
			}	
		}
	}

	//move cat and check if collides with player
	for (int i = 0; i < CATNUM; i++) {
		CAT * c = &cats[i];
		if (c->living) {
			updateCat(c);

			if (!chocolateMilk && collisionEnemyPlayer(&p, c)) {
				playSoundB(meow, MEOWLEN, MEOWFREQ, 0);
				c->active = 0;
				lives--;
				hurt = 1;
			}
		}
	}

	// bullets shot from the player
	if (BUTTON_PRESSED(BUTTON_A)) {
		for(int i = 0; i < BULLETNUM; i++) { 
			BULLET * b = &bullets[i];
			if(!b->active) { // the first inactive bullet 
				b->active = 1; 		// setting active to TRUE
				b->row = (SHIFTDOWN(p.row) + (p.height/2));	//shoot from mid height of carton
				b->col = p.col + (p.width/2); //shoot from right side of carton
				if (p.direction == LEFT) {
					b->direction = LEFT;
				} else {
					b->direction = RIGHT;
				}
				break;
			}
		}
	}

	//make the bullet keep moving if active
	for(int i = 0; i < BULLETNUM; i++) { 
		BULLET * b = &bullets[i];
		if(b->active) {
			updateBullet(b, &p);
			for(int i = 0; i < CATNUM; i++) { 
				CAT * c = &cats[i];
				if(c->active) {
					collisionCheckEnemy(b, c);
				}
			}	
		}
	}

	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		if (!chocolateMilk) {
			chocolateMilk = 1;
		} else if (chocolateMilk) {
			chocolateMilk = 0;
		}
	}

	// HEALTH
	if (!(timetwo++ % timeToNextHealth)) {
		for (int i = 0; i < HEALTHNUM; i++) {
			HEALTH * h = &hearts[i];
			if (!h->active) {
				h->active = 1;
				h->col = 240;
				timeToNextHealth = rand()%1000 + 87;
				break;
			}
		}
	}

	//health that player can collect
	for (int i = 0; i < HEALTHNUM; i++) {
		HEALTH * h = &hearts[i];
		if (h->active) {
			updateHealth(h, &p);
		}
	}

	if (score >= 5 && !(fridge.active)) {
		fridge.active = 1;
	}

	if (fridge.active) {
		collisionFridge(&fridge, &p);
	}

	REG_BG1HOFS = hOff;
	REG_BG0HOFS = hOff/2;

	if (lives <= 0) {
		goToLose();
	}
}

void draw() {
	//player stored in shadowOAM 0
	shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(p.row)) | ATTR0_TALL;
	shadowOAM[0].attr1 = ATTR1_SIZE64 | p.col;
	if (chocolateMilk) { //reference different rows of palette
		shadowOAM[0].attr2 = ((ATTR2_PALBANK(1)) | (SPRITEOFFSET16(p.direction*8, p.currFrame*4))); //1st row, brown
	} else if (hurt) {
		shadowOAM[0].attr2 = ((ATTR2_PALBANK(2)) | (SPRITEOFFSET16(p.direction*8, p.currFrame*4))); //2nd row, red
	} else {
		shadowOAM[0].attr2 = ((ATTR2_PALBANK(0)) | (SPRITEOFFSET16(p.direction*8, p.currFrame*4))); //0th row, regular
	}

	//draw all active cats, hide inactive
	for(int i = 0; i < CATNUM; i++) { 
		CAT * c = &cats[i];
		if (c->living) { 	// cat sprites in shadowOAM 1-3
			shadowOAM[CATSPRITE + i].attr0 = ATTR0_WIDE | (ROWMASK & c->row);
			if (c->active) {
				shadowOAM[CATSPRITE + i].attr1 = ATTR1_SIZE64 | c->col;
			} else {
				shadowOAM[CATSPRITE + i].attr1 = ATTR1_HFLIP | ATTR1_SIZE64 | c->col;
			}
			shadowOAM[CATSPRITE + i].attr2 = SPRITEOFFSET16(16, (c->catFrame)*8);
		} else {
			shadowOAM[CATSPRITE + i].attr0 = ATTR0_HIDE;
		}
	}   

	//draw all the active bullets, hide inactive
	for(int i = 0; i < BULLETNUM; i++) { 
		BULLET * b = &bullets[i];
		if (b->active) { 	// //player bullets stored in shadowOAM 26-36
			shadowOAM[BULLETSPRITE + i].attr0 = (ROWMASK & b->row);
			shadowOAM[BULLETSPRITE + i].attr1 = ATTR1_SIZE16 | b->col;
			shadowOAM[BULLETSPRITE + i].attr2 = SPRITEOFFSET16(20, 0);
		} else {
			shadowOAM[BULLETSPRITE + i].attr0 = ATTR0_HIDE;
		}
	}  

	// lives count in top left corner
	shadowOAM[LIVESPRITE].attr0 = (ROWMASK & 5) | ATTR0_TALL;
	shadowOAM[LIVESPRITE].attr1 = ATTR1_SIZE32 | 10;
	shadowOAM[LIVESPRITE].attr2 = SPRITEOFFSET16(20, lives*2);

	// moving lives for collecting
	for (int i = 0; i < HEALTHNUM; i++) {
		HEALTH * h = &hearts[i];
		if (h->active) { 	// shadowOAM 7
			shadowOAM[7 + i].attr0 = h->row;
			shadowOAM[7 + i].attr1 = ATTR1_SIZE16 | h->col;
			shadowOAM[7 + i].attr2 = SPRITEOFFSET16(22, 8);
		} else {
			shadowOAM[7 + i].attr0 = ATTR0_HIDE;
		}
	}

	if (fridge.active) {
		//top left
		shadowOAM[FRIDGESPACE].attr0 = ATTR0_TALL | (ROWMASK & fridge.row);
		shadowOAM[FRIDGESPACE].attr1 = ATTR1_SIZE64 | fridge.col;
		shadowOAM[FRIDGESPACE].attr2 = SPRITEOFFSET16(0, 12);

		//top right
		shadowOAM[FRIDGESPACE + 1].attr0 = ATTR0_TALL | (ROWMASK & fridge.row);
		shadowOAM[FRIDGESPACE + 1].attr1 = ATTR1_SIZE64 | (fridge.col + 32);
		shadowOAM[FRIDGESPACE + 1].attr2 = SPRITEOFFSET16(0, 16);

		//bottom left
		shadowOAM[FRIDGESPACE + 2].attr0 = ATTR0_TALL | (ROWMASK & (fridge.row + 64));
		shadowOAM[FRIDGESPACE + 2].attr1 = ATTR1_SIZE64 | fridge.col;
		shadowOAM[FRIDGESPACE + 2].attr2 = SPRITEOFFSET16(8, 12);

		//bottom right
		shadowOAM[FRIDGESPACE + 3].attr0 = ATTR0_TALL | (ROWMASK & (fridge.row + 64));
		shadowOAM[FRIDGESPACE + 3].attr1 = ATTR1_SIZE64 | (fridge.col + 32);
		shadowOAM[FRIDGESPACE + 3].attr2 = SPRITEOFFSET16(8, 16);
	}
	waitForVblank();
	//transfer OAM to shadowOAM
	DMANow(3, shadowOAM, OAM, 512);
}

void hideSprites() {
	//loop through 128 possible sprites and hide
    for (int num = 1; num < 128; num++) {
    	shadowOAM[num].attr0 = ATTR0_HIDE;
    }
}