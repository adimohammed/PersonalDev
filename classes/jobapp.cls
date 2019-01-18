@isTest

private class jobapp {

static testmethod void testjobapp(){
Job_Application__c j = [Select Id from Job_Application__c limit 1];

Position__c p = new position__c();
p=[Select Apex__c from Position__c where id=:j.id];


  insert p;
}

}