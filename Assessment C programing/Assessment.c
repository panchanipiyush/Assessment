#include <stdio.h>
#include <stdlib.h>

int main()
{
    int menu, item, choose, quantity, Amount1 = 0, Amount2 = 0, Amount3 = 0, Amount4 = 0, Total_Amount = 0;
    char choice;
    printf("||- - - - WELCOME TO HOTEL ASHIRVAD - - - -||\n");

    printf("\nEnter Your Choice:-\n");
    printf("[1] Item Menu For Order.\n[2] Exit\n\nChoice is your: ");
    scanf("%d", &menu);
    //system("cls");
    switch (menu)
    {

    case 1:
    menu:
        printf("||____________ Welcome to Main Menu ___________||\n\n");
        printf("1.Pizza     Price = 180rs/pcs\n");
        printf("2.Burger    Price = 100rs/pcs\n");
        printf("3.Dhosa     Price = 120rs/pcs\n");
        printf("4.Idli      Price = 50rs/pcs\n\n");
        printf("chooze item up to 4.... : ");
        scanf("%d", &item);
        //system("cls");
        switch (item)
        {
        case 1:
            printf("\nYou have selected pizza\n");
            printf("Enter the quantity: ");
            scanf("%d", &quantity);
            Amount1 = quantity * 180;
            printf("\nAmount= %d.Rs", Amount1);
            printf("\n----------------------------------------------");
            break;
        case 2:
            printf("\nYou have selected Burger\n");
            printf("Enter the quantity: ");
            scanf("%d", &quantity);
            Amount2 = quantity * 100;
            printf("\nAmount= %d.Rs", Amount2);
            printf("\n----------------------------------------------");
            break;
        case 3:
            printf("\nYou have selected Dhosa\n");
            printf("Enter the quantity: ");
            scanf("%d", &quantity);
            Amount3 = quantity * 120;
            printf("\nAmount= %d.Rs", Amount3);
            printf("\n----------------------------------------------");
            break;
        case 4:
            printf("\nYou have selected Idli\n");
            printf("Enter the quantity: ");
            scanf("%d", &quantity);
            Amount4 = quantity * 50;
            printf("\nAmount= %d.Rs", Amount4);
            printf("\n----------------------------------------------");
            break;
        default:
            printf("Error... Please select upto 4.\a");
        }
        printf("\n\nDo You Want To Place More Order ?\n(Press'y' for yes)\n(Press 'n'for No)\n");
        scanf("%s", &choice);
        printf("\n----------------------------------------------\n\n");
        // system("cls");
        if (choice == 'y')
        {
            goto menu;
        }
        else if (choice == 'n')
            goto bill;
    case 2:
    bill:
        printf("\n`````````Bill`````````\n\n");
        Total_Amount = Amount1 + Amount2 + Amount3 + Amount4;
        printf("\nTotal Bill=%d.Rs\n\n", Total_Amount);
        printf("\n-----------------------------------\n");
        printf("/ / / / thanks for visiting \\ \\ \\ \\\n");
        printf("-----------------------------------\n");
        break;
    }
    return 0;
}