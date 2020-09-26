/*********************************************
*Operation2.java
*Dalton Larsen
*
*This program will determine when you can retire.
*********************************************/

import java.util.Scanner;

public class Operation2RetirementProgram
{
   public static void main (String[] args)
   {
      Scanner in= new Scanner (System.in);
      
      String sBirthMonth;
      int iBirthDay=0;
      int iBirthYear=0;
           
      System.out.println("Please enter the month you were born."); //Prompt to enter in your month of birth.
      sBirthMonth = in.nextLine();
      
      System.out.println("Please enter the day of the month you were born."); // Prompt to enter in your day of birth.
      iBirthDay = in.nextInt();
     
      System.out.println("Please enter the year you were born."); // Prompt to enter in year of birth.
      iBirthYear= in.nextInt();
      
      int iRetirementYear=iBirthYear + 67; // Variable for Retirment year.
      System.out.println("You can retire on " + sBirthMonth + " " + iBirthDay + ", " + iRetirementYear); // Final output staement.
      
   }//End main method

}//End class Operation2