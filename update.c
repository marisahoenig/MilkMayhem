#include "main.h"
#include "myLib.h"
#include "update.h"

//make cat move and if go offscreen, make inactive
void updateCat(CAT* c) {
	if (c->active) {
		if (c->col <= 0) {
			//if goes offscreen, set cat to inactive
			c->active = 0;
		}

		c->col -= c->cd; //move cat

		c->aniCounter++;

		if(c->aniCounter % 10 == 0) {
			// goes through the 3 frames 
			if (c->catFrame < 2) {
				c->catFrame += 1;
			} else if (c->catFrame == 2) {
				c->catFrame = 1;
			}
		}
	}
}

void updateFridge(FRIDGE* fridge) {
	if (fridge->active) {
		if (fridge->col <= 0) {
			//if goes offscreen, set fridge to inactive
			fridge->active = 0;
		}
		// fridge->col -= fridge->cd;
	}
}

//check if cat hits player
int collisionEnemyPlayer(PLAYER* p, CAT* c) {
	int shiftedRow = SHIFTDOWN(p->row);
	if ((shiftedRow <= c->row && shiftedRow+ p->height >= c->row + c->height)
		&& (p->col + p->width >= c->col) && (p->col <= c->col + c->width)) {
		return 1;
	}
	return 0;
}

//health that player can collect
void updateHealth(HEALTH* health, PLAYER* p) {
	if (health->active) {
		health->col -= health->cd;
		int shiftedRow = SHIFTDOWN(p->row);
		if ((shiftedRow <= health->row && shiftedRow + p->height >= health->row + health->height)
			&& (p->col + p->width >= health->col) && (p->col <= health->col + health->width)) {
			health->active = 0;
			if (lives < 3) {
				lives++;
			}	
		}
		if (health->col <= 0) {
			health->active = 0;
		}
	}
}

//allow bullet to move
//if goes off screen, sets it inactive
void updateBullet(BULLET* b) {
	if (b->active) { //check that the bullet is active
		b->col += b->cd;
		if(b->col + b->width >= 240) { // if the bullet goes past the screen, it is inactive
			b->active = 0;
		}
	}
}

//Bullets that hit the enemy - check collision
void collisionCheckEnemy(BULLET* b, CAT* c) {
    if ((b->row <= c->row + c->height) && (b->row + b->height >= c->row) &&
    	((b->col + b->width <= c->col + c->width && b->col + b->width >= c->col) ||
    		(b->col <= c->col + c->width && b->col >= c->col))) {
    	score++; //add to score
    	c->active = 0; //both enemy and bullet inactive
        b->active = 0;
    }
}

//Bullets that hit the enemy - check collision
void collisionFridge(FRIDGE* f, PLAYER* p) {
	int shiftedRow = SHIFTDOWN(p->row);
    if ((shiftedRow <= f->row + f->height) && (shiftedRow + p->height >= f->row) &&
    	(p->col + p->width <= f->col + f->width) && (p->col + p->width >= f->col)) {
    	goToWin();
    }
}