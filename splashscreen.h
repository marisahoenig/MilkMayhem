
//{{BLOCK(splashscreen)

//======================================================================
//
//	splashscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 205 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6560 + 2048 = 9120
//
//	Time-stamp: 2017-04-18, 00:34:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHSCREEN_H
#define GRIT_SPLASHSCREEN_H

#define splashscreenTilesLen 6560
extern const unsigned short splashscreenTiles[3280];

#define splashscreenMapLen 2048
extern const unsigned short splashscreenMap[1024];

#define splashscreenPalLen 512
extern const unsigned short splashscreenPal[256];

#endif // GRIT_SPLASHSCREEN_H

//}}BLOCK(splashscreen)
