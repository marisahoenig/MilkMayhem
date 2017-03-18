#include "main.h"
#include "update.h"

//make cat move and if go offscreen, make inactive
void updateCat(CAT* c) {
	if (c->active) {
		if (c->col <= 0) {
			//if goes offscreen, set cat to inactive
			c->active = 0;
		}
		c->col -= c->cd;
	}
}

//check if enemy hits player
void collisionEnemyPlayer(PLAYER* p, CAT* c) {
	if ((p->row <= c->row && p->row + p->height >= c->row + c->height)
		&& (p->col + p->width >= c->col)) {
		c->active = 0;
		lives--; //if collide, lose a life
	}
}