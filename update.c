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
int collisionEnemyPlayer(PLAYER* p, CAT* c) {
	if ((p->row <= c->row && p->row + p->height >= c->row + c->height)
		&& (p->col + p->width >= c->col)) {
		return 1;
	}
	return 0;
}

void updateHealth(HEALTH* health, PLAYER* p) {
	if (health->active) {
		health->col -= health->cd;
		if ((p->row <= health->row && p->row + p->height >= health->row + health->height)
			&& (p->col + p->width >= health->col)) {
			health->active = 0;
			// if (lives < 3) {
			// 	lives++;
			// }	
		}
		if (health->row <= 0) {
			health->active = 0;
		}
	}
}