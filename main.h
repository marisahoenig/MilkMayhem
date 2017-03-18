// #define SCORESPRITE 48 //stored in 48-49 ShadowOA
#define CATNUM 2
#define CATSPRITE 1
#define LIVESPRITE 4

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
// void updateScore();

// void drawScore(int place, int num);
// // void updateScore(int score, int ones, int tens);
// void drawLives(int lives);

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