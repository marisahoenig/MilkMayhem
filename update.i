# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
# 1 "main.h" 1
# 9 "main.h"
void init();
void update();
void draw();

void goToSplash();
void updateSplash();
void goToInstructions();
void updateInstructions();
void goToControls();
void updateControls();
void initGame();
void goToGame();
void updateGame();
void goToPause();
void updatePause();
void goToWin();
void updateWin();
void goToLose();
void updateLose();

void hideSprites();





int score;
int prevScore;
int lives;
int time;
int hOff;
int gamehOff;

typedef struct {
 int row;
 int col;
 int rd;
 int cd;
 int width;
 int height;
 int moveState;
 int prevMoveState;
 int currFrame;
 int aniCounter;
 int active;
 int stopRange;
 int maxJumpSpeed;
 int racc;
 int possibleRow;
} PLAYER;

typedef struct {
 int row;
 int col;
 int rd;
 int cd;
 int width;
 int height;
 int active;
} CAT;

typedef struct {
 int row;
 int col;
 int rd;
 int cd;
 int width;
 int height;
 int active;
} HEALTH;

typedef struct {
 int row;
 int col;
 int rd;
 int cd;
 int width;
 int height;
} FRIDGE;
# 2 "update.c" 2
# 1 "update.h" 1
void updateCat(CAT* c);
int collisionEnemyPlayer(PLAYER* p, CAT* c);
void updateHealth(HEALTH* health, PLAYER* p);
# 3 "update.c" 2


void updateCat(CAT* c) {
 if (c->active) {
  if (c->col <= 0) {

   c->active = 0;
  }
  c->col -= c->cd ;
 }
}


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



  }
  if (health->row <= 0) {
   health->active = 0;
  }
 }
}
