global class positioncreate implements Database.Batchable<sObject>{
public String query;

global database.querylocator start(Database.BatchableContext BC){
    return null;
}
    
global void execute(Database.BatchableContext BC, List<sObject> scope){
Position__c newtd = new Position__c(NAME= 'Salesforce', max_pay__c = 2000, min_pay__c=1000);
 {
insert newtd;
}
       }
  global void finish(Database.BatchableContext BC){}  
}