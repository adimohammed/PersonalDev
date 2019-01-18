trigger sfdc_position on Position__c (before insert,before update) {

for (Position__c p : Trigger.new) {
if (p.Java__c==True){
p.skills_required__c= 'Person should know Core Java';
}


}
}