public with sharing class CustomSettingsListController {
 
    public String selectedIso {get;set;}
 
    public List<selectOption> isoCodes {
        get {
            List<selectOption> options = new List<selectOption>();
 
            for (ISO_Countries__c iso : ISO_Countries__c.getAll().values())
                options.add(new SelectOption(iso.ISO_Code__c,iso.Name+' - '+iso.ISO_Code__c));
            return options;
 
        }
        set;
    }
 
}