trigger interview123 on Job_Application__c (before insert) {
Set<Id> positionIds = new Set<Id>();
for(Job_Application__c j : trigger.new){
    if(j.Position__c!=null){
 positionIds.add(j.Position__c);
    }
}

Map<Id,Position__c> pos = new Map<Id,Position__c>([SELECT id, Ownerid from position__c where id IN :positionIds]);

for(Job_Application__c ja : trigger.new){
    if(ja.Position__c != null){
       ja.Position__c = pos.get(ja.Position__c).Ownerid;
    }
}

}