// This class updates the Hello field on account records that are  
    
// passed to it.  
    
public class hellocontact {

   public static void addworld(Contact[] con){

      for (contact c : con){
         if (c.Hello__c != 'World') {
            c.Hello__c = 'World';
         }
      }
   }

}