#include "../include/utilities.h"

int compare(void const *a, void const *b) {
    FileBlock *aa = (FileBlock *)a;
    FileBlock *bb = (FileBlock *)b;

    char* aaa = (char*)aa->fileName;
    char* bbb = (char*)bb->fileName;

    return strcmp(aaa, bbb);
}

int compare_meta_offset(void const *a, void const *b) {
    FileBlock *aa = (FileBlock *)a;
    FileBlock *bb = (FileBlock *)b;

    long aaa = (long)aa->metaOffset;
    long bbb = (long)bb->metaOffset;

    return (aaa - bbb);
}

char* endian_convert(int num)
{
    char big_end[12];
    sprintf(big_end,"%.8x", num);

    char* little_end = (char*) malloc(9);
    int i = 0;

    for(i = 0; i < strlen(big_end); i +=2)
    {
        char firstNum = big_end[strlen(big_end) - i - 2];
        if (firstNum >= 'a' && firstNum <= 'f')
        {
            firstNum -= 32;
        }
        char secondNum = big_end[strlen(big_end) - i - 1];
        if (secondNum >= 'a' && secondNum <= 'f')
        {
            secondNum -= 32;
        }
        little_end[i] = firstNum;
        little_end[i+1] = secondNum;
    }
    little_end[8]  = '\0';
    return little_end;
}


void printMainHeader()
{

    printf("******************************************************\n");
    printf("*                                                    *\n");
    printf("*                Meta Injector v1.9                  *\n");
    printf("*                                                    *\n");
    printf("******************************************************\n");
}


char* getTwoDigits(char* fileName)
{
    int start = indexOf('_',fileName,0) + 1;
    int end = indexOf('_',fileName,1);

    char* twoDigits = substr(fileName,start,end);

    return twoDigits;
}

char* getMiddleDigits(char* fileName)
{
    int  start = indexOf('_',fileName,1) + 1;
    int end = indexOf('_',fileName,2);

    char* middle = substr(fileName,start,end);

    return middle;
}

char* getClassPrefix(char* fileName)
{
    return substr(fileName,0,3);
}

char* getLastFolder(char* folderName)
{
    int i = strlen(folderName);
    int start = 0;
    int skipped = 0;
    for ( i = strlen(folderName); i >=0; i--)
    {
        if (folderName[i] == '/')
        {
            if (skipped == 0)
            {
                skipped = 1;
            }
            else
            {
                start = i + 1;
                break;
            }
        }
    }
    return substr(folderName,start,strlen(folderName) - 1);
}

int contains(char* fullString, char* substring)
{
    if (strlen(substring) > strlen(fullString))
    {
        //printf("\nWarning: Wrong use of function 'contains(%s,%s)'. The first argument has to be longer than the second", fullString, substring);
        return 0;
    }
    int i = 0;
    int j = 0;
    int combo = 0;
    for (i = 0; i < strlen(fullString); i++)
    {
        if (substring[j] == fullString[i]
        || substring[j] + 32 == fullString[i]
        || substring[j] - 32 == fullString[i]
        || (substring[j] == '/' && fullString[i] == '\\')
        || (substring[j] == '\\' && fullString[i] == '/'))
        {
            combo++;
            if (j + 1 <= strlen(substring))
            {
                j++;
            }
            else
            {
                combo = 0;
                j = 0;
            }
        }
        else
        {
            combo = 0;
            j = 0;
        }
        if (combo == strlen(substring))
        {
            return 1;
        }
    }
    return 0;
}

char* getFourDigits(char* fileName)
{
    int start = indexOf('_',fileName,2) + 1;
    int end = indexOf('_',fileName,3);
    int dot = indexOf('.',fileName,0);

    if (dot < end)
    {
        end = dot;
    }

    char* fourDigits = substr(fileName,start,end);

    return fourDigits;
}


void askConfirmation()
{
    PAUSE();
    /*printf("Do you want to proceed anyway? (y/n) ");
    char input[32] = "";
     while (strcmpi(input,"y") != 0 && strcmpi(input,"n") != 0)
     {
        fflush(stdin);
        scanf("%s", input);
        fflush(stdin);
     }

    if (strcmpi(input,"n") == 0)
    {
        printf("\nExiting.\n\n");
        system("PAUSE");
        exit(1);
    }*/
}

void createPath(char* pathToCreate)
{
    charReplace(pathToCreate,'/','\\');

    DIR* dir = opendir(pathToCreate);

    if (dir)
    {
        closedir(dir);
    }
    else
    {
        char* mdCommand = (char*) malloc(strlen("md \"%s\"") + strlen(pathToCreate) + 1);
        sprintf(mdCommand,"md \"%s\"",pathToCreate);
        //printf("\n%s\n",mdCommand);
        system(mdCommand);
        free (mdCommand);
    }
}

void backupMenu()
{
    int backupSelected = -1;

        long backupCount = 0;
        char** backupNames = getBackupList(&backupCount);
        if (backupCount > 0)
        {
            while (1)
            {
                 backupSelected  = selectBackup(backupNames, backupCount);

                 if (backupSelected == -1)
                 {
                     return;
                 }

                 if (backupSelected < 0 || backupSelected > backupCount - 1)
                 {
                    printf("\nInvalid option!\n\n");
                 }
                 else
                 {
                     break;
                 }
            }

            restoreBackup(backupNames[backupSelected]);
        }
        else
        {
             printf("No backup was found");
        }
        printf("\n");
        system("PAUSE");
}



char* getLatestBackup()
{
    long backupCount = 0;
    char** backups = getBackupList(&backupCount);
    if (backupCount == 0)
    {
        return "pad00000.meta";
    }
    return backups[backupCount - 1];
}

// Merges 2 strings into 1
char* concatenate (char* str1, char*str2)
{
    char* result = (char*)malloc(strlen(str1) + strlen(str2) + 1);
    strcpy(result,str1);
    strcat(result,str2);
    return result;
}


int isNumOrLetter(char c)
{
    if (c >= 'a' && c <='z')
    {
        return 1;
    }
    if (c >= 'A' && c <='Z')
    {
        return 1;
    }
    if (c >= '0' && c <='9')
    {
        return 1;
    }
    if (c == '_')
    {
        return 1;
    }
    return 0;
}

int hexToInt(char* hex)
{
   /*FILE* tmpFile = fopen("tmp.bin","wb");
   fwrite(hex,sizeof(int),1,tmpFile);
   int num = 0;
   rewind(tmpFile);
   fread(tmpFile)*/
   return 0;
}

char* intToHex(int x)
{
    char* hex = (char*) malloc(sizeof(int) + 1);
    sprintf(hex,"%d",x);
    return hex;
}

void printColor(char* stringToPrint, Color COLOR)
{
    switch (COLOR)
    {
        case (RED):
        {
            printf("\033[31;1m%s\033[0m", stringToPrint);
        }break;
        case (GREEN):
        {
            printf("\033[32;1m%s\033[0m", stringToPrint);
        }break;
        case (YELLOW):
        {
            printf("\033[33;1m%s\033[0m", stringToPrint);
        }break;
    }
}

void printFileBlock(FileBlock fileBlock)
{
    printf("\n%ld|%ld|%ld|offset:%ld|%s|%s",fileBlock.hash,fileBlock.folderNum,fileBlock.fileNum,fileBlock.metaOffset,fileBlock.folderName,fileBlock.fileName);
}

void addToStringArray(char* fileNameToAdd, char*** ref_stringArray, int* ref_arrraySize)
{
    // If the variable that holds the fileNames of the files that failed to patch hasn't been initialized yet
    if ((*ref_stringArray) == NULL)
    {
        (*ref_stringArray) = (char**) malloc(sizeof(char*));
    }
    else // If it has been initialized
    {
         // Increases the size
        (*ref_stringArray) = (char**) realloc((*ref_stringArray), (((*ref_arrraySize) + 1) * sizeof(char*)));
    }
    // Allocates memory to copy the failed file name
    (*ref_stringArray)[(*ref_arrraySize)] = (char*) malloc(strlen(fileNameToAdd) + 1);
    strcpy((*ref_stringArray)[(*ref_arrraySize)],fileNameToAdd); // Copies the name of the failed file

    (*ref_arrraySize)++;
}

int alreadyInStringArray(char* fileName,char** stringArray, int arrraySize)
{
    int i = 0;
    for (i = 0; i < arrraySize; i++)
    {
        if (strcmpi(stringArray[i],fileName) == 0)
        {
            return 1;
        }
    }
    return 0;
}

void printHex(char* str)
{
    int i = 0;
    printf("\n");
    for (i = 0; i < strlen(str); i++)
    {
        printf("%x ", str[i]);
    }
    printf("\n");
}


void charReplace(char* str,char token,char replace)
{
    int i = 0;
    for (i = 0; i < strlen(str); i++)
    {
        if (str[i] == token)
        {
            str[i] = replace;

        }
    }
}

void printNextAsHex(char* str,int start, int length)
{
    int i = 0;

    for (i = start; i < (start + length); i++)
    {
        printf("%x ", str[i]);
    }
    printf("\n");
}

void printNextAsDec(char* str,int start, int length)
{
    int i = 0;
    printf("\n");
    for (i = start; i < (start + length); i++)
    {
        printf("%d ", str[i]);
    }
    printf("\n");
}

void printIntAsHex(int num)
{
    char* converted = intToHex(num);
    printHex(converted);
}

int nextFourBytesAsInt(char* str, int startLocation)
{
    int i = 0;
    char fourBytes[5] = "";
    fourBytes[4] = '\0';
    for (i = 0; i < 4; i++)
    {
        fourBytes[i] = str[startLocation+i];
    }
    return hexToInt(fourBytes);
}

char* substr(char* str,int start, int end)
{
    if (end < start)
    {
        //printf("\ntrying to create a substring where end < start |  %s start: %d   end: %d\n", str, start, end);
        return "";
    }
    if (end == start)
    {
        return "";
    }
    char* sub = (char*) malloc((end - start) + 1);
    int j = 0;
    int i = 0;
    for (i = start; i <= end; i++)
    {
        sub[j] = str[i];
        j++;
    }
    sub[j - 1] = '\0';
    return sub;
}

int indexOf(char token, char* str, int skips)
{
    int i = 0;
    int skipped = 0;
    for (i = 0; i < strlen(str); i++)
    {
        if (str[i] == token)
        {
            if (skipped == skips)
            {
                return i;
            }
            else
            {
                skipped++;
            }
        }
    }
    return i -1;
}

long locateHash(long hash,MemFileInt* metaFileInMemory,MetaFileInfo* metaFileInfo)
{
    long currentBlock = 0;
    int readNum = 0;

    int startBlock = metaFileInfo->fileBlocksStart/sizeof(int);
    int endBlock = metaFileInfo->fileBlocksEnd/sizeof(int);

    for (currentBlock = startBlock; currentBlock < endBlock; currentBlock++)
    {
        readNum = metaFileInMemory->block[currentBlock];

        if(readNum == hash)
        {
            return currentBlock;
        }
    }
    return NOT_FOUND;
}


long locateIntInMemory(int intToLocate,MemFileInt* arrayInMemory, MetaFileInfo* metaFileInfo)
{
    long currentBlock = 0;
    int readNum = 0;

    for (currentBlock = 0; currentBlock < arrayInMemory->size; currentBlock++)
    {
        readNum = arrayInMemory->block[currentBlock];


        int startBlock = metaFileInfo->fileBlocksStart/sizeof(int);
        int endBlock = metaFileInfo->fileBlocksEnd/sizeof(int);


        if(readNum == intToLocate)
        {
            if ((currentBlock < startBlock || currentBlock > endBlock))
            {
                printf("                       OUTSIDE!");
                 return NOT_FOUND;
            }
            return currentBlock;

        }

    }
    return NOT_FOUND;
}

long locate2IntsInMemory(int int1, int int2 ,MemFileInt* arrayInMemory)
{
    //printf("\nlooking for: %.8x | %.8x\n", int1, int2);
    long currentBlock = 0;
    for (currentBlock = 0; currentBlock < arrayInMemory->size; currentBlock++)
    {

        if(arrayInMemory->block[currentBlock] == int1 && arrayInMemory->block[currentBlock + 1] == int2)
        {
            return currentBlock;
        }

    }
    return NOT_FOUND;
}

void undoLastChanges()
{

    FILE* metaFile = openFile("pad00000.meta","rb+");
    FILE* modFile = fopen("patcher_resources\\latest_modifications_meta_injector.bin","rb");
    if (modFile == NULL)
    {
        printf("\nNo last modifications detected.\n\n");
        fclose(metaFile);
        system("PAUSE");
        return;
    }

    printf("\n\nReverting File");
    if (getFileSize(modFile) == 0)
    {
        printf("\nNo changes to undo.\n\n");
        fclose(metaFile);
        fclose(modFile);
        system("PAUSE");
        return;
    }
    else
    {
        MetaFileInfo* metaFileInfo = getMetaFileInfo("pad00000.meta");
        fseek(metaFile,metaFileInfo->fileBlocksStart,SEEK_SET);;

        long offset = 0;
        long folderNum = 0;
        long fileNum = 0;
        long changesCount = 0;


        while(fread(&offset,sizeof(long),1,modFile))
        {
            fread(&folderNum,sizeof(long),1,modFile);
            fread(&fileNum,sizeof(long),1,modFile);

            fseek(metaFile,offset + sizeof(long),SEEK_SET);

            fwrite(&folderNum,sizeof(long),1,metaFile);
            fwrite(&fileNum,sizeof(long),1,metaFile);

            changesCount++;
        }

        printf("\nReverted changes: %ld\n\n", changesCount);



        fclose(modFile);
          remove("patcher_resources/latest_modifications_meta_injector.bin");
        fclose(metaFile);
        free(metaFileInfo);
        system("PAUSE");
    }
}


/*void toHex(int decimalNumber)
{
	int remainder;
	int quotient;
    int i=1,j;
    char hexadecimalNumber[100];

    quotient = decimalNumber;

    while(quotient!=0)
	{
         remainder = quotient % 16;

      //To convert integer into character
      if( remainder < 10)
           remainder = remainder + 48;		// Add 48(become ascii later) value to remainder if less than 10--see ascii table for more info
      else
         remainder = remainder + 55;		// Add 55(become ascii later) value to remainder if greater than 10--see ascii table for more info

      hexadecimalNumber[i++]= remainder;

      quotient = quotient / 16;
    }

    //printf("Equivalent hexadecimal value of %d is: ",decimalNumber);

    for(j = i -1 ;j> 0;j--)
    {
      printf("%c",hexadecimalNumber[j]);
    }

}

void printNextBytesAsHex(FILE* fp, int howManyBytes)
{
    int i = 0;
    char c;
    for (i = 0; i < howManyBytes; i++)
    {
        fread(&c,1,1,fp);
        printf("%x ", c);
    }
}*/



char** getBackupList(long* backupCount)
{
    return getFilesSingleFolder(getCurrentPath(),"backup",backupCount);
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
    printf("0 - Back\n");
    while (1)
    {
        printf("\nSelect backup number: ");
        fgets(input,32,stdin);

        optionSelected = atoi(input);
        backupSelected = optionSelected - 1;

        if (optionSelected == EXIT)
        {
            return -1;
        }

        if (optionSelected < 0 || optionSelected > backupCount)
        {
            printf("\nInvalid option!\n\n");
        }
        else
        {
            break;
        }
    }

    return backupSelected;
}



void createBackup()
{
    int backupNameLen = strlen("pad00000[YYYY-MM-DD].meta.backup");
    char* backupName = (char*)malloc(backupNameLen + 1);


    remove("patcher_resources/latest_modifications_meta_injector.bin");

    time_t now;
    time(&now);

    struct tm* now_tm;
    now_tm = localtime(&now);

    strftime (backupName, backupNameLen + 1, "pad00000[%Y-%m-%d].meta.backup", now_tm);

    char* cmd = (char*) malloc(strlen("copy pad00000.meta pad00000[YYYY-MM-DD].meta.backup") + 1);
    sprintf(cmd,"copy pad00000.meta %s", backupName);
    system(cmd);

    if (fileExists(backupName))
    {
        printf("\nA new backup was created: %s\n",backupName);
    }
    else
    {
        printf("\nCould not create a backup\n");
        printf("Try running the program as administrator\n");
        printf("\nThe program can try to proceed without that file, but it can crash\n\n");
        askConfirmation();
    }
}

int backupExists()
{
    long backupCount = 0;
    char** backups = getFilesSingleFolder(getCurrentPath(),"backup", &backupCount);

    if (backupCount == 1)
    {
        printf("%ld backup was found\n", backupCount);
    }
    else
    {
        printf("%ld backups were found\n", backupCount);
    }

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

void restoreBackup(char* backupName)
{
    char command[2048];
    sprintf(command,"xcopy /y \"%s\" pad00000.meta",backupName);
    system(command);
    remove("patcher_resources\\latest_modifications_meta_injector.bin");
}

//-----------------------------------------------------------------------------------------------------------------
void createLogFile()
{
    FILE* log = openFile("patcher_resources/paz_browser.log","wb");
    long lastMetafileSize = getFileSizeByName("pad00000.meta");
    fwrite(&lastMetafileSize,sizeof(long),1,log);
    fclose(log);
}

char* bdoRootFolder()
{
    return (oneLevelDown(getCurrentPath()));
}

void generateReferenceFile()
{
    printf("Generating reference file (it takes a while)...");
    char command[2048] = "";
    char* metaFileName = getLatestBackup();
    if (strlen(metaFileName) == 0)
    {
        metaFileName = (char*) malloc(strlen("pad00000.meta") + 1);
        strcpy(metaFileName,"pad00000.meta");
    }

    sprintf(command, "cd patcher_resources & quickbms.exe 2>NULL 1>reference_file.txt blackdesert_file_lister.bms \"%s", concatenate(getCurrentPath(),metaFileName));
    system(command);
    remove("NULL");

    long refFileSize = getFileSizeByName("patcher_resources/reference_file.txt");

    if (refFileSize < 20000000)
    {
        sprintf(command, "cd patcher_resources & quickbms.exe blackdesert_file_lister.bms \"%s", concatenate(getCurrentPath(),metaFileName));
        system(command);
        printf("\n\nFailed to generate reference_file_textures.txt, the reason is shown above\n");
        if (refFileSize != 0)
        {
            printf("  The program can try using the created reference_file.txt instead,\n");
            printf("  But it will not find a lot of files\n");
            askConfirmation();
        }
        else
        {
            printf("\nThe program cannot continue... Exiting");
            system("PAUSE");
            exit(1);
        }
    }
    else
    {
        printf("\nDone.\n\n");
    }
}

int metaFileChangedSize()
{
    long lastMetafileSize = 0;
    FILE* log = fopen("patcher_resources/paz_browser.log","rb");
    if (!log)
    {
        return 1;
    }
    fread(&lastMetafileSize,sizeof(long),1,log);

    if (lastMetafileSize != getFileSizeByName("pad00000.meta"))
    {
        fclose(log);
        return 1;
    }
    fclose(log);
    return 0;
}

char* getFileBlockFullPath(FileBlock* fileBlock)
{
    return concatenate(fileBlock->folderName,fileBlock->fileName);
}


char** getTexturesFrom(FileBlock* fileBlock, char* fileLocation, int* return_texture_count)
{
    printf("\nGetting Textures Names from %s...", fileBlock->fileName);
    char** textureNames = (char**)malloc(10 * sizeof(char*));
    int i = 0;
    for(i = 0; i < 10; i++)
    {
        textureNames[i] = (char*) malloc(2048);
    }
    int texturesCount = 0;

    FILE* PACFile = openFile(concatenate(fileLocation,fileBlock->fileName), "rb");

    char c = '\0';
    int legibleCharCount = 0;
    int underlineCount = 0;

    while (fread(&c,1,1,PACFile))
    {
         if (texturesCount > 10)
         {
             printf("\nWarning: The number of textures loaded exceeds the limit of 10!");
             break;
         }

        if (isNumOrLetter(c))
        {
            textureNames[texturesCount][legibleCharCount] = c;
            textureNames[texturesCount][legibleCharCount + 1] = '\0';
            legibleCharCount++;
        }
        else
        {
            if (underlineCount >= 3)
            {
                strcat(textureNames[texturesCount],".dds");
                texturesCount++;
            }
            legibleCharCount = 0;
        }
        if (legibleCharCount > 0)
        {
            if (c == '_')
            {
                underlineCount++;
            }
        }
        else
        {
            underlineCount = 0;
        }
    }
    if (texturesCount > 0)
    {
        printf("\n\nTextures Names found:");
        for (i = 0; i < texturesCount; i++)
        {
            printf("\n%s", textureNames[i]);
        }
    }
    printf("\n\n");
    (*return_texture_count) = texturesCount;
    return textureNames;
}


int createMenu(MenuElements menu)
{
    char input[2048] = "";       // A simple buffer to store whatever the user types in the menu
    int optionSelected = 1;
    int i = 0;

     // Display the menu to select the region
    while(1) // This condition makes the menu repeat itself until a valid input is entered
    {
        system("cls"); // clears the screen
        printMainHeader();
        printf("%s\n", menu.header);
        for (i = 1; i <= menu.nOptions; i++)
        {
            printf("%d - %s\n",i, menu.menuoptions[i]);
        }
        printf("0 - %s\n", menu.menuoptions[0]);
        printf("\nEnter your choice: ");
       // fflush(stdin);
       // fgets(input,2048,stdin);
       // input[strlen(input) - 1] = '\0';

        // Converts the read string to int
        optionSelected = 1;

        // This variable also tells the program later which one of the "moddedBytes" the program should use when replacing the bytes

        if (optionSelected == 0)
        {
            return 0;
        }

         // If the user entered an invalid option, displays a error message
        if(optionSelected < 1 || optionSelected > menu.nOptions)
        {
            printf("\nInvalid option!\n\n");
            Sleep(500);
        }
        else
        {
            break;
        }
    }

    return optionSelected;
}

FileBlock* binarySearchFileBlock(char* key, FileBlock* fileBlocks, int fileblocksCount)
{
    int first = 0;
    int last = fileblocksCount - 1;
    int middle = (int)(first+last)/2;

    while (first <= last)
    {
        if (strcmpi(fileBlocks[middle].fileName,key) < 0)
        {
            first = middle + 1;
        }

        else if (strcmpi(fileBlocks[middle].fileName,key)  == 0)
        {
            return &fileBlocks[middle];
        }
        else
        {
            last = middle - 1;
        }

        middle = (first + last)/2;
   }
   if (first > last)
   {
      /*printf("Not found! %s is not present in the list.\n", key);
      system("PAUSE");*/
   }
   return NULL;
}

void PAUSE()
{
    printf("\n\n");
    system("PAUSE");
}

int createArrowMenu(MenuElements menu, char** subtittle, int defaultSelected)
{
    char input = '\0';
    int cursor = 0;
    if (defaultSelected < menu.nOptions && defaultSelected >= 0)
    {
        cursor = defaultSelected;
    }
    int i = 0;

    while(1)
    {
        system("cls");
        printMainHeader();
        printf("%s\n\n", menu.header);
        for (i = 0; i < menu.nOptions; i++)
        {
            if(cursor == i)
            {
               printf(" -> %s\n",menu.menuoptions[i]);
            }
            else
            {
                printf("    %s\n",menu.menuoptions[i]);
            }
        }

           printf("\n%s\n", subtittle[cursor]);

        if (strcmpi(menu.menuoptions[i-1],"Exit") != 0)
        {
            printf("\nENTER     - Confirm");
            printf("\nARROWS    - Change Selected Option");
            printf("\nBACKSPACE - Go back\n");
        }
        else
        {
            printf("\n");
            printf("ENTER  - Confirm\n");
            printf("ARROWS - Change Selected Option\n");
            printf("ESC    - Exit\n");
        }

        input = ENTER;

        if (input == ENTER)
        {
            break;
        }
        else if (input == ARROW_DOWN)
        {
            if (cursor + 1 < menu.nOptions)
            {
                cursor++;
            }
            else
            {
                cursor = 0;
            }
        }
        else if (input == ARROW_UP)
        {
            if (cursor - 1 >= 0)
            {
                cursor--;
            }
            else
            {
                cursor = menu.nOptions;
            }
        }
        if (strcmpi(menu.menuoptions[i-1],"Exit") != 0)
        {
            if (input == BACKSPACE)
            {
                return BACKSPACE;
            }
        }
        else
        {
            if (input == ESC)
            {
                return EXIT;
            }
        }
    }

    return cursor;
}




