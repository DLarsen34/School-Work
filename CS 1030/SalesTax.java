public class SalesTax {
   
   public static void main (String[] args){
   //Sales Tax converted to decimal
   double dFoodSalesTax=.03;
   double dNonFoodSalesTax=.0675;
   
   double dFoodBill=150.00; //Money spent on food
   double dNonFoodBill=50.00;//Money spent on nonfood
    
   double dFoodTax=(dFoodSalesTax * dFoodBill);
   double dNonFoodTax=(dNonFoodSalesTax * dNonFoodBill);
   
   double dTotal= (dFoodTax + dNonFoodTax);
   
   System.out.println ("The total tax for your bill is: $" + dTotal);
   }





}