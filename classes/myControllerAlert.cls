public class myControllerAlert {
public double latitude{get;set;}
public double lat;

    public myControllerAlert(ApexPages.StandardController controller) {

    }
    
  
    
    public PageReference callout(){
    Contact acc=new Contact();
    acc.LastName= 'TestNow123';
    //acc.adiltest__Check_In_Location__Latitude__s  = lat;
    insert acc;
    return null;
    }

}