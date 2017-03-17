# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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


typedef struct
{
 const volatile void *src;
 const volatile void *dst;
 u32 cnt;
} DMA_CONTROLLER;
# 202 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 259 "myLib.h"
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
# 2 "myLib.c" 2

unsigned short * videoBuffer = (unsigned short *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer = (u16 *)0x600A000;



void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control) {
    ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].src = source;
    ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].dst = destination;
    ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].cnt = (1 << 31) | control;
}


void loadPalette(volatile const unsigned short* palette) {
    DMANow(3, palette, ((u16 *)0x5000000), 256);
}


void drawImage4(volatile const unsigned short* image, int row, int col, int width, int height) {

    if (col & 1) {
        col = col + 1;
    }
    for (int r = 0; r < height; r++) {
        DMANow(3, (unsigned short*)&image[((r)*(width)+(0))/2], &videoBuffer[((row+r)*(240)+(col))/2], (width/2));
    }
}


void drawBackgroundImage4(volatile const unsigned short* image) {
    DMANow(3, image, videoBuffer, (240*160)/2);
}


void drawRect(int row, int col, int height, int width, unsigned short color) {
    volatile unsigned short c = color;
    for (int r = 0; r < height; r++) {
        DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void waitForVblank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}



void flipPage() {
    if((*(u16 *)0x4000000) & (1<<4)) {
        (*(u16 *)0x4000000) &= ~(1<<4);
        videoBuffer = backBuffer;
    } else {
        (*(u16 *)0x4000000) |= (1<<4);
        videoBuffer = frontBuffer;
    }
}
