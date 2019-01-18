global with sharing class createcan  implements Schedulable {


global void execute(SchedulableContext sc){

    Position__c newpos = new Position__c (NAME= 'Salesforce Admin', Type__c = 'Full Time',mIn_Pay__c =3300.00,Max_Pay__c=4500);
 {
insert newpos;
}
}
}