trigger test_position on Position__c (before insert ,before update) {


for (Position__c p:Trigger.new){
 Job_Application__c japp = new Job_Application__c();


if (p.Java__c==true)
 
 
japp.Status__c='Hired';

      }

}