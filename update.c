#include "main.h"
#include "update.h"

void updateCat(CAT* c) {
	if (c->active) {
		c->col -= c->cd;
	}
	if (c->col + c->width <= 0) {
		//if goes offscreen, reverse column delta and go down a row
		c->active = 0;
	}
}