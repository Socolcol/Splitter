#include "../include/meta_injector.h"

FileBlock* getFileBlocks(FILE* hashFile)
{
    printf("\n-------------Preparing to patch files-------------\n\n");
    printf("Reading hashes file...");
    MemFile* hashFileInMemory = NULL;
    FileBlock* fileBlocks = NULL;

    hashFileInMemory = copyFileToMemory(hashFile);

    fileBlocksCount = -1;

    long i = 0;
    int divisionCounter = 0;

    for (i = 0; i < hashFileInMemory->size; i++)
    {
        if (hashFileInMemory->bytes[i] == '|')
        {
            divisionCounter++;
        }
        if (hashFileInMemory->bytes[i] == '\n')
        {
            if (divisionCounter == 2)
            {
                fileBlocksCount++;
            }
            divisionCounter = 0;
        }
    }

    fileBlocks = (FileBlock*) calloc(fileBlocksCount,sizeof(FileBlock));

    // Global variable, first line of the hash file has the number of PAZ files that it contains
    hashFileTotalPazNum = atoi(strtok(hashFileInMemory->bytes,"\n"));

    for (i = 0; i < fileBlocksCount; i++)
    {
        fileBlocks[i].hash = atoi(strtok(NULL,"|"));
        fileBlocks[i].folderName = strtok(NULL,"|");
        fileBlocks[i].fileName = strtok(NULL,"\n");

        // Prevents the strcmp returning != 0 even though they are equal
        fileBlocks[i].fileName[strlen(fileBlocks[i].fileName) - 1] = '\0';
    }

    free(hashFileInMemory);
    printf("\nDone...");

    return fileBlocks;
}

void runMetaInjector()
{
    FILE* hashFile = NULL;

    hashFile = openFile(buildFullPath(PATCHER_RESOURCES_FOLDER_NAME,"hashes.txt"), "rb");

    fileBlocks = getFileBlocks(hashFile);

    fclose(hashFile);
}
