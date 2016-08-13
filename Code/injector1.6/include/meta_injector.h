#ifndef METAINJECTOR_H
#define METAINJECTOR_H
#include "../include/global.h"
#include "../include/utilities.h"
#include "../include/meta_patcher.h"
#include "../include/file_operations.h"
FileBlock* getFileBlocks(FILE* hashFile);
void runMetaInjector();
#endif
