@isTest 
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld() {
       Account b = new Account(Name='Behind the Cloud', Hello__c='students');
       System.debug('Price before inserting new book: ' + b.Hello__c);

       // Insert book 
    
       insert b;
    
       // Retrieve the new book 
    
       b = [SELECT Hello__c FROM Account WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.Hello__c);

       // Test that the trigger correctly updated the price 
    
       System.assertEquals('students', b.Hello__c);
    }
}