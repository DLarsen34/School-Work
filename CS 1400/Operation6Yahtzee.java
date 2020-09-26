/*********************************************
*Dalton Larsen
*Operation6Yahtzee.Java
*
*This is a Yahtzee Game
**********************************************/
import java.util.Random;
import java.util.Scanner;
public class Operation6Yahtzee
{
   
   public static void main (String[] args)
   {
      
      int[] dice = new int[5];
      Scanner in = new Scanner (System.in);      
      Random r= new Random ();
      String choice=" ";
      //generate the dice rolls
      for (int i = 0; i < 5; i++)
      {
         dice[i] = r.nextInt(6) + 1;
      }
      
      //display the dice rolls
      for (int i = 0; i < 5; i++)
      {
         System.out.println(dice[i] + " ");
      }
      System.out.println();
      
      //TODO: set up two rounds of rerolling
      System.out.println("Would you like to reroll dice #1?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[0]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #2?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[1]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #3?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[2]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #4?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[3]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #5?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[4]=r.nextInt(6)+1;
      }
      //Print the dice again after the reroll
       for (int i = 0; i < 5; i++)
      {
         System.out.println(dice[i] + " ");
      }
      System.out.println();
      
      System.out.println("Would you like to reroll dice #1 for the second and last time?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[0]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #2 for the second and last time?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[1]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #3 for the second and last time?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[2]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #4 for the second and last time?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[3]=r.nextInt(6)+1;
      }
      System.out.println("Would you like to reroll dice #5 for the second and last time?");
      choice=in.nextLine();
      if(choice.equalsIgnoreCase("Yes"))
      {
         dice[4]=r.nextInt(6)+1;
      }
      //Print the dice after tbe second reroll
      for (int i = 0; i < 5; i++)
      {
         System.out.println(dice[i] + " ");
      }
      
      //Create a counts array, set all values to zero.
      int[] counts=new int[6];
      for (int i = 0; i < 6; i++)
      {
         counts[i]=0;
      }
      //count up the values
      for (int i = 0; i <5; i++)
      {
         /*diceIndex will hold the value of the dice location minus one.
         This is so it can placed in the 0th base array, in the correct location*/
         int diceIndex=dice[i]-1;
         /*This will go to the location reserved for the dice and increment its value by 1.
         For example, if the value of the die was 4, the diceIndex value would be 3. This would 
         increment counts[3] by one. Now it's easy to tell how many 4's ther are, becasue each time there is a 4,
         it will increment the count[3] location by one again. */
         counts[diceIndex]++;
      }
     
      //Checks for winning scenarios
      for (int i=0; i<6; i++)
      {
         if (counts[i]==5)
         {
           System.out.println("YAHTZEE");
         }
         else if (counts[i]==4)
         {
            System.out.println("Four of a Kind.");
         }
         for (int j=0; j<6; j++)
         {
          if (counts[i]==2 && counts[j]==3)
          {
            System.out.println("Full House");
          }
         }
      } 
      for (int k=0; k<=3; k++)
      {
         if(counts[k]==3)
         {
            System.out.println("Three of a Kind.");
         } 
      }
      for (int i=0; i<=5; i++)
      {
         if (counts[i]==i+1)
         {
            System.out.println("Large Straight");
         }
      }
       
      System.out.println();
      //Cheat Mode for Grading
      System.out.println("Cheater Mode activated.");
      int cheaterValue=0;
      System.out.println("What number would you like dice 1 to be? Enter 1-6");
      cheaterValue =in.nextInt();
      dice[0]=cheaterValue;
      
      System.out.println("What number would you like dice 2 to be? Enter 1-6");
      cheaterValue =in.nextInt();
      dice[1]=cheaterValue;
     
      System.out.println("What number would you like dice 3 to be? Enter 1-6");
      cheaterValue =in.nextInt();
      dice[2]=cheaterValue;
      
      System.out.println("What number would you like dice 4 to be? Enter 1-6");
      cheaterValue =in.nextInt();
      dice[3]=cheaterValue;
      
      System.out.println("What number would you like dice 5 to be? Enter 1-6");
      cheaterValue =in.nextInt();
      dice[4]=cheaterValue;
    
      //count up the values
      for (int i = 0; i < 6; i++)
      {
         counts[i]=0;
      }
      //count up the values
      for (int i = 0; i <5; i++)
      {
         /*diceIndex will hold the value of the dice location minus one.
         This is so it can placed in the 0th base array, in the correct location*/
         int diceIndex=dice[i]-1;
         /*This will go to the location reserved for the dice and increment its value by 1.
         For example, if the value of the die was 4, the diceIndex value would be 3. This would 
         increment counts[3] by one. Now it's easy to tell how many 4's ther are, becasue each time there is a 4,
         it will increment the count[3] location by one again. */
         counts[diceIndex]++;
      }
      
      //Checks for winning scenarios
      for (int i=0; i<6; i++)
      {
         if (counts[i]==5)
         {
           System.out.println("YAHTZEE");
         }
         else if (counts[i]==4)
         {
            System.out.println("Four of a Kind.");
         }
         for (int j=0; j<6; j++)
         {
          if (counts[i]==2 && counts[j]==3)
          {
            System.out.println("Full House");
          }
         }
      } 
      for (int k=0; k<=3; k++)
      {
         if(counts[k]==3)
         {
            System.out.println("Three of a Kind.");
         } 
      }
      for (int i=0; i<=5; i++)
      {
         if (counts[i]==i+1)
         {
            System.out.println("Large Straight");
         }
      }
         
      /*This prints out how many of each number there is.
      COMMENT IT OUT WHEN YOU ARE DONE WITH IT. */
      /*System.out.println();
      for (int i = 0; i < 6; i++)
      {
         System.out.println("The number of " + (i+1) + "s is : " + counts[i]);
      }*/
    }//End main method
}//End Class
