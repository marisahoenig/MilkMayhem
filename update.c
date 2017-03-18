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