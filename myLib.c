#include "myLib.h"

unsigned short * videoBuffer = (unsigned short *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

// Functions

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control) {
    DMA[channel].src = source;
    DMA[channel].dst = destination;
    DMA[channel].cnt = DMA_ON | control;
}

//allows use of color palette
void loadPalette(volatile const unsigned short* palette) {
    DMANow(3, palette, PALETTE, 256);
}

//draws an image in mode 4
void drawImage4(volatile const unsigned short* image, int row, int col, int width, int height) {
    //If this image is being drawn on an odd column, just add 1 to the column and then draw it
    if (col & 1) { //if col odd
        col = col + 1; // add to col if draw on odd col
    }
    for (int r = 0; r < height; r++) {
        DMANow(3, (unsigned short*)&image[OFFSET(r,0, width)/2], &videoBuffer[OFFSET(row+r, col, 240)/2], (width/2));
    }
}

//draws entire background image with dimensions that fit screen
void drawBackgroundImage4(volatile const unsigned short* image) {
    DMANow(3, image, videoBuffer, (240*160)/2);
}

// draw rectangle
void drawRect(int row, int col, int height, int width, unsigned short color) {
    volatile unsigned short c = color;
    for (int r = 0; r < height; r++) {
        DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, 240)], width);
    }
}

// equivalent to a delay
void waitForVblank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

//flips between videobuffers
//one buffer is shown while other is drawn on
void flipPage() {
    if(REG_DISPCTL & BUFFER2) {
        REG_DISPCTL &= ~BUFFER2;
        videoBuffer = backBuffer;
    } else {
        REG_DISPCTL |= BUFFER2;
        videoBuffer = frontBuffer;
    }
}