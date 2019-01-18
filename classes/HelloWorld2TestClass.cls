@isTest 
private class HelloWorld2TestClass {
    static testMethod void validateHelloWorld2() {
      Position__c p = new Position__c(Name='Testfa1',Max_Pay__c=5000,Functional_Area__c='Finance');
       System.debug('This is new PositonXXXXXXXXX: '+p.Functional_Area__c);

       // Insert book 
    
       insert p;
        System.debug('Adil: '+p);
    
       // Retrieve the new book 
    
       p = [SELECT Name,Functional_Area__c FROM Position__c WHERE Id =:p.Id];
       System.debug('FAxxxxxxx: '+p.Functional_Area__c);

       // Test that the trigger correctly updated the price 
    
      System.assertEquals('Finance', p.Functional_Area__c);
    }
}