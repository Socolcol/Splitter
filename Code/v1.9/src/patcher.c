#include "../include/patcher.h"


/* **********************************************************************
 *
 *                        RUN PATCHER
 *
 ************************************************************************/
void runPatcher(int menu1ChosenOption)
{
    FileBlock* fileBlocks = NULL;
    FileBlock* filesToPatch = NULL;
    long filesToPatchCount = 0;
    MetaFileInfo* metaFileInfo = NULL;
    int filesNotPatchedCount = 0;
    int filesSkippedCount = 0;

    int i = 0, j = 0;

     printf("\nCounting files...\n\n");
    // Counts how many files there is in the "files_to_patch" folder assigns to filesToPatchCount,
    // and get all the file names in folders and sub folders and returns them as an array of strings
    filesToPatch = getAllFiles("files_to_patch\\","*",&filesToPatchCount);

    printf("%ld files were found in files_to_patch\\\n\n", filesToPatchCount);


    if (!backupExists())
    {
        createBackup();
    }

    metaFileInfo = getMetaFileInfo(getLatestBackup());
    fileBlocks = fillFileBlocks(metaFileInfo);

    /* for (i = 0; i < metaFileInfo->fileBlocksCount; i++)
    {
        printf("%ld|%ld|%ld|%ld|%s|%s\n",fileBlocks[i].hash,fileBlocks[i].folderNum,fileBlocks[i].fileNum,fileBlocks[i].pazNum,fileBlocks[i].folderName,fileBlocks[i].fileName);
    }*/

    printf("\nSearching for files in the meta file...\n");

    FileBlock* fileBlockFound = NULL;

    for (j = 0; j < filesToPatchCount; j++)
    {
        if (menu1ChosenOption == 0) // If the folder structure of the "files to patch" folder IS important
        {
            printf("\n(%d/%ld): %s%s ",j + 1, filesToPatchCount, substr(filesToPatch[j].originalPath,strlen("files_to_patch/"), strlen(filesToPatch[j].originalPath)),filesToPatch[j].fileName);
        }
        else
        {
            printf("\n(%d/%ld): %s ",j + 1, filesToPatchCount, filesToPatch[j].fileName);
        }



        if ((strcmpi(filesToPatch[j].fileName,"multiplemodeldesc.xml") == 0) ||(strcmpi(filesToPatch[j].fileName,"partcombinationdesc.xml") == 0))
        {
             printColor("Skipped", YELLOW);
             filesToPatch[j].needPatch = -2;
             filesSkippedCount++;
        }
        else
        {
            // Searches all the File Blocks for the file name
            fileBlockFound = NULL;


            for (i = 0; i < metaFileInfo->fileBlocksCount; i++)
            {
                //printf("%ld|%ld|%ld|%ld|%s|%s\n",fileBlocks[i].hash,fileBlocks[i].folderNum,fileBlocks[i].fileNum,fileBlocks[i].pazNum,fileBlocks[i].folderName,fileBlocks[i].fileName);
                if (strcmpi(fileBlocks[i].fileName,filesToPatch[j].fileName) == 0)
                {
                    if (menu1ChosenOption == 0) // If the folder structure of the "files to patch" folder IS important
                    {
                        // Check the folder name for a match
                        if (contains(filesToPatch[j].originalPath,fileBlocks[i].folderName))
                        {
                             fileBlockFound = &fileBlocks[i];
                             break; // Prevents it to keep looking the other file blocks
                        }
                    }
                    else // If the folder structure of the "files to patch" folder is not important
                    {   // Don't check the folder name for a match, if the fileName match, we are good
                        fileBlockFound = &fileBlocks[i];
                        break; // Prevents it to keep looking the other file blocks
                    }

                }
            }

            if (fileBlockFound != NULL) // If the name was found
            {
                addToFilesToPatch(fileBlockFound, &filesToPatch[j]);
                printColor("Found!", GREEN);

            }
            else
            {
                printColor("Not Found.", RED);
                filesNotPatchedCount++;
            }
        }
    }


    /// COPYING FILES
     printf("\n\nCopying files from \"files_to_patch\\\" to their right locations...\n");
     copyFilesBack(filesToPatch, filesToPatchCount);


    /// PATCHING META FILE
    patchMetaFile(filesToPatch, filesToPatchCount, menu1ChosenOption);


    printf("\n\nFinished!\n");

    filesNotPatchedCount = 0;
    for(i = 0; i < filesToPatchCount; i++)
    {
        if(filesToPatch[i].needPatch == 0)
        {
            filesNotPatchedCount++;
        }
    }

    if(filesNotPatchedCount > 0)
    {
        printColor("\nThose files have failed to patch:", RED);
        int lineCount = 0;
        for(i = 0; i < filesToPatchCount; i++)
        {
            if(filesToPatch[i].needPatch == 0)
            {
                if (lineCount % 4 == 0)
                {
                    printf("\n");

                }
                printf("%s\t",filesToPatch[i].fileName);
                lineCount++;
            }
        }
        printf("\n");
        printf("\n\nCheck \"Paz\\patcher_resources\\missing_files.txt\" to see if any of those files are in this list.\n");
        printf("If they are, there is nothing it can be done at the moment.");
    }



    printColor("\n\n-------------- Overall Results --------------\n", YELLOW);
    printf("Patched: \033[32;1m%ld\033[0m Not Patched: \033[31;1m%d\033[0m Skipped: \033[33;1m%d\033[0m",filesToPatchCount - filesNotPatchedCount - filesSkippedCount, filesNotPatchedCount, filesSkippedCount);


    if (filesNotPatchedCount == 0)
    {
        printColor("\n\n\tAll files have been patched successfully!", GREEN);
    }

    printf("\n\n");


    // END INSTALL
    for(i = 0; i < metaFileInfo->fileBlocksCount; i++)
    {
        free(fileBlocks[i].fileName);
        free(fileBlocks[i].folderName);
    }

    free(fileBlocks);

    for(i = 0; i < filesToPatchCount; i++)
    {
        free(filesToPatch[i].fileName);
        free(filesToPatch[i].originalPath);
    }
    free(filesToPatch);

     exit(1);

}


void patchMetaFile(FileBlock* filesToPatch, int filesToPatchCount, int menu1ChosenOption)
{
    int i = 0;
    int filesPatched = 0;
    long random_folder_num = 1;
    long random_file_num = 60556;

    printf("\n\nWe are about to make changes to your pad00000.meta file.");
    printf("\nPlease make sure you have made a manual backup before proceeding...\n\n");

    printf("\n\nPatching Meta File...\n");

     /// QUICK SORT "Files to patch" according to the meta offset
    qsort(filesToPatch,filesToPatchCount,sizeof(FileBlock),compare_meta_offset);


    FILE* metaFile = openFile("pad00000.meta","rb+");
    createPath("patcher_resources\\");
    FILE* modFile = fopen("patcher_resources\\latest_modifications_meta_injector.bin","wb+");

     printf("        HASH  FOLDER_NUM FILE_NUM BYTE_IN_META_FILE| FILE_NAME");
    for (i = 0; i < filesToPatchCount; i++)
    {

        if(filesToPatch[i].needPatch == 1)
        {

            if (menu1ChosenOption == 0)
            {
                 printf("\n%.3d - %s %s  %s    (%.8ld)    | %s%s",filesPatched + 1, endian_convert((int)filesToPatch[i].hash),endian_convert((int)filesToPatch[i].folderNum),endian_convert((int)filesToPatch[i].fileNum), filesToPatch[i].metaOffset, substr(filesToPatch[i].originalPath,strlen("files_to_patch/"), strlen(filesToPatch[i].originalPath)), filesToPatch[i].fileName);
            }
            else
            {
                 printf("\n%.3d - %s %s  %s    (%.8ld)    | %s",filesPatched + 1, endian_convert((int)filesToPatch[i].hash),endian_convert((int)filesToPatch[i].folderNum),endian_convert((int)filesToPatch[i].fileNum), filesToPatch[i].metaOffset, filesToPatch[i].fileName);
            }

            // Backup the original values to the  latest modification file
            fwrite(&filesToPatch[i].metaOffset,sizeof(long),1,modFile);
            fwrite(&filesToPatch[i].folderNum,sizeof(long),1,modFile);
            fwrite(&filesToPatch[i].fileNum,sizeof(long),1,modFile);

            fseek(metaFile,filesToPatch[i].metaOffset + sizeof(long), SEEK_SET); // Goes to the position right after the Hash, which has the folder num value

            /// The most important part, breaks the meta file index by changing the 2 next ints after the hash with any random value that doesn't have a folderNum && fileNum match
            fwrite(&random_folder_num, sizeof(long),1,metaFile);
            fwrite(&random_file_num, sizeof(long),1,metaFile);

            filesPatched++;
            /*if (filesToPatchCount < 1000)
            {
                Sleep(12);
            }
            else
            {
                Sleep(5);
            }*/
        }
    }

    fclose(metaFile);
    fclose(modFile);
}


void addToFilesToPatch(FileBlock* fileBlockFound, FileBlock* filesToPatch)
{
    filesToPatch->metaOffset = fileBlockFound->metaOffset;
    filesToPatch->hash = fileBlockFound->hash;
    filesToPatch->folderNum = fileBlockFound->folderNum;
    filesToPatch->fileNum = fileBlockFound->fileNum;
    filesToPatch->folderName = fileBlockFound->folderName;
    filesToPatch->needPatch = 1;
}

void copyFilesBack(FileBlock* filesToPatch, int filesToPatchCount)
{
    int i = 0;
    int replaceAll = 0;
    int skippAll = 0;
    char input = '\0';
    char* root = bdoRootFolder();
    long filesCopied = 0;
    long filesNotCopied = 0;
    for(i = 0; i < filesToPatchCount; i++)
    {
        if(filesToPatch[i].needPatch == 1)
        {


            char* folderPath = concatenate(root,filesToPatch[i].folderName);
            char* filePath = concatenate(folderPath,filesToPatch[i].fileName);
            createPath(folderPath);

            if (fileExists(filePath))
            {
                if (replaceAll == 0 && skippAll == 0)
                {
                    input = '\0';
                    while (input != ENTER && input != BACKSPACE && input != 's' && input != 'S' && input != 'R' && input != 'r')
                    {
                        printf("\nThe file \"%s\" already exists in \"%s\"\n", filesToPatch[i].fileName,folderPath);
                        printf("ENTER = Replace    ESCAPE = Skip   R = Replace All   S = Skip All\n\n");
                        input = getch();

                    }
                    if (input == 'r' || input == 'R')
                    {
                        replaceAll = 1;
                    }
                     if (input == 's' || input == 'S')
                    {
                        skippAll = 1;
                    }
                    if (input == ENTER || input == 'r' || input == 'R')
                    {
                        printf("%ld) - %s", filesCopied+1, filesToPatch[i].fileName);
                        if(!copyFileTo(filesToPatch[i].fileName,filesToPatch[i].fileName,filesToPatch[i].originalPath,folderPath))
                        {
                           filesToPatch[i].needPatch = 0;
                           filesNotCopied++;
                        }
                    }
                }
                else if (skippAll == 0)
                {
                    printf("%ld) - %s", filesCopied+1, filesToPatch[i].fileName);
                    if(!copyFileTo(filesToPatch[i].fileName,filesToPatch[i].fileName,filesToPatch[i].originalPath,folderPath))
                    {
                       filesToPatch[i].needPatch = 0;
                       filesNotCopied++;
                    }
                }
            }
            else
            {
                printf("%ld) - %s", filesCopied+1, filesToPatch[i].fileName);
                if(!copyFileTo(filesToPatch[i].fileName,filesToPatch[i].fileName,filesToPatch[i].originalPath,folderPath))
                {
                   filesToPatch[i].needPatch = 0;
                   filesNotCopied++;
                }
            }
            filesCopied++;
         }
    }
    printf("\nDone\n\n    Copied: %ld of %ld files.\n",filesCopied -  filesNotCopied, filesCopied);

    if (filesNotCopied != 0)
    {
        printColor("\nWarning: ", RED);
        printf("Some files failed to copy!\n");
    }
}





