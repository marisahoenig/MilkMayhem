#define CATNUM 2
#define CATSPRITE 1 //1-3
#define LIVESPRITE 4 //4-6
//health = 7, 8, 9
#define HEALTHNUM 2
#define FRIDGESPACE 16 //store in 10

#define BULLETNUM 5 //number of bullets you can fire
#define BULLETSPRITE 11 //store in 11-15


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
// void updateScore();

// void drawScore(int place, int num);
// // void updateScore(int score, int ones, int tens);

int score;
int prevScore;
int lives;
int time;
int timetwo;
int hOff;
int gamehOff;

//cat different frames for walking
int catFrame;
enum {CNORM, CBACK, CFRONT };

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
} BULLET;

typedef struct {
	int row;
	int col;
	int cd;
	int width;
	int height;
	int active;
} HEALTH;
