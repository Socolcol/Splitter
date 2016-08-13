#ifndef FILE_OPERATIONS_H
#define FILE_OPERATIONS_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>

#include "../include/global.h"

char* buildFullPath(char* pathToFile, char* fileName); // Returns a string like this: pathToFile\fileName
int copyBytes(FILE* scrFile, FILE* destFile, int howManyBytes);
void copyFile(char* srcFileName, char* cpyFileName);
void copyFileTo(char* srcFileName, char* cpyFileName, char* src_folder,char* dest_folder); // Copies an entire file, byte per byte, from a folder, to another
MemFile* copyFileToMemory(FILE* fp);
MemFileInt* copyFileToMemoryAsInt(FILE* fp);
int deleteFile(char* fileName);
char* concatenate (char* str1, char*str2);   // Merges 2 strings into 1
int countAllFiles(char* startingPath, char* extFilter);
int countFilesSingleFolder(char* pathToFolder, char* extFilter);
MemFile* copyFileToMemory(FILE* fp);
int fileExists(char* fileName);                     // Returns 1 if the file with the given name exist in the same folder as this exe and 0 otherwise
char** getAllFiles(char* pathToFiles, char* extFilter, long* filesToPatchCount);
char** getFilesSingleFolder(char* pathToFiles, char* extFilter, int totalFiles);
long getBytesEndingPos(const char* bytesToLocate, FILE* file);     // Locates any given array of bytes in a given file, returns the byte offset of the last byte that matched or -1 if it couldn't find it
char* getCurrentPath();
char* getFileExt(char* fileName);
long getFileSize(FILE* fp);
void goInside(char* startingPath, char*** fileNames, char* extFilter, long* currentFile);
int isDirectory(const char *completePath);
long locateInt(int intToLocate, FILE* fp);
int matchingBytes(FILE* file1, FILE* file2);
void moveFile(char* fileName, char* src_folder,char* dest_folder); // Moves a file from one folder to another
char* oneLevelDown(char* path); // Returns a string with the path stripped one level down
FILE* openFile(char* fileName,const char* mode);    // Open a file and checks if the file was opened successfully
size_t readLine(char* line, FILE* fp);
void systemCopyAndRename(char* srcFileName, char* destFileName,char* src_folder,char* dest_folder);
void systemCopy(char* srcFileName,char* src_folder,char* dest_folder);
void systemMove(char* fileTypeFilter, char* src_folder,char* dest_folder);
void systemMkDir(char* folderPath);
#endif // FILE_OPERATIONS_H
