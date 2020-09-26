/**************************************
*Operation3.java
*Dalton Larsen
*
*This Program is a guessing game.
***************************************/
import java.util.Random;
import java.util.Scanner;

public class Operation3GuessingGame
{
   public static void main (String[] args)
   {
      Random r = new Random();
      Scanner in= new Scanner (System.in);
      
      int iCounter=0; //Keeps track of how many time you have guessed.
      int iCorrectNumber=r.nextInt(100) +1; //This is the number the user is trying to guess.
      int iUserGuess=0; //This is the users guess.
      
      System.out.println("Welcome to Higher/Lower! Guess a number between 1-100.");
      iUserGuess=in.nextInt(); //Get the user's guess.
         while(iUserGuess!=iCorrectNumber)
         {
            if(iUserGuess<=0)
            {
               System.out.println("Sorry, the guess needs to be between 1 and 100. Please try again.");
               iUserGuess=in.nextInt();
            }
            else if(iUserGuess>100)
            {
               System.out.println("Sorry, the guess needs to be between 1 and 100. Please try again.");
               iUserGuess=in.nextInt();
            }
            else if(iUserGuess>iCorrectNumber)
            {
               System.out.println("The number is lower. Guess Again.");
               iCounter++;
               iUserGuess=in.nextInt();
            }
            else if(iUserGuess<iCorrectNumber)
            {
               System.out.println("The number is higher. Guess Again.");
               iCounter++;
               iUserGuess=in.nextInt();
            }
            if (iUserGuess==iCorrectNumber)
            {
            iCounter++;
            System.out.println("The number was " + iCorrectNumber + "! It took you " + iCounter + " tries!");
            }
       } // end while loop.           
  } // End main method.
} //End Class Operation3GuessingGame