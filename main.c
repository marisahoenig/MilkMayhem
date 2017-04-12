/*****************************************
I am making a game where the milk carton (player) is trying to reach the refridgerator
at the end of a scrolling background. There will be platforms and enemies (cats) involved
which the milk must battle to get past and not lose lives.

Currently, if the milk loses 3 lives, it will lose. However, it can collect hearts to boost
its life. Right now, you can fire milk droplets at the cats to get rid of them (press A) or simply jump
over them (press B). If you hit 5 cats, the refridgerator will appear. Reach the refridgerator to win!

Eventually, the hearts will be milk levels instead of hearts and there will be opportunities to boost the
number of lives/milk levels.

Left, Right Arrows - Move
A - Fire milk droplet
B - Jump
Select - Use cheat to turn into chocolate milk and no cats will harm you
******************************************/

#include <stdlib.h>
#include "main.h"
#include "mylib.h"
#include "update.h"
#include "splashscreen.h"
#include "instructions.h"
#include "spritesheet.h"
#include "winscreen.h"
#include "losescreen.h"
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

// player bullet
BULLET bullet;
BULLET bullets[BULLETNUM];

// function pointers
void (*state)();

//player different frames for walking
int currFrame;
enum { PNORM, PLEFT, PRIGHT };

int direction;
enum { RIGHT, LEFT };

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
	REG_BG1HOFS = 0;
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
	if (BUTTON_PRESSED(BUTTON_START)) {
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
	p.stopRange = 8;
	p.maxJumpSpeed = SHIFTUP(5);
	p.racc = 40; //row accel

	c.row = 120;
	c.col = 200;
	c.rd = 0;
	c.cd = 1;
	c.width = 64;
	c.height = 32;
	c.active = 0;
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

	fridge.row = 96;
	fridge.col = 208;
	fridge.rd = 0;
	fridge.cd = 1;
	fridge.width = 32;
	fridge.height = 64;
	fridge.active = 0;

	//create player's bullets
	bullet.row = 145;
	bullet.col = 0;
	bullet.cd = 2; //move to the right
	bullet.width = 8;
	bullet.height = 8;
	bullet.active = 0;

	for (int i = 0; i < BULLETNUM; i++) {
		bullets[i] = bullet;
	}

	chocolateMilk = 0;

	hOff = 0;
	lives = 3;
	score = 0;
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
	waitForVblank();
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
	REG_BG1HOFS = 0;
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
	DMANow(3, losescreenTiles, &CHARBLOCKBASE[0], losescreenTilesLen/2);
    DMANow(3, losescreenMap, &SCREENBLOCKBASE[30], losescreenMapLen/2);
	state = updateLose;
}

void updateLose() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToSplash();
	}
}

/** OTHER METHODS **/

void update() {
	p.rd += p.racc;
    p.row += p.rd;

	if(!(BUTTON_HELD(BUTTON_RIGHT) && !(BUTTON_HELD(BUTTON_LEFT)))) {
		//if neither is held, be at the normal state
		p.moveState = PNORM;
	}

	if (p.moveState == PNORM) {
		p.currFrame = 0;
	} else {
		p.aniCounter++;
	}

	if (BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT)) {
		if (BUTTON_HELD(BUTTON_RIGHT)) {
			p.moveState = PRIGHT;
			p.direction = RIGHT;
			p.col += p.cd;
			hOff += p.cd;
		}
		if (BUTTON_HELD(BUTTON_LEFT)) {
			p.moveState = PLEFT;
			p.direction = LEFT;
			p.col -= p.cd;
			hOff += p.cd;
		}
		if (p.aniCounter % 10 == 0) {
			// goes through the 3 frames 
			if (p.currFrame < 2) {
				p.currFrame += 1;
			} else if (p.currFrame == 2) {
				p.currFrame = 1;
			}
		}
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
			if(!c->active) { // the first inactive cat 
				c->active = 1; 		// setting active to TRUE
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
		if (c->active) {
			updateCat(c);

			if (!chocolateMilk && collisionEnemyPlayer(&p, c)) {
				playSoundB(meow, MEOWLEN, MEOWFREQ, 0);
				c->active = 0;
				lives--;
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
				b->col = p.col + p.width; //shoot from right side of carton
				// if (p.moveState == PLEFT) {
				// 	b->cd = -b->cd;
				// }
				break;
			}
		}
	}
	//make the bullet keep moving if active
	for(int i = 0; i < BULLETNUM; i++) { 
		BULLET * b = &bullets[i];
		if(b->active) {
			updateBullet(b);
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
	if (chocolateMilk) {
			shadowOAM[0].attr2 = ((ATTR2_PALBANK(1)) | (SPRITEOFFSET16(p.direction*8, p.currFrame*4))); //ref to sprite sheet
	} else {
			shadowOAM[0].attr2 = ((ATTR2_PALBANK(0)) | (SPRITEOFFSET16(p.direction*8, p.currFrame*4))); //ref to sprite sheet
	}

	//draw all active cats, hide inactive
	for(int i = 0; i < CATNUM; i++) { 
		CAT * c = &cats[i];
		if (c->active) { 	// cat sprites in shadowOAM 1-3
			shadowOAM[CATSPRITE + i].attr0 = ATTR0_WIDE | (ROWMASK & c->row);
			shadowOAM[CATSPRITE + i].attr1 = ATTR1_SIZE64 | c->col;
			shadowOAM[CATSPRITE + i].attr2 = SPRITEOFFSET16(16, (c->catFrame)*8);
		} else {
			shadowOAM[CATSPRITE + i].attr0 = ATTR0_HIDE;
		}
	}   

	//draw all the active bullets, hide inactive
	for(int i = 0; i < BULLETNUM; i++) { 
		BULLET * b = &bullets[i];
		if (b->active) { 	// //player bullets stored in shadowOAM 26-36
			shadowOAM[BULLETSPRITE + i].attr0 = ATTR0_WIDE | (ROWMASK & b->row);
			shadowOAM[BULLETSPRITE + i].attr1 = ATTR1_SIZE8 | b->col;
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
		shadowOAM[FRIDGESPACE].attr0 = ATTR0_TALL | (ROWMASK & fridge.row);
		shadowOAM[FRIDGESPACE].attr1 = ATTR1_SIZE64 | fridge.col;
		shadowOAM[FRIDGESPACE].attr2 = SPRITEOFFSET16(0, 12);
	}
	
	//transfer OAM to shadowOAM
	DMANow(3, shadowOAM, OAM, 512);

	waitForVblank(); 	
}

void hideSprites() {
	//loop through 128 possible sprites and hide
    for (int num = 1; num < 128; num++) {
    	shadowOAM[num].attr0 = ATTR0_HIDE;
    }
}