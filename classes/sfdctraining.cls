public class sfdctraining  {

   


public static void addhellofield (Account[] accs){


      for (Account a:accs){
         if (a.Hello__c != 'students') {
            a.Hello__c = 'students';
         }
      }
   }

   

}