#ifndef UTILITIES_H
#define UTILITIES_H
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "../include/global.h"

typedef enum {RED,GREEN,YELLOW} Color;

char* concatenate (char* str1, char*str2); // Merges 2 strings into 1
int hexToInt(char* hex);
char* intToHex(int x);
void printColor(char* stringToPrint, Color COLOR);
void addToStringArray(char* fileNameToAdd, char*** ref_stringArray, int* ref_arrraySize);
int alreadyInStringArray(char* fileName,char** stringArray, int arrraySize);
long locateIntInMemory(int intToLocate,MemFileInt* arrayInMemory);
void strreplace(char* str,char token,char replace);
#endif // UTILITIES_H
