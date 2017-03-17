# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
# 1 "main.h" 1




void init();
void update();
void draw();

void goToSplash();
void updateSplash();
void goToInstructions();
void updateInstructions();
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
# 2 "update.c" 2
# 1 "update.h" 1
void updateCat(CAT* c);
# 3 "update.c" 2

void updateCat(CAT* c) {
 if (c->active) {
  c->col -= c->cd;
 }
 if (c->col + c->width <= 0) {

  c->active = 0;
 }
}
