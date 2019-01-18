@isTest 
private class activitytestclass {
    static testMethod void activity123() {
       Account a = new Account();

       // Insert book 
    
       insert a;
    
       // Retrieve the new book 
    
       //a = [SELECT Price__c FROM Book__c WHERE Id =:b.Id];
      // System.debug('Price after trigger fired: ' + b.Price__c);

       // Test that the trigger correctly updated the price 
    
      // System.assertEquals(90, b.Price__c);
    }
}