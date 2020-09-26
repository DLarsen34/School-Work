/*********************************
*Dalton Larsen
*Operation5RockPaperScissors.java
*
*This is Rock Paper Scissors Game
**********************************/
import java.util.Scanner;
import java.util.Random;

public class Operation5RockPaperScissors
{
   
   public static void main (String[] args)
   {
      Scanner in = new Scanner (System.in);
      Random r = new Random ();
      
      int iNumGames=0;
      String sUserChoice=""; 
      String sComputerChoice="";
      int iComputerRandomNumber=0;
      int iUserWins=0;
      int iComputerWins=0;
      
      System.out.println("Welcome to Rock Paper Scissors!");
      
      //Get the number of games to play from the user
      System.out.println("How many games do you want to play?");
      iNumGames=in.nextInt();
      while (iNumGames %2==0)
      {
         System.out.println("Sorry, you need to enter an odd number. Please Try again");
         iNumGames=in.nextInt();
      }
      
      //Flush the buffer
      in.nextLine();
      
      
      //Play the games the number of times
      for (int i=0; i<iNumGames; i++)
      {
        System.out.println("Rock, Paper, or Scissors?");
        sUserChoice=in.nextLine();
        
        //Check for Valid Input
        while(!sUserChoice.equalsIgnoreCase("Rock") && !sUserChoice.equalsIgnoreCase("Paper") && !sUserChoice.equalsIgnoreCase ("Scissors"))
        {
            System.out.println("Sorry, " + sUserChoice + " is not a valid choice. Please choose again.");
            sUserChoice=in.nextLine();
        }  
        
        //Make computers random choice
         iComputerRandomNumber=r.nextInt(3);
         
         if (iComputerRandomNumber == 0)
         {
            sComputerChoice="Rock";
         }
         if (iComputerRandomNumber == 1)
         {
            sComputerChoice="Paper";
         }
         if (iComputerRandomNumber == 2)
         {
            sComputerChoice="Scissors";
         }
         
         //Decide who wins the round
         if (sUserChoice.equalsIgnoreCase(sComputerChoice))
         {
            System.out.println("Computer chose " + sComputerChoice + " ,round will not count.");
            i--;
         }
         if (sUserChoice.equalsIgnoreCase("Rock") && sComputerChoice.equalsIgnoreCase("Paper"))
         {
            System.out.println("Computer chose " + sComputerChoice + " you lose.");
            ++iComputerWins;
         }
         if (sUserChoice.equalsIgnoreCase("Rock") && sComputerChoice.equalsIgnoreCase("Scissors"))
         {
            System.out.println("Computer chose " + sComputerChoice + " you win.");
            ++iUserWins;
         }
         if (sUserChoice.equalsIgnoreCase("Paper") && sComputerChoice.equalsIgnoreCase("Rock"))
         {
            System.out.println("Computer chose " + sComputerChoice + " you win.");
            ++iUserWins;
         }
         if (sUserChoice.equalsIgnoreCase("Paper") && sComputerChoice.equalsIgnoreCase("Scissors"))
         {
            System.out.println("Computer chose " + sComputerChoice + " you lose.");
            ++iComputerWins;
         }
         if (sUserChoice.equalsIgnoreCase("Scissors") && sComputerChoice.equalsIgnoreCase("Rock"))
         {
            System.out.println("Computer chose " + sComputerChoice + " you lose.");
            ++iComputerWins;
         }
         if (sUserChoice.equalsIgnoreCase("Scissors") && sComputerChoice.equalsIgnoreCase("Paper"))
         {
            System.out.println("Computer chose " + sComputerChoice + " you win.");
            ++iUserWins;
         }
      }
     
      System.out.println ("User wins: " + iUserWins);
      System.out.println ("Computer wins: " + iComputerWins);
      
      if (iUserWins>iComputerWins)
      {
         System.out.println("User wins!");
      }
      if (iUserWins<iComputerWins)
      {
         System.out.println("Computer wins.");
      }
      
      
   
   
   }//end main method
}//end class