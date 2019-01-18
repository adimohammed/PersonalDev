public class adil  {

    public adil(ApexPages.StandardController controller) {
    		sObject s = new Account();
    	
    }
    


   id Accountid;
    public PageReference edit()
   {
        system.debug('Edit button');
        PageReference returnPage = new PageReference('/apex/SMART_sfdc?id=' +  this.AccountID);        
        return returnPage;
    }

     

}