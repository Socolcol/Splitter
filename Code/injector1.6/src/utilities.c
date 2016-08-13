#include "../include/utilities.h"

// Merges 2 strings into 1
char* concatenate (char* str1, char*str2)
{
    char* result = (char*)malloc(strlen(str1) + strlen(str2) + 1);
    strcpy(result,str1);
    strcat(result,str2);
    return result;
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


void strreplace(char* str,char token,char replace)
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

char* substr(char* str,int start, int length)
{
    char* sub = (char*) malloc(length + 1);
    sub[length] = '\0';
    int i = 0;
    for (i = start; i < (start + length); i++)
    {
        sub[i] = str[start+i];
    }
    return sub;
}

long locateIntInMemory(int intToLocate,MemFileInt* arrayInMemory)
{
    long currentBlock = 0;
    //printf("\n\n\n==== locate: %d ========\n\n", intToLocate);
    int readNum = 0;

    for (currentBlock = 0; currentBlock < arrayInMemory->size; currentBlock++)
    {
        readNum = arrayInMemory->block[currentBlock];

        if (currentBlock >= 237529 - 1 && currentBlock < 237529 + 10)
        {
            //printf("\nnum read: %d", readNum);
        }


        if(readNum == intToLocate)
        {
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

