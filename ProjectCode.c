#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <windows.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <malloc.h>

//Structure which holds the NGO data
struct NgoInfo
{

      int count;                   //increased when duplicates are inserted to the tree
      double pinCode;              //Pincode of the NGO
      long uniqueID;               //Unique ID generated for a particular NGO
      char name[100];              //Name of the NGO
      char address[300];           //Address of the NGO
      char ownerName[100];         //Owner Name of the NGO
      char contactInformation[50]; //Contact information of the NGO

      struct NgoInfo *left;  //left link for the tree
      struct NgoInfo *right; //right link for the tree
};

//General Functions
void welcome();                  //Func to display the welcome message during the beginning of the execution
void title();                    //Func to display the title of the project used as a header
void press(int);                 //Func to display the press any key to continue
void gotoXY(int, int);           //Func to move the cursor to given coordinates
void loading(int, int);          //Func to display the loading text
void printNgo(struct NgoInfo *); //Func to print the Ngo information passed

//Utility Functions
long randomNumberGenerator();
double numberChecker(char *, int);
char *replace(char *, char, char);

// Log In and Main Menu Functions
void logIn();
void adminLog();
void userLog();
void adminMainMenu(char *);
void userMainMenu(char *);

//Audit Log Functions
void auditLog();
char *dateAndTimeGenerator();

//Append and View NGO
void addNgo();
void viewNgo();

//Data Retrieval
void createTree(int);
struct NgoInfo *insert(struct NgoInfo *, int);

//BST Search Functions
struct NgoInfo *searchParent();
struct NgoInfo *search(struct NgoInfo *, double, int);

//BST Delete Functions
struct NgoInfo *deleteNode(struct NgoInfo *, long);
void deleteNodeParent(long);
void deleteNodeGrandParent();

//Stack Functions
void push(long);
long pop();

//Adding the new data into DataBase
void printDataToFile(FILE *, struct NgoInfo *);
void printTree();

//Root Node of the two trees
struct NgoInfo *root = NULL;             //Root node for the search Tree
struct NgoInfo *rootOfDeleteTree = NULL; //Root node for the Deletion Tree

//Files containing the database
FILE *fptr1;
char fname1[100] = "00-NGODatabase.db"; //file which stores the NGO information
FILE *fptr2;
char fname2[100] = "01-AdminDatabase.db"; //file which stores the admin log in information
FILE *fptr3;
char fname3[100] = "02-UserDatabase.db"; //file which stores the user log in information

//Global Variables

//Stack Variables
long *stack, size = 5; //default stack size of 5
int top = -1;          //top pointer for the stack

char adminName[25], userName[25]; //Variables to store the name of the current user

//temporary variables used in functions to break or continue the iteration OR Recurssion//
int bufferForSearchFun = 0; //used to indicate whether the search element is present in the tree
int count = 1;              //used to display the count of NGOs while viewing all the NGO in the list
int noDataFlag;             //used in deleteNode() will  help if 1 then no data and will return

char date[30]; // to store current date and time (Audit Log)

COORD coord = {0, 0}; //Intializing Coordinates of the Display

int main()
{
      // press(1);
      // press(1);
      welcome();
      //opening all the files and closing them;if the files dont exist they will be created
      fptr1 = fopen(fname1, "a");
      fclose(fptr1);
      fptr2 = fopen(fname2, "a");
      fclose(fptr2);
      fptr3 = fopen(fname3, "a");
      fclose(fptr3);

      //allocating memory for stack
      stack = (long *)calloc(size, sizeof(long));

      //Functions that will load the data from the database to the Main Memory
      createTree(-1);
      createTree(1);
      //Calls the Login function through which the  logins
      logIn();
      //deletes the root node of the functions
      free(root);
      free(rootOfDeleteTree);
      return 0;
}

void welcome()
{
      //prints welcome window
      system("cls");
      gotoXY(45, 9);
      int row, col;
      for (row = 0; row < 2; row++)
      {
            for (col = 0; col < 43; col++)
            {
                  printf("%c", 205);
            }
            if (row == 0)
            {
                  gotoXY(45, 10);
                  printf("%c\t\t      Welcome to\t\t%c", 186, 186);
                  gotoXY(45, 11);
                  printf("%c\t\tCOVID-19 AID TRACKER\t\t%c", 186, 186);
                  gotoXY(45, 12);
            }
      }
      gotoXY(120, 29);
      printf("Tejashwin U");
      gotoXY(120, 30);
      printf("1NH19CS238");
      getche();
}

void title()
{
      //prints the title for every page
      int i;
      system("cls");
      for (i = 0; i < 144; i++)
      {
            printf("%c", 196);
      }
      printf("\n\t\t\t\t\t\tCOVID-19 AID TRACKER\n");
      for (i = 0; i < 144; i++)
      {
            printf("%c", 196);
      }
}

void press(int noOfLine)
{
      //function to print press any key after few lines
      for (int i = 0; i < noOfLine; i++)
      {
            printf("\n");
      }
      printf("\nPress any key to continue");
      loading(4, 250);
      getche();
}

void gotoXY(int x, int y)
{
      //moves the cursor to the given x and y position when called
      coord.X = x;
      coord.Y = y;
      SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

void loading(int noOfDOts, int timeValue)
{
      //function to mimic the loading animation
      int i;
      for (i = 0; i <= noOfDOts; i++)
      {
            printf(".");
            Sleep(timeValue);
      }
}

void printNgo(struct NgoInfo *structurePointer)
{
      //function to print the ngo value passed
      //the replace function is to hide the underscores used in the database
      printf("\n\tPIN CODE:        %.lf", structurePointer->pinCode);
      printf("\n\tUnique ID:       %ld", structurePointer->uniqueID);
      printf("\n\tNGO name:        %s", replace(structurePointer->name, '_', ' '));
      printf("\n\tNGO address:     %s", replace(structurePointer->address, '_', ' '));
      printf("\n\tNGO owner name:  %s", replace(structurePointer->ownerName, '_', ' '));
      printf("\n\tNGO Phone no.    %s", replace(structurePointer->contactInformation, '_', ' '));
      printf("\n\n");
}

/**
 * @brief the function will take three arguments
 * passedString holds the string which will be passed
 * toReplace holds the char which has to be replaced in the string
 * replaceBy holds the char which will be replaced 
 * it returns the new string
 */
char *replace(char *passedString, char toReplace, char replaceBy)
{
      //i to traverse through the string
      //j holds the position of the last char
      int i, j = 0;

      //we allocate memory to the string dynamically
      char *newString = (char *)calloc(300, sizeof(char));

      for (i = 0; i <= strlen(passedString); i++)
      {
            //replaces when the to replace is matched
            if (passedString[i] == toReplace)
            {
                  newString[j] = replaceBy;
                  j++;
            }
            //doesn't replace if it is the alphabet or number or a punctuation such as . and ,
            else if (isalnum(passedString[i]) || ispunct(passedString[i]))
            {
                  newString[j] = passedString[i];
                  j++;
            }
            //else replaces any criteria if it doesn't match
            else
            {
                  newString[j] = replaceBy;
                  j++;
            }
      }
      //adds the null char at the end of the string so that new array becomes a string
      newString[j] = '\0';
      return newString;
}

long randomNumberGenerator()
{
      //generates a random number using the time constant
      unsigned long number;
      time_t seconds;
      seconds = time(NULL);
      number = ((rand() % (10000 - RAND_MAX + 1)) + 10000);
      number = ((number) * (seconds / 2));
      number = number % 1000000;
      if (number < 0)
      {
            number = (number * -1);
      }
      return number;
}

void logIn()
{
      char choice;
      system("cls");
      title();
      gotoXY(45, 8);
      printf("[A] for ADMINISTRATOR");
      gotoXY(45, 9);
      printf("[U] for USER");
      gotoXY(45, 10);
      printf("[ESC] to exit");
      choice = getche();
      if (choice == 'a' || choice == 'A')
      {
            adminLog();
      }
      else if (choice == 'u' || choice == 'U')
      {
            userLog();
      }
      else if (choice == 27)
      {
            printf("\nnExiting");
            loading(8, 250);
            exit(0);
      }
      else
      {
            logIn();
      }
}

void adminLog()
{
      title();

      char admin_cur_pass[15];
      char admin_default_pass[] = "Bruh";

      char tempChar;
      int pos = 0;

      gotoXY(25, 7);
      printf("Logging in as an Admin\n");
      gotoXY(35, 10);
      printf("Enter the name:  ");
      scanf("%s", adminName);
      gotoXY(35, 11);
      printf("Enter the default password:  ");
      do
      {
            tempChar = getch();
            if (isprint(tempChar))
            {
                  admin_cur_pass[pos++] = tempChar;
                  printf("%c", '*');
            }
            else if (tempChar == 8 && pos)
            {
                  admin_cur_pass[pos--] = '\0';
                  printf("%s", "\b \b");
            }
      } while (tempChar != 13);

      if (strcmp(admin_cur_pass, admin_default_pass) == 0)
      {
            fptr2 = fopen(fname2, "a+");
            fprintf(fptr2, "\n%s %s", adminName, dateAndTimeGenerator());
            fclose(fptr2);
            gotoXY(35, 13);
            printf("\n\nSuccessfully logged in.");
            press(0);
            adminMainMenu(adminName);
      }
      else
      {
            int choice;
            printf("\nPassword wrong :(");
            do
            {
                  printf("\n\n\nPress\n");
                  printf("\n\t\t[1] to re-enter credentials.");
                  printf("\n\t\t[2] to choose the user once again.");
                  printf("\n\t\t[ESC] to exit.");
                  choice = getche();
                  if (choice == 27)
                  {
                        printf("\n\nnExiting.......");
                        exit(0);
                  }
                  else if (choice == 49)
                  {
                        adminLog();
                  }
                  else if (choice = 50)
                  {
                        logIn();
                  }
            } while (1);
      }
}

void userLog()
{
      title();

      gotoXY(25, 8);
      printf("Loggining in as a general user");
      gotoXY(35, 12);
      printf("Enter your name: ");
      scanf("%s", userName);
      fptr3 = fopen(fname3, "a+");
      fprintf(fptr3, "\n%s %s", userName, dateAndTimeGenerator());
      fclose(fptr3);
      gotoXY(0, 18);
      printf("Successfully logged in.");
      press(0);
      userMainMenu(userName);
}

void adminMainMenu(char *aname)
{
      int ch;
      char choice1;
      char choice2;
      do
      {
            system("cls");
            title();
            printf("\nAdmin Name: %s", aname);
            gotoXY(38, 8);
            printf("Press:");
            gotoXY(45, 10);
            printf("[1] to search");
            gotoXY(45, 11);
            printf("[2] to add a NGO");
            gotoXY(45, 12);
            printf("[3] to view the NGO list");
            gotoXY(45, 13);
            printf("[4] to delete");
            gotoXY(45, 14);
            printf("[5] to view the Audit log");
            gotoXY(45, 15);
            printf("[6] to return to the login page");
            gotoXY(45, 16);
            printf("[ESC] to exit");
            gotoXY(45, 17);
            printf("Your choice: ");
            choice1 = getche();
            scanf("%*c");
            switch (choice1)
            {
            case 49:
                  searchParent();
                  break;
            case 50:
                  addNgo();
                  break;
            case 51:
                  viewNgo();
                  break;
            case 52:
                  deleteNodeGrandParent();
                  break;
            case 53:
                  auditLog();
                  break;
            case 54:
                  logIn();
                  break;
            case 27:
                  gotoXY(40, 21);
                  printf("nExiting");
                  loading(8, 250);
                  exit(0);
                  break;
            default:
                  printf("\n\nYour input is out of range!");
                  press(0);
                  break;
            }
      } while (1);
}

void userMainMenu(char *uname)
{
      char choice;
      do
      {
            system("cls");
            title();
            printf("\nGeneral User Name: %s", uname);
            gotoXY(38, 8);
            printf("Press:");
            gotoXY(45, 10);
            printf("[1] to search");
            gotoXY(45, 11);
            printf("[2] to view the NGO list");
            gotoXY(45, 12);
            printf("[3] to return to the login page");
            gotoXY(45, 13);
            printf("[ESC] to exit");
            gotoXY(45, 14);
            printf("Your choice: ");
            choice = getche();
            scanf("%*c");
            switch (choice)
            {
            case 49:
                  searchParent();
                  break;
            case 50:
                  viewNgo();
                  break;
            case 51:
                  logIn();
            case 27:
                  gotoXY(45, 16);
                  printf("nExiting");
                  loading(8, 250);
                  exit(0);
                  break;
            default:
                  printf("\n\nYour input is out of range!");
                  press(0);
                  break;
            }
      } while (1);
}

void addNgo()
{
      int y;
      int i;
      char choice;
      char tempPinCode[10];
      title();
      fptr1 = fopen(fname1, "a");
      struct NgoInfo *temp;
      temp = (struct NgoInfo *)malloc(sizeof(struct NgoInfo));

      gotoXY(36, 7);
      printf("Enter NIL if any information is not present");

      gotoXY(30, 9);
      printf("Enter the pin code:    ");
      gets(tempPinCode);
      temp->pinCode = numberChecker(tempPinCode, 1);

      gotoXY(30, 10);
      printf("Enter the NGO name:    ");
      fgets(temp->name, sizeof(temp->name), stdin);
      strcpy(temp->name, replace(temp->name, ' ', '_'));

      gotoXY(30, 11);
      printf("Enter the Address:     ");
      fgets(temp->address, sizeof(temp->address), stdin);
      strcpy(temp->address, replace(temp->address, ' ', '_'));

      gotoXY(30, 12);
      printf("Enter the owner name:  ");
      fgets(temp->ownerName, sizeof(temp->ownerName), stdin);
      strcpy(temp->ownerName, replace(temp->ownerName, ' ', '_'));

      gotoXY(30, 13);
      printf("Enter the Phone no.:   ");
      fgets(temp->contactInformation, sizeof(temp->contactInformation), stdin);
      strcpy(temp->contactInformation, replace(temp->contactInformation, ' ', '_'));
      temp->uniqueID = randomNumberGenerator();
      temp->left = NULL;
      temp->right = NULL;
      insert(temp, -1);
      fprintf(fptr1, "\n%.lf\n%ld\n%s\n%s\n%s\n%s\n", temp->pinCode, temp->uniqueID, temp->name, temp->address, temp->ownerName, temp->contactInformation);
      fclose(fptr1);
      rootOfDeleteTree = NULL;
      createTree(1);
      system("cls");
      title();
      gotoXY(20, 6);
      y = 10;
      printf("The below NGO details were successfully added: ");
      gotoXY(30, y++);
      printf("PIN CODE:        %.lf", temp->pinCode);
      gotoXY(30, y++);
      printf("Unique ID:       %ld", temp->uniqueID);
      gotoXY(30, y++);
      printf("NGO name:        %s", replace(temp->name, '_', ' '));
      gotoXY(30, y++);
      printf("NGO address:     %s", replace(temp->address, '_', ' '));
      gotoXY(30, y++);
      printf("NGO owner name:  %s", replace(temp->ownerName, '_', ' '));
      gotoXY(30, y++);
      printf("NGO Phone no.:   %s", replace(temp->contactInformation, '_', ' '));
      gotoXY(30, y++);
      press(2);
      return;
}

void viewNgo()
{
      fptr1 = fopen(fname1, "r+");
      int buffer = 1;
      title();
      struct NgoInfo *print;
      print = (struct NgoInfo *)(malloc(sizeof(struct NgoInfo)));
      printf("\nThe NGO details are:");
      while ((fscanf(fptr1, "%lf\n%ld\n%s\n%s\n%s\n%s\n",
                     &print->pinCode, &print->uniqueID, print->name, print->address, print->ownerName, print->contactInformation) != EOF))
      {
            printNgo(print);
            printf("\n\n");
            if (buffer % 25 == 0)
                  press(0);
            buffer++;
      }
      fclose(fptr1);
      printf("\n\n\n\nPress [ENTER] to return to the mainmenu \n\n");
      getch();
}

void createTree(int option)
{
      int buffer = 0;
      char choice;
      fptr1 = fopen(fname1, "r+");
      struct NgoInfo *read, *temp;
      read = (struct NgoInfo *)(malloc(sizeof(struct NgoInfo)));
      if (fptr1 == NULL)
      {
            printf("Unable to open the NGO data file :(");
            press(0);
            exit(0);
      }

      while ((fscanf(fptr1, "%lf\n%ld\n%s\n%s\n%s\n%s\n", &read->pinCode, &read->uniqueID, read->name, read->address, read->ownerName, read->contactInformation) != EOF))
      {
            temp = (struct NgoInfo *)malloc(sizeof(struct NgoInfo));
            temp->pinCode = read->pinCode;
            temp->uniqueID = read->uniqueID;
            strcpy(temp->name, read->name);
            strcpy(temp->address, read->address);
            strcpy(temp->ownerName, read->ownerName);
            strcpy(temp->contactInformation, read->contactInformation);
            insert(temp, option);
            buffer++;
      }
      fclose(fptr1);
      if (buffer == 0)
      {
            title();
            gotoXY(20, 10);
            printf("The file is  empty :(");
            gotoXY(20, 11);
            printf("Do you want to change the file location?[Y\\N]");
            choice = getche();
            if (choice == 'y' || choice == 'Y')
            {
                  gotoXY(20, 12);
                  printf("Enter the new file location: ");
                  gets(fname1);
                  gotoXY(20, 14);
                  printf("File was Changed successful :)");
                  gotoXY(20, 15);
                  press(0);
                  main();
            }
            else
            {
                  exit(0);
            }
      }
}

struct NgoInfo *insert(struct NgoInfo *tempPointer, int option)
{
      switch (option)
      {
            //delete tree
      case 1:
            tempPointer->left = NULL;
            tempPointer->right = NULL;
            tempPointer->count = 1;
            if (rootOfDeleteTree == NULL)
            {
                  rootOfDeleteTree = tempPointer;
                  rootOfDeleteTree->left = NULL;
                  rootOfDeleteTree->right = NULL;
            }
            else
            {
                  struct NgoInfo *cur = rootOfDeleteTree;
                  struct NgoInfo *ptr = NULL;
                  while (cur != NULL)
                  {
                        ptr = cur;
                        if (tempPointer->uniqueID == cur->uniqueID)
                        {
                              tempPointer->uniqueID = randomNumberGenerator();
                        }
                        if (tempPointer->uniqueID < cur->uniqueID)
                        {
                              cur = cur->left;
                        }
                        else
                        {
                              cur = cur->right;
                        }
                  }
                  if (tempPointer->uniqueID < ptr->uniqueID)
                  {
                        ptr->left = tempPointer;
                  }
                  else
                  {
                        ptr->right = tempPointer;
                  }
            }
            return rootOfDeleteTree;
            break;
      case -1:
            //search tree
            tempPointer->left = NULL;
            tempPointer->right = NULL;
            tempPointer->count = 1;
            if (root == NULL)
            {
                  root = tempPointer;
                  root->left = NULL;
                  root->right = NULL;
            }
            else
            {
                  struct NgoInfo *cur = root;
                  struct NgoInfo *ptr = NULL;
                  while (cur != NULL)
                  {
                        ptr = cur;
                        if (tempPointer->pinCode == cur->pinCode)
                        {
                              tempPointer->pinCode = tempPointer->pinCode + 0.00001;
                              tempPointer->count = tempPointer->count + 1;
                        }
                        if (tempPointer->pinCode < cur->pinCode)
                        {
                              cur = cur->left;
                        }
                        else
                        {
                              cur = cur->right;
                        }
                  }
                  if (tempPointer->pinCode < ptr->pinCode)
                  {
                        ptr->left = tempPointer;
                  }
                  else
                  {
                        ptr->right = tempPointer;
                  }
            }
            return root;
            break;
      }
}

struct NgoInfo *search(struct NgoInfo *root1, double s_ele, int option)
{
      if (root1 != NULL)
      {
            if (root1->pinCode == s_ele)
            {
                  if (option < 0)
                  {
                        printNgo(root1);
                        bufferForSearchFun++;
                        noDataFlag = 0;
                        s_ele = s_ele + 0.00001;
                        if (option == -2)
                              push(root1->uniqueID);
                        return search(root1->right, s_ele, option);
                  }
            }
            if (root1->pinCode < s_ele)
            {
                  return search(root1->right, s_ele, option);
            }
            else
            {
                  return search(root1->left, s_ele, option);
            }
      }
      if (bufferForSearchFun == 0)
      {
            printf("\n No such Data");
            noDataFlag = 1;
            if (option == -2)
                  press(0);
      }
      return root1;
}

struct NgoInfo *searchParent()
{
      system("cls");
      title();
      char tempPinCode[10];
      char choice;
      int i;
      double s_ele;
      printf("\n Enter the Pin Code: ");
      gets(tempPinCode);
      s_ele = numberChecker(tempPinCode, -1);
      printf("\nSearching");
      loading(8, 150);
      printf("\n");
      bufferForSearchFun = 0;
      search(root, s_ele, -1);
      press(0);
      return NULL;
}

void push(long ele)
{
      if (top == size - 1)
      {
            size++;
            stack = (long *)realloc(stack, size * sizeof(long));
            push(ele);
      }
      else
      {
            top++;
            stack[top] = ele;
      }
}

long pop()
{
      long temp = stack[top];
      top--;
      return temp;
}

struct NgoInfo *deleteNode(struct NgoInfo *tempRoot, long s_ele)
{
      struct NgoInfo *current = NULL, *pointer = NULL, *successor = NULL, *parent = NULL;
      if (tempRoot == NULL)
            return tempRoot;
      current = tempRoot;
      while (current != NULL && s_ele != current->uniqueID)
      {
            parent = current;
            if (s_ele < current->uniqueID)
                  current = current->left;
            else
                  current = current->right;
      }
      if (current->left == NULL)
            pointer = current->right;
      else if (current->right == NULL)
      {
            pointer = current->left;
      }
      else
      {
            successor = current->right;
            while (successor->left != NULL)
            {
                  successor = successor->left;
            }
            successor->left = current->left;
            pointer = current->right;
      }
      if (parent->left == current)
            parent->left = pointer;
      else
            parent->right = pointer;
      printf("\nThe below NGO information was successfully deleted: \n\n");
      printNgo(current);
      free(current);
      press(0);
      printTree();
      root = NULL;
      createTree(-1);
      return tempRoot;
}

void deleteNodeParent(long deleteUniqueID)
{
      char choice;
      do
      {
            printf("\nAre you sure that you want to delete the above NGO information?\n[Press Y\\N]");
            choice = getche();
            if (choice == 'y' || choice == 'Y')
            {
                  deleteNode(rootOfDeleteTree, deleteUniqueID);
                  break;
            }
            else if (choice == 'n' || choice == 'N')
            {
                  printf("\nDeletion was cancelled");
                  press(0);
                  break;
            }
            else
            {
                  printf("\nWrong option :(");
                  press(0);
            }
      } while (TRUE);
      adminMainMenu(adminName);
}

void deleteNodeGrandParent()
{
      int flag = 0;
      int i = top;
      double deletePincode;
      long deleteUniqueID;
      long stackElement;
      char choice;
      char tempPinCode[10];
      title();
      printf("\nEnter the pin code to be deleted: ");
      gets(tempPinCode);
      deletePincode = numberChecker(tempPinCode, 3);
      bufferForSearchFun = 0;
      search(root, deletePincode, -2);
      if (noDataFlag == 1)
      {
            printf("\nNo Such Data");
            press(0);
            adminMainMenu(adminName);
      }
      else if (noDataFlag != 1)
      {
            printf("\nNow enter the Unique ID of the NGO from the above list: ");
            scanf("%ld", &deleteUniqueID);
            while (top != -1 && flag == 0)
            {
                  stackElement = pop();
                  if (deleteUniqueID == stackElement)
                  {
                        deleteNodeParent(deleteUniqueID);
                        flag++;
                  }
            }
            if (top == -1 && flag == 0)
            {
                  printf("\n\n\nWrong Unique ID entered");
                  press(0);
            }
      }
      while (top != -1)
      {
            pop();
      }
}

void printDataToFile(FILE *fptr1, struct NgoInfo *tempPointer)
{
      if (tempPointer == NULL)
            return;
      fprintf(fptr1, "\n%.lf\n%ld\n%s\n%s\n%s\n%s\n",
              tempPointer->pinCode, tempPointer->uniqueID, tempPointer->name, tempPointer->address, tempPointer->ownerName, tempPointer->contactInformation);
      printDataToFile(fptr1, tempPointer->left);
      printDataToFile(fptr1, tempPointer->right);
}

void printTree()
{
      fptr1 = fopen(fname1, "w");
      printDataToFile(fptr1, rootOfDeleteTree);
      fclose(fptr1);
}

double numberChecker(char *str, int option)
{
      int i;
      char choice;
      for (i = 0; i < strlen(str); i++)
      {
            if (!(isdigit(str[i])))
            {
                  printf("\n\n\n\t\t\tOnly numbers allowed");
                  do
                  {
                        printf("\n\n\n\nPress\n\t\t[1] to continue\n\t\t[Esc] to exit");
                        choice = getche();
                        if (choice == 49)
                        {
                              if (option == 1)
                                    addNgo();
                              else if (option == -1)
                                    searchParent();
                              else if (option == 3)
                                    deleteNodeGrandParent(rootOfDeleteTree);
                              break;
                        }
                        else if (choice == 27)
                        {
                              exit(0);
                        }
                        else
                        {
                              printf("\nWrong Option");
                              press(0);
                        }
                  } while (1);
            }
      }
      return atof(str);
}

char *dateAndTimeGenerator()
{
      time_t t = time(NULL);
      struct tm *tm = localtime(&t);
      strftime(date, sizeof(date), "%c", tm);
      strcpy(date, replace(date, ' ', '_'));
      return date;
}

void auditLog()
{
      int y = 12;
      int i = 0;
      char choice;
      char name[25], date1[30];
      do
      {
            title();
            gotoXY(40, 10);
            printf("Press:");
            gotoXY(50, y++);
            printf("[1] Admin Log");
            gotoXY(50, y++);
            printf("[2] User Log");
            gotoXY(50, y++);
            printf("[3] to return to the Main Menu");
            gotoXY(50, y++);
            printf("[Esc] to Exit");
            choice = getche();
            switch (choice)
            {
            case 49:
                  printf("\n\n");
                  i = 0;
                  fptr2 = fopen(fname2, "r");
                  title();
                  printf("\nThe Admin log is: ");
                  while (fscanf(fptr2, "\n%s %s", name, date1) != EOF)
                  {
                        printf("\n\t\t[%d]\tName: %s", ++i, name);
                        printf("\n\t\t\tTime: %s\n", replace(date1, '_', ' '));
                  }
                  press(0);
                  fclose(fptr2);
                  break;
            case 50:
                  title();
                  i = 0;
                  printf("\n\n");
                  printf("\nThe User Log Details are: ");
                  fptr3 = fopen(fname3, "r");
                  while (fscanf(fptr3, "%s %s", name, date) != EOF)
                  {
                        printf("\n\t\t[%d]\tName: %s", ++i, name);
                        printf("\n\t\t\tTime: %s\n", replace(date, '_', ' '));
                  }
                  press(0);
                  fclose(fptr3);
                  break;
            case 27:
                  printf("\nnExiting");
                  loading(8, 250);
                  exit(0);
                  break;
            case 51:
                  adminMainMenu(adminName);
                  break;
            default:
                  printf("\nWrong Option");
                  press(0);
                  break;
            }
      } while (1);
}
