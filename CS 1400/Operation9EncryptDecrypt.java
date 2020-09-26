import java.util.Scanner;
import java.io.File;
import java.io.PrintWriter;
import java.io.FileNotFoundException;

public class Operation9EncryptDecrypt
{
   
   public static void main (String[] args)
   {
      try
      {
         File f = new File ("Text.txt");
         Scanner fileIn = new Scanner (f);
         
         char temp = ' ';
         for (int i=0; i<temp.length ; i++)
         {
            temp = fileIn.next().charAt(0);
            System.out.println(temp);
         }      
      }
      catch (FileNotFoundException e)
      {
         System.out.println("File not Found");
      }
   
   }//end main


}//End class
