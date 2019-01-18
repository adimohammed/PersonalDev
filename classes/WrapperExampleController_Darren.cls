public with sharing class WrapperExampleController_Darren 
{
    
      public List<Date> getHeadDates()
    {
        List<Date> dates=new List<Date>();
        Date currentDate = System.today();
        for (Integer idx=0; idx<28; idx++)
        {
            dates.add(currentDate + idx);
        }
                                     
        return dates;
    }
    
   
        // retrieves the row wrapper containing the wrapped account headings
    public List<PhotographerRow> getDataRows()
    {
        List<PhotographerRow> dataRows = new List<PhotographerRow>();
        PhotographerRow prow1 = new PhotographerRow();
        prow1.photographer = 'DarrenPhoto';
        for (Integer idx=0; idx<28; idx++) {
            prow1.subtotals.add(idx);
        }
        OwnerRow orow1 = new OwnerRow();
        orow1.owner = 'DarrenOwner1';
        for (Integer idx=0; idx<28; idx++) {
            orow1.counts.add(idx);
        }
        prow1.owners.add(orow1);
        dataRows.add(prow1);
        
        PhotographerRow prow2 = new PhotographerRow();
        prow2.photographer = 'AdilPhoto';
        for (Integer idx=28; idx>0; idx--) {
            prow2.subtotals.add(idx);
        }
        OwnerRow orow2 = new OwnerRow();
        orow2.owner = 'AdilOwner1';
        for (Integer idx=28; idx>0; idx--) {
            orow2.counts.add(idx);
        }
        prow2.owners.add(orow2);
		dataRows.add(prow2);
        return dataRows;
  
  
    }
    
   
    public class PhotographerRow
    {
        public String photographer {get; set;}
        public List<OwnerRow> owners {get; set;}
        public List<Integer> subtotals {get; set;}
        
        // constructor
        public PhotographerRow()
        {
            owners=new List<OwnerRow>();
            subtotals=new List<Integer>();
        }
    }
    
    public class OwnerRow
    {
        public String owner {get; set;}
        public List<Integer> counts {get; set;}
        
        // constructor
        public OwnerRow()
        {
            counts=new List<Integer>();
        }
        
    }
    
    public  List<Contact> getPhotographers(){
    	
    	List<Contact> contacts = [Select id,Name from Contact];
    	
    	return contacts;
    	
    	
    	
    }
    

}