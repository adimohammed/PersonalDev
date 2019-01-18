@isTest 
private class HellostudentTestClass {

    static testMethod void validateHellostudent() {
       Account a = new Account(name='T1 Account');
       // Insert account  
    
       insert a;
    
       // Retrieve account  
    
       a = [SELECT hello__c FROM account WHERE Id =:a.id];

       // Test that HelloWorld program correctly added the value  
    
       // "World" to the Hello field  
    
       System.assertEquals('students', a.hello__c);
    }
}