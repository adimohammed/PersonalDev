public class MyController {

    public PageReference save() {
        return null;
    }


    public String getName() {
        return 'MyController';
    }

    public Account getAccount() {
   
  
        return [select id, name from Account 
                 where id = :ApexPages.currentPage().getParameters().get('id')]; 
    } 
    
}