# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
# 1 "main.h" 1
# 12 "main.h"
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
 int active;
} FRIDGE;

typedef struct {
 int row;
 int col;
 int cd;
 int width;
 int height;
 int active;
} BULLET;
# 2 "update.c" 2
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern unsigned short *videoBuffer;
# 49 "myLib.h"
extern unsigned short *videoBuffer;
# 65 "myLib.h"
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void waitForVblank();
int sprintf (char *string, const char *form, ...);
void flipPage();
void loadPalette(volatile const unsigned short* palette);
void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width);
void drawBackgroundImage4(volatile const unsigned short* image);
char *short2bin(short x, char arr[]);






extern unsigned int oldButtons;
extern unsigned int buttons;
# 107 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);
# 116 "myLib.h"
typedef volatile struct {
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 207 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 268 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 3 "update.c" 2
# 1 "update.h" 1
void updateCat(CAT* c);
int collisionEnemyPlayer(PLAYER* p, CAT* c);
void updateHealth(HEALTH* health, PLAYER* p);
void updateBullet(BULLET* b);
void collisionCheckEnemy(BULLET* b, CAT* c);
# 4 "update.c" 2


void updateCat(CAT* c) {
 if (c->active) {
  if (c->col <= 0) {

   c->active = 0;
  }
  c->col -= c->cd;
 }
}


int collisionEnemyPlayer(PLAYER* p, CAT* c) {
 int shiftedRow = ((p->row) >> 8);
 if ((shiftedRow <= c->row && shiftedRow+ p->height >= c->row + c->height)
  && (p->col + p->width >= c->col) && (p->col <= c->col + c->width)) {
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



void updateBullet(BULLET* b) {
 if (b->active) {
  b->col += b->cd;
  if(b->col + b->width >= 240) {
   b->active = 0;
  }
 }
}


void collisionCheckEnemy(BULLET* b, CAT* c) {
    if ((b->row <= c->row + c->height) &&
     ((b->col + b->width <= c->col + c->width && b->col + b->width >= c->col) ||
      (b->col <= c->col + c->width && b->col >= c->col))) {
     score++;
     c->active = 0;
        b->active = 0;
    }
}
