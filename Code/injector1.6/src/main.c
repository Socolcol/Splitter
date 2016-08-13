#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "../include/meta_injector.h"

#define EXIT 0
#define SECOND_MENU_MAX_OPTION 2

void printHeader()
{
    printf("******************************************************\n");
    printf("*          Meta Injector Reloaded v1.6               *\n");
    printf("*              autor BlackFireBR                     *\n");
    printf("*            adaptation Taira_Miss                   *\n");
    printf("******************************************************\n");
}

// Functions Prototypes
int menu0();
int menu1(); // Displays the first menu (select region menu) and returns the option selected
int menu2(); // Displays the second menu and returns the option selected
int backupExists();
void moveFiles(char* srcFolder, char* destFolder);
void copyFiles(char* srcFolder, char* destFolder);
void createBackup();
void displayResults();
char* getFolderName(char* fileName);
void initProgram();
void cleanUp();

void initProgram()
{
    bdoRootFolder = oneLevelDown(getCurrentPath());

    if (!backupExists())
    {
        createBackup();
    }

    printf("\nCounting files...\n\n");
    // Counts how many files there is in the "files_to_patch" folder assigns to filesToPatchCount,
    // and get all the file names in folders and sub folders and returns them as an array of strings
    char** fileNames = getAllFiles(FILES_TO_PATCH_FOLDER_NAME,"*",&filesToPatchCount);

    if (filesToPatchCount == 0)
    {
        printf("No files present in %s\n\n",FILES_TO_PATCH_FOLDER_NAME);
        system("PAUSE");
        exit(1);
    }

    printf("%ld files were found in %s\n\n", filesToPatchCount, FILES_TO_PATCH_FOLDER_NAME);

    filesToPatch = (FileToPatch*)malloc(filesToPatchCount * sizeof(FileToPatch));

    long i = 0;
    for (i = 0; i < filesToPatchCount; i++)
    {
        filesToPatch[i].fileName = fileNames[i];
        filesToPatch[i].patched = 0;
    }
}

char** getBackupList(long* backupCount)
{
    return getAllFiles(getCurrentPath(),"backup",backupCount);
}

int selectBackup(char** backupNames, long backupCount)
{
    long i = 0;
     char input[32];
     int optionSelected = -1;
    int backupSelected = -1;

    printf("\n\nList of backups:\n");
    for (i = 0; i < backupCount; i++)
    {
       printf("%ld - %s\n", i + 1, backupNames[i]);
    }
    while (optionSelected < 1 || optionSelected > backupCount)
    {
        printf("\nSelect backup number: ");
        fgets(input,32,stdin);

        optionSelected = atoi(input);
        backupSelected = optionSelected - 1;

        if (optionSelected < 1 || optionSelected > backupCount)
        {
            printf("\nInvalid option!\n\n");
        }
    }

    return backupSelected;
}

int main()
{
    int menu0ChosenOption = menu0();

    while (menu0ChosenOption == 2)
    {
        long backupCount = 0;
        char** backupNames = getBackupList(&backupCount);
        if (backupCount != 0)
        {
            int backupSelected = selectBackup(backupNames, backupCount);
            char command[MAX_PATH];
            sprintf(command,"xcopy /y \"%s\" pad00000.meta",backupNames[backupSelected]);
            system(command);
        }
        else
        {
             printf("No backup was found");
        }
        printf("\n");
        system("PAUSE");
        menu0ChosenOption = menu0();
    }

    if (menu0ChosenOption != EXIT)
    {
        int menu1ChosenOption = menu1();
        regionSelected = menu1ChosenOption - 1;

        initProgram();

        // This calls the Meta Injector, but it also calls the Meta Patcher inside it, so the whole program runs by this call
        runMetaInjector();
        runMetaPatcher();

        displayResults();


        int menu2ChosenOption = menu2();

        if (menu2ChosenOption == 1)
        {
            printf("\nCopying Files...");
            copyFiles(FILES_TO_PATCH_FOLDER_NAME,bdoRootFolder);
            printf("\nDone.\n");
        }
        else if (menu2ChosenOption == 2)
        {
            printf("\nMoving Files...");
            moveFiles(FILES_TO_PATCH_FOLDER_NAME,bdoRootFolder);
            printf("\nDone.\n");
        }

        if (menu2ChosenOption != EXIT)
        {
            printf("\n");
            system("PAUSE");
        }
    }

    return 0;
}
int menu0()
{
    char input[32];       // A simple buffer to store whatever the user types in the menu
    int optionSelected = -1;

     // Display the menu to select the region
    while(optionSelected != EXIT) // This condition makes the menu repeat itself until a valid input is entered
    {
        system("cls"); // clears the screen
        printHeader();
        printf("Start patch to RU version\n");

        // Converts the read string to int
        optionSelected = 1;
        // This variable also tells the program later which one of the "moddedBytes" the program should use when replacing the bytes

        if (optionSelected == EXIT)
        {
            break;
        }

         // If the user entered an invalid option, displays a error message
        if(optionSelected < 1 || optionSelected > 2)
        {
            printf("\nInvalid option!\n\n");
            system("PAUSE");
        }
        else
        {
            break;
        }
    }

    return optionSelected;
}

int menu1()
{
    char input[32];       // A simple buffer to store whatever the user types in the menu
    int optionSelected = -1;

     // Display the menu to select the region
    while(optionSelected != EXIT) // This condition makes the menu repeat itself until a valid input is entered
    {


        // Converts the read string to int
        optionSelected = 2;
        // This variable also tells the program later which one of the "moddedBytes" the program should use when replacing the bytes

        if (optionSelected == EXIT)
        {
            break;
        }

        regionSelected = optionSelected - 1;

         // If the user entered an invalid option, displays a error message
        if(regionSelected < NA || regionSelected > JP)
        {
            printf("\nInvalid option!\n\n");
            system("PAUSE");
        }
        else
        {
            break;
        }
    }

    return optionSelected;
}

int menu2()
{
    char input[32];       // A simple buffer to store whatever the user types in the menu
    int optionSelected = -1;

    while(optionSelected < 0 || optionSelected > SECOND_MENU_MAX_OPTION) // This condition makes the menu repeat itself until a valid input is entered
    {

        // Converts the read string to int
        optionSelected = 0;

        // If the user entered an invalid option, displays a error message
        if(optionSelected < 0 || optionSelected > SECOND_MENU_MAX_OPTION)
        {
            printf("\nInvalid option!\n\n");
        }
    }
    return (optionSelected);
}

void copyFiles(char* srcFolder, char* destFolder)
{
    char* tmpPath = concatenate(bdoRootFolder,"tmp\\");
    moveFiles(srcFolder,tmpPath);
    systemCopy("*",tmpPath,destFolder);
    moveFiles(tmpPath,srcFolder);
    char rdCommand[256];
    sprintf(rdCommand, "rd /s /q \"%s\"", tmpPath);
    system(rdCommand);
}

void moveFiles(char* srcFolder, char* destFolder)
{
     // Opens the current dir
    DIR* pDir = opendir (srcFolder);
    struct dirent *pDirent;

    if (pDir == NULL)
    {
        printf ("Cannot open directory: '%s'\n", srcFolder);
        exit(1);
    }

    // Writes all the file names in this dir, into the file
    while ((pDirent = readdir(pDir)) != NULL)
    {
        char* fileName = pDirent->d_name;

         //Makes sure it doesn't write stuff like "." or ".." into the file
        if((strcmpi(fileName,".") != 0) && (strcmpi(fileName,"..") != 0))
        {
            //Creates the complete path (E.g. from C:\folder goes to c:\folder\something)
            char* completePath = buildFullPath(srcFolder,fileName);

            // If it's a file, not a folder
            if (!isDirectory(completePath))
            {
                char* folderName = getFolderName(fileName);
                char* folderPath = concatenate(destFolder,folderName);
                char* destPath = concatenate(folderPath,fileName);
                 strreplace(folderPath,'/','\\');

                DIR* dir = opendir(folderPath);

                if (dir)
                {
                    closedir(dir);
                }
                else
                {
                    char mdCommand[256];
                    sprintf(mdCommand,"md \"%s\"",folderPath);
                    system(mdCommand);
                }

                //printf("\nrename %s %s\n", completePath, concatenate(folderPath,fileName));

                if (fileExists(destPath))
                {
                    remove(destPath);
                }

                rename(completePath,destPath);
            }
            else
            {
                strcat(completePath,"\\");
                moveFiles(completePath, destFolder);
            }
        }
    }

    //Closes the dir and the file
    closedir (pDir);
}

char* getFolderName(char* fileName)
{
    long i = 0;
    for (i = 0; i < fileBlocksCount; i++)
    {
        if (strcmpi(fileName,fileBlocks[i].fileName) == 0)
        {
            return fileBlocks[i].folderName;
        }
    }
    char* blank = "";
    return blank;
}


void cleanUp()
{
    long i = 0;
    for (i = 0; i < fileBlocksCount; i++)
    {
        free(fileBlocks[i].fileName);
        free(fileBlocks[i].folderName);
    }
    free(fileBlocks);

    for (i = 0; i < filesToPatchCount; i++)
    {
        free(filesToPatch[i].fileName);
    }
    free(filesToPatch);
}


void displayResults()
{
    printColor("\n\n-------------- Overall Results --------------\n", YELLOW);
    printf("Files Patched: \033[32;1m%d\033[0m Files Not Patched: \033[31;1m%d\033[0m",overrallSuccessCount, (int)(filesToPatchCount - overrallSuccessCount));

    if (overrallFailsCount > 0)
    {
        printColor("\n\n------- Those files couldn't patched --------\n",RED);
        long i = 0;
        for (i = 0; i < filesToPatchCount; i++)
        {
            if (filesToPatch[i].patched == 0)
            {
                printf("%s\n", filesToPatch[i].fileName);
            }
        }
        printf("\nThis is not an error.\nUnfortunately, there is no way to make them work.");
    }

    if (overrallSuccessCount == filesToPatchCount)
    {
        printColor("\n\n\tAll files have been patched successfully!", GREEN);
    }

    printf("\n\n");
}


void createBackup()
{
    int backupNameLen = strlen("pad00000[YYYY-MM-DD].meta.backup");
    char* backupName = (char*)malloc(backupNameLen + 1);

    time_t now;
    time(&now);

    struct tm* now_tm;
    now_tm = localtime(&now);

    strftime (backupName, backupNameLen + 1, "pad00000[%Y-%m-%d].meta.backup", now_tm);

    char* cmd = (char*) malloc(strlen("copy pad00000.meta pad00000[YYYY-MM-DD].meta.backup") + 1);
    sprintf(cmd,"copy pad00000.meta %s", backupName);
    system(cmd);

    printf("\nA new backup was created: %s\n",backupName);
}

int backupExists()
{
    char* currentPath = getCurrentPath();
    int backupCount = countFilesSingleFolder(currentPath,"backup");
    if (backupCount == 1)
    {
        printf("%d backup was found\n", backupCount);
    }
    else
    {
        printf("%d backups were found\n", backupCount);
    }
    char** backups = getFilesSingleFolder(currentPath,"backup", backupCount);
    FILE* backupFile = NULL;
    FILE* metaFile = openFile("pad00000.meta","rb");

    int i = 0;
    for(i = 0; i < backupCount; i++)
    {
        backupFile = fopen(backups[i],"rb");
        if (getFileSize(backupFile) == getFileSize(metaFile))
        {
            fclose(metaFile);
            fclose(backupFile);
            return 1;
        }
        fclose(backupFile);
    }
    fclose(metaFile);
    return 0;
}

