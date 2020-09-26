/*****************************
*Dalton Larsen
*CS 1400
*Operation11BankAccountDriver
*****************************/

import java.util.Scanner;
import java.util.Random;

public class Operation11BankAccountDriver
{   
   public static void main(String[]  args)
   {  
      String accountName = "";
      int userChoice=0; //this will store the choice of 1, 2, 3, or 4
      int accountNumber = 0;
      int depositAmount = 0; 
      int withdrawlAmount = 0;
      
      Random r = new Random(); //Random number generator for Account Number
      accountNumber = r.nextInt(10000)+1;//will assignRandom number for account Number
      
      Scanner in = new Scanner (System.in); 
      System.out.println("Welcome to the bank. What is your name?"); //asked user for name
      accountName = in.nextLine(); //Stores name for account
      
      BankAccount myAcct = new BankAccount(accountName, accountNumber); //Creation of new bank object
      
      System.out.println(" Hi " + accountName + ", What would you like to do today?");
            
      while (userChoice !=4)
      { 
         System.out.println(" 1. Make a Deposit. \n 2. Make a Withdrawl \n 3. Print Account Info \n 4. Quit");
         userChoice=in.nextInt();

         if (userChoice == 1)
         {
            System.out.println("How much would you like to deposit?");
            depositAmount=in.nextInt();
            myAcct.deposit(depositAmount);   
         }
         
         if (userChoice == 2)
         { 
            System.out.println("How much would you like to withdrawl?");
            withdrawlAmount=in.nextInt(); 
            myAcct.withdraw(withdrawlAmount);
            
         }
         
         if (userChoice == 3)
         {
            System.out.println("Name: " + myAcct.getName() + ", Account Number: " + myAcct.getAccountNum() + ", Balance: " + myAcct.getBalance()); 
         }
      
      
      } 
 
 
   
   }//end main
}//end class