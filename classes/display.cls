public class display {

private final Account acct;
 
    public display(ApexPages.StandardController stdcontroller) {
  this.acct = (Account)stdController.getRecord();
    }
   public String getGreeting() {
        return 'Hello ' + acct.name +' Adil';
    }
}