/**********************************************
*Dalton Larsen
*CS 1400
*
*Operation10RockPaperScissors
***********************************************/
import java.util.Scanner;
import java.util.Random;
public class RockPaperScissors
{

   public String getUserChoice()
   {
      Scanner in = new Scanner (System.in);
      String sUserChoice="";
      
      System.out.println("Rock, Paper, or Scissors?");
      sUserChoice=in.nextLine();
        
        //Check for Valid Input
        while(!sUserChoice.equalsIgnoreCase("Rock") && !sUserChoice.equalsIgnoreCase("Paper") && !sUserChoice.equalsIgnoreCase ("Scissors"))
        {
            System.out.println("Sorry, " + sUserChoice + " is not a valid choice. Please choose again.");
            sUserChoice=in.nextLine();
        }
        return sUserChoice;  
     }//end getUserChoice
          
     public String getCPUChoice()
     {
         Random r = new Random ();
         int iComputerRandomNumber=0;
         iComputerRandomNumber=r.nextInt(3);

         String sComputerChoice="";
         
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
         return sComputerChoice;
     }//end getCPU Choice
     
     public String pickWinner(String userChoice, String cpuChoice)
     {
         String result="";
         if (userChoice.equalsIgnoreCase(cpuChoice))
         {
             result="Tie";
         }
         
         if (userChoice.equalsIgnoreCase("Rock") && cpuChoice.equalsIgnoreCase("Paper"))
         {
            result="Computer";
         }
         
         if (userChoice.equalsIgnoreCase("Rock") && cpuChoice.equalsIgnoreCase("Scissors"))
         {
            result="User";
         }
         
         if (userChoice.equalsIgnoreCase("Paper") && cpuChoice.equalsIgnoreCase("Rock"))
         {
            result="User";
         }
        
         if (userChoice.equalsIgnoreCase("Paper") && cpuChoice.equalsIgnoreCase("Scissors"))
         {
            result="Computer";
         }
         
         if (userChoice.equalsIgnoreCase("Scissors") && cpuChoice.equalsIgnoreCase("Rock"))
         {
            result="Computer";
         }
         
         if (userChoice.equalsIgnoreCase("Scissors") && cpuChoice.equalsIgnoreCase("Paper"))
         {
            result="User";
         }
         return result;
      }//end pickWinner
}// end main

     
      
