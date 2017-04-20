# 1 "sounds.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sounds.c"
# 1 "sounds.h" 1
void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();
void pauseSound();
void unpauseSound();

void setupInterrupts();
void interruptHandler();

typedef struct {
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
} SOUND;
# 2 "sounds.c" 2
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
int move;


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
# 3 "sounds.c" 2
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
# 4 "sounds.c" 2

SOUND soundA;
SOUND soundB;

void setupSounds() {
    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(1, sound, (void*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.duration = (((59.727)*length)/frequency);
        soundA.data = sound;
        soundA.vbCount = 0;
}

void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(2, sound, (void*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        soundB.loops = loops;
        soundB.duration = (((59.727)*length)/frequency);
        soundB.data = sound;
        soundB.vbCount = 0;

}

void pauseSound() {
 soundA.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000106 = 0;
}

void unpauseSound() {
 soundA.isPlaying = 1;
 *(volatile unsigned short*)0x4000102 = (1<<7);
 soundB.isPlaying = 1;
 *(volatile unsigned short*)0x4000106 = (1<<7);
}

void stopSound() {
 dma[1].cnt = 0;
 dma[2].cnt = 0;
 soundA.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000106 = 0;
}

void setupInterrupts() {
 *(unsigned short*)0x4000208 = 0;
 *(unsigned int*)0x3007FFC = (unsigned int) interruptHandler;

 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
 {

  if (soundA.isPlaying) {
            soundA.vbCount++;
            if (soundA.vbCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
                } else {
                    dma[1].cnt = 0;
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = 0;
                }
            }
        }
        if (soundB.isPlaying) {
            soundB.vbCount++;
            if (soundB.vbCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
                } else {
                    dma[2].cnt = 0;
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = 0;
                }
            }
        }
  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }
 *(unsigned short*)0x4000208 = 1;
}
