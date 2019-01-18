trigger test_position1 on Job_Application__c (before insert ,before update) {


for (Job_Application__c j:Trigger.new){

List<Position__c> app123 = [Select Apex__c from Position__c where id=:j.position__c];

for(position__c p:app123){

 
if (p.Apex__c==true){

 
 
j.Status__c='Hired';

system.debug('status');

   
   }

}
}
}