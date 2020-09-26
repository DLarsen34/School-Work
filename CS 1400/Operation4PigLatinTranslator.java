/******************************
*Operation4PigLatinTranslator.java
*Dalton Larsen
*
*This is Pig latin translator
*******************************/

import java.util.Scanner;
public class Operation4PigLatinTranslator
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        final String vowels = "aeiouAEIOU";
        System.out.println("Enter your word or q to quit.");
        String word = sc.nextLine(); // get user input
        while (!word.equalsIgnoreCase("q"))
        {
            String beforVowel = "";
            int cut = 0;
            while (cut < word.length() && !vowels.contains("" + word.charAt(cut))) // test whether it starts with a vowel or constant
            {
                beforVowel += word.charAt(cut);
                cut++;
            }
            if (cut == 0)
            {
                cut = 1;
                word += word.charAt(0) + "w";
            }
            System.out.println("Translation is " + word.substring(cut) + beforVowel + "ay");
            System.out.println("Enter your word or q to quit.");
            word = sc.nextLine();
        }
    } // end class
} //end main