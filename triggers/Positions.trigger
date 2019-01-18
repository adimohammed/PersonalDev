trigger Positions on Position__c (before insert,before update) {


for (Position__c p:Trigger.new){

if (p.Java__c==true)
   p.Skills_Required__c='Adil';
  
   }

}