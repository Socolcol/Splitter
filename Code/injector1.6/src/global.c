#include "global.h"

int regionSelected = -2;
int hashFileTotalPazNum = 0;

char* PATCHER_RESOURCES_FOLDER_NAME = "patcher_resources\\";
char* FILES_TO_PATCH_FOLDER_NAME = "files_to_patch\\";

// This is the variable that contains the 8 bytes that are going to be replaced after each reference byte is found
int MODDED_BYTES[][2] = {{1,66404},{1,170861},{1,60556},{1,91771}};
//char *MODDED_BYTES[4] = {"\x01\x00\x00\x00\x64\x03\x01\x00","\x01\x00\x00\x00\x6D\x9B\x02\x00","\x01\x00\x00\x00\x8C\xEC\x00\x00","\x01\x00\x00\x00\x7B\x66\x01\x00"};
//                                  NA                                 RU                                   KR                               JP

int overrallSuccessCount = 0;
int overrallFailsCount = 0;

FileBlock* fileBlocks = NULL;
long fileBlocksCount = 0;
FileToPatch* filesToPatch = NULL;
long filesToPatchCount = 0;

char *bdoRootFolder = NULL;
