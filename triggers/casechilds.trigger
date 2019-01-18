trigger casechilds on Provider__c (after insert,after update) {

//if ((trigger.new.size() == 1) && (trigger.new[0].Priority__c != trigger.old[0].Priority__c)){

for(Provider__c pro :Trigger.new){
List<Appliance__c> App = [select id, status__c, Case__c from Appliance__c where Case__c = :pro.Case__c];

for (Appliance__c ap11 : app)
if (pro.priority__c=='High'){
ap11.status__c='completed';
}
//ap11.status__c = pro.priority__c;

update app;
}
}