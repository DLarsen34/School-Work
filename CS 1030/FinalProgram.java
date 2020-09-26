import java.util.*;


public class FinalProgram {

   public static void main (String[] args) {
   
      Scanner console = new Scanner (System.in);
      
      String sFirstName; //Your first name
      String sLastName;  // Your last name
      int iAge; //Age in human years
      int iAgeMonths;
      int iAgeDays;
      int iAgeHours;
      int iAgeMinutes;
      int iAgeSeconds;
            
      // Get User input
      System.out.println("Please enter your first name");
         sFirstName = console.next();
      System.out.println("Please enter your last name");
         sLastName = console.next();
      System.out.println("Please enter your age in years");
         iAge = console.nextInt();
      //calculate the age
      iAgeMonths = iAge*12;
      iAgeDays = iAge*365;
      iAgeHours = iAge*8760;
      iAgeMinutes = iAge*525600;
      iAgeSeconds = iAge*31536000;
      
      //Print Results
      System.out.println(sLastName + ", " + sFirstName);
      System.out.println(iAge + " Years old.");
      System.out.println(iAgeMonths + " Months old.");
      System.out.println(iAgeDays + " Days old.");
      System.out.println(iAgeHours + " Hours old");
      System.out.println(iAgeMinutes + " Minutes old");
      System.out.println(iAgeSeconds + " Seconds old");
     
     
      
          }
    
}      
