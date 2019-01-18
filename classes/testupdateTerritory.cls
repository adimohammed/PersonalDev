@isTest
private class testupdateTerritory
{
 public static testmethod void testupdateTerritory()  
 {

 Lead l = new Lead (LastName='Adil',Company='ABC',Status='Open',Postalcode='60659',Territory__c='201');
 
 insert l;
 
 }
}