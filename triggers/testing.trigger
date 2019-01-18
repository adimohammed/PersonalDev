trigger testing on Position__c (before insert ,before update) {


for (Position__c p:Trigger.new){


List<Job_Application__c> j = [Select  status__c from Job_Application__c where id =:p.id];

for (Job_Application__c ap11 : j)
if (p.Java__c== true){
ap11.status__c='Hired';
}
//ap11.status__c = pro.priority__c;

update j;
}
}