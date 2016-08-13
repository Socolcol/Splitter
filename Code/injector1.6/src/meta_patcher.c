#include "../include/meta_patcher.h"

void runMetaPatcher()
{
    FILE* metaFile = openFile("pad00000.meta","rb");
    printf("\n\nReading meta file...");
    MemFileInt* metaFileInMemory = copyFileToMemoryAsInt(metaFile);
    fclose(metaFile);
    printf("\nDone...");

    long currentFileToPatch = 0;
    long currentFileBlock = 0;
    int i = 0;
    int foundInHashFile = 0;

    printf("\n\n---------------------All Set----------------------\n");

    printColor("\n\n================== Applying Patch ==================", YELLOW);
    for (currentFileToPatch = 0; currentFileToPatch < filesToPatchCount; currentFileToPatch++)
    {
        foundInHashFile = 0;
        printf("\n(%ld/%ld): %s ", currentFileToPatch + 1, filesToPatchCount, filesToPatch[currentFileToPatch].fileName);

        for (currentFileBlock = 0; currentFileBlock < fileBlocksCount; currentFileBlock++)
        {
            if (strcmpi(filesToPatch[currentFileToPatch].fileName,fileBlocks[currentFileBlock].fileName) == 0)
            {
                foundInHashFile = 1;
                long hashLocation = locateIntInMemory(fileBlocks[currentFileBlock].hash,metaFileInMemory);

                if (hashLocation != NOT_FOUND)
                {
                    metaFileInMemory->block[hashLocation + 1] = MODDED_BYTES[regionSelected][0];
                    metaFileInMemory->block[hashLocation + 2] = MODDED_BYTES[regionSelected][1];

                    filesToPatch[currentFileToPatch].patched = 1;

                    printColor("Success!", GREEN);
                    overrallSuccessCount++;

                    // Breaks the fileBlocks loop (we already found what we need)
                    break;
                }
                else
                {
                    printColor("Not Found", RED);
                    printf(" Hash: %ld", fileBlocks[currentFileBlock].hash);
                    overrallFailsCount++;
                }
            }
        }
        if (foundInHashFile == 0)
        {
             printColor("Not Found", RED);
             overrallFailsCount++;
        }
    }

    printf("\n\nWriting changes to meta file...");
    metaFile = openFile("pad00000.meta","rb+");
    for (i = 0; i < metaFileInMemory->size; i++)
    {
        fwrite(&metaFileInMemory->block[i],sizeof(int),1,metaFile);
    }
    fclose(metaFile);

    free(metaFileInMemory->block);
    free(metaFileInMemory);
    printf("\nDone...");
}



