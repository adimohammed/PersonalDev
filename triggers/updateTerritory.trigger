trigger updateTerritory on Lead(before insert, before update) 
{
    Map<String,String> zipTerrMap = new Map<String,String>();
    Set<String> zipcodes = new Set<String>();
  
 for(Lead record : trigger.new)
 {
  zipcodes.add(record.postalCode);
 }
 for( ZipTerr__c zip : [select zip__c,Territory__c from ZipTerr__c where zip__c in : zipcodes])
 {
    zipTerrMap.put(zip.zip__c,zip.Territory__c);
 }
 for(Lead le  : trigger.new)
 {
  if(zipTerrMap.containsKey(le.postalCode))
  {
  le.Territory__c=zipTerrMap.get(le.postalCode);
  }
 }
}