# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
# 1 "main.h" 1
# 14 "main.h"
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

int catsRemaining;
int lives;
int time;
int timetwo;
int hOff;
int gamehOff;
int hurt;
int hurtCount;


int catFrame;
enum {CNORM, CBACK, CFRONT };

int direction;
enum { RIGHT, LEFT };

typedef struct {
 int row;
 int col;
 int rd;
 int cd;
 int width;
 int height;
 int moveState;
 int currFrame;
 int direction;
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
 int living;
 int catFrame;
 int moveState;
 int aniCounter;
} CAT;

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
 int direction;
} BULLET;

typedef struct {
 int row;
 int col;
 int cd;
 int width;
 int height;
 int active;
} HEALTH;
# 2 "update.c" 2
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern unsigned short *videoBuffer;
# 52 "myLib.h"
extern unsigned short *videoBuffer;
# 68 "myLib.h"
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
# 110 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);
# 119 "myLib.h"
typedef volatile struct {
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 210 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 274 "myLib.h"
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
void updateFridge(FRIDGE* fridge);
int collisionEnemyPlayer(PLAYER* p, CAT* c);
void updateHealth(HEALTH* health, PLAYER* p);
void updateBullet(BULLET* b);
void collisionCheckEnemy(BULLET* b, CAT* c);
void collisionFridge(FRIDGE* f, PLAYER* p);
# 4 "update.c" 2


void updateCat(CAT* c) {
 if (c->living) {
  if (c->col >= 240 || c->col < 0) {
   c->living = 0;
  }
  if (c->active) {
   c->col -= c->cd;
  } else if (!(c->active)) {
   c->col += c->cd;
  }
  c->aniCounter++;

  if(c->aniCounter % 10 == 0) {

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
  fridge->col += fridge->cd;
  if (fridge->col <= 0) {

   fridge->active = 0;
  }

 }
}


int collisionEnemyPlayer(PLAYER* p, CAT* c) {
 int shiftedRow = ((p->row) >> 8);
 if (c->active && (shiftedRow <= c->row && shiftedRow + p->height >= c->row + c->height)
  && (p->col + p->width >= c->col) && (p->col <= c->col + c->width)) {
  return 1;
 }
 return 0;
}


void updateHealth(HEALTH* health, PLAYER* p) {
 if (health->active) {
  health->col -= health->cd;
  int shiftedRow = ((p->row) >> 8);
  if ((shiftedRow <= health->row && shiftedRow + p->height >= health->row + health->height)
   && (p->col + p->width >= health->col) && (p->col <= health->col + health->width)) {
   if (lives < 3) {
    health->active = 0;
    lives++;
   }
  }
  if (health->col <= 0) {
   health->active = 0;
  }
 }
}



void updateBullet(BULLET* b) {
 if (b->active) {
  if (b->direction == LEFT) {
   b->col -= b->cd;
   if (b->col < 0) {
    b->active = 0;
   }
  } else {
   b->col += b->cd;
   if(b->col + b->width >= 240) {
    b->active = 0;
   }
  }

 }
}


void collisionCheckEnemy(BULLET* b, CAT* c) {
    if ((b->row <= c->row + c->height) && (b->row + b->height >= c->row) &&
     ((b->col + b->width <= c->col + c->width && b->col + b->width >= c->col) ||
      (b->col <= c->col + c->width && b->col >= c->col))) {
     catsRemaining--;
     c->active = 0;
        b->active = 0;
    }
}


void collisionFridge(FRIDGE* f, PLAYER* p) {
 int shiftedRow = ((p->row) >> 8);
    if ((shiftedRow <= f->row + f->height) && (shiftedRow + p->height >= f->row) &&
     (p->col + p->width <= f->col + f->width) && (p->col + p->width >= f->col)) {
     goToWin();
    }
}
