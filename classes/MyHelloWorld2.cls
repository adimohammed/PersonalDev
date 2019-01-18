public class MyHelloWorld2 {
   public static void updatefa(Position__c[] pos) {
      for (Position__c p :pos){
         p.Functional_Area__c= 'Finance';
      }
   }
}