import java.util.*;
import java.util.regex.*;

public class FractionCalc
{
	static	String regex = "(-?[0-9]+)([ \t]*/[ \t]*)(-?[0-9]+)([ \t]*)([+-/\\*])([ \t]*)(-?[0-9]+)([ \t]*/[ \t]*)(-?[0-9]+)";

	public static void main(String[] args)
	{
		int leftNumerator = 0;
		int leftDenominator = 0;
		int rightNumerator = 0;
		int rightDenominator = 0;
		String fracOperator = "";
		String fracInput = "";
		
		System.out.print("Enter a fractional expression: ");
		
		Scanner in = new Scanner(System.in);
		fracInput = in.nextLine();
		in.close();
		fracInput = fracInput.trim();
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(fracInput);
		
		if(m.find())
		{
			leftNumerator = Integer.parseInt(m.group(1));
			leftDenominator = Integer.parseInt(m.group(3));
			fracOperator = m.group(5);
			rightNumerator = Integer.parseInt(m.group(7));
			rightDenominator = Integer.parseInt(m.group(9));
		}
		else
		{
			System.out.println("Not a valid fractional expression, the program will exit.");
			System.exit(0);
		}
		if(leftDenominator == 0 || rightDenominator == 0)
		{
			System.out.println("Denominator cannot be 0, the program will exit");
			System.exit(1);
		}
		Fraction leftFrac = new Fraction(leftNumerator, leftDenominator);
		Fraction rightFrac = new Fraction(rightNumerator, rightDenominator);
		Fraction resultFrac = new Fraction(1,2);
		
		switch(fracOperator)
		{
		case "+":
			resultFrac = leftFrac.add(rightFrac);
			break;
		case "-":
			resultFrac = leftFrac.sub(rightFrac);
			break;
		case "*":
			resultFrac = leftFrac.mult(rightFrac);
			break;
		case "/":
			resultFrac = leftFrac.div(rightFrac);
			break;
		default:
			break;
		}
		System.out.println(leftFrac + " (" + fracOperator + ") " + rightFrac + " = " + resultFrac);
	}
}
