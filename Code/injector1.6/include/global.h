#ifndef GLOBAL_H
#define GLOBAL_H
#include <stdlib.h>
#include <stdio.h>

#define TOTAL_GAME_REGIONS 4
#define NOT_FOUND -1

typedef enum {NA,RU,KR,JP} GameRegion;

// This is the key variable to this process
// it stores the hash bytes (bytes that we will be looking for in the updated meta file)
// and the name of the file and folder we are going to patch
typedef struct
{
    long hash;
    long folderNum;
    long fileNum;
    char* folderName;
    char* fileName;
} FileBlock;

typedef struct
{
    char* bytes;
    long size;
} MemFile;

typedef struct
{
    int* block;
    long size;
} MemFileInt;

typedef struct
{
    char* fileName;
    int patched;
    int totalFails;
} FileToPatch;

extern int overrallSuccessCount;
extern int overrallFailsCount;

// This is a variable that it stays the same once it's defined when the user choses the game's region in the menu
// This variable tells the program which one of the "moddedBytes" the program should use when replacing the bytes
extern int regionSelected;

extern int hashFileTotalPazNum;

extern char* PATCHER_RESOURCES_FOLDER_NAME; // Holds the path to the folder that contains the resources used by Meta Injector
extern char* FILES_TO_PATCH_FOLDER_NAME; // Holds the path to the folder that contains the files to be patched

// This is the variable that contains the 8 bytes that are going to be replaced after each reference byte is found
extern int MODDED_BYTES[][2];


extern FileBlock* fileBlocks;
extern long fileBlocksCount;
extern FileToPatch* filesToPatch;
extern long filesToPatchCount;

extern char* bdoRootFolder;
#endif // GLOBAL_H
