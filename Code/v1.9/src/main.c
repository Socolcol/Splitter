#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <conio.h>
#include "../include/utilities.h"
#include "../include/patcher.h"


void checkFiles();
int menu0();
int menu1();

void menuRemoveOrRestore(int mode);

int main()
{
    int menu0ChosenOption = -1;
    int menu1ChosenOption = -1;

    checkFiles();

    while (1)
    {
        menu0ChosenOption = menu0();

        if (menu0ChosenOption == EXIT)
        {
            break;
        }
        else if (menu0ChosenOption == INSTALL)
        {
            menu1ChosenOption = menu1();
            if (menu1ChosenOption != BACK)
            {
                runPatcher(menu1ChosenOption);
            }
        }
        else if (menu0ChosenOption == 2)
        {
            undoLastChanges();

        }
        else if (menu0ChosenOption == 3)
        {
           backupMenu();
        }
    }
    //free(patcherOptions);
    return 0;
}
int menu0()
{
    MenuElements menu;
    menu.nOptions = 3;
    strcpy(menu.header,"What do you want to do?");
    strcpy(menu.menuoptions[1],"Run Injector");
    strcpy(menu.menuoptions[2],"Undo last changes");
    strcpy(menu.menuoptions[3],"Restore Backup");
    strcpy(menu.menuoptions[0],"Exit");

    return createMenu(menu);
}

int menu1()
{
    MenuElements menu;
    menu.nOptions = 2;
    strcpy(menu.header,"How do you want to copy the files from the \"files_to_patch\" folder to their original locations?");
    strcpy(menu.menuoptions[0],"Keep Files and folders structures from the \"files_to_patch\" folder.");
    strcpy(menu.menuoptions[1],"Let the program decide where they should go. (Recommended)");

    char* subtittles[] = {"Warning: If any of your files are not in the original folder structure\n         these files will fail to patch.","Notice: This option will not work if 2 or more files have the same name.\n              Use the other option if that's your case."};

    return createArrowMenu(menu,subtittles,1);
}


void checkFiles()
{
    if (!fileExists("pad00000.meta"))
    {
        printf("\nError: could not locate pad00000.meta\n\n");
        printf("\nMake sure you have extracted the program in your PAZ folder\n\n");
        system("PAUSE");
    }
}

