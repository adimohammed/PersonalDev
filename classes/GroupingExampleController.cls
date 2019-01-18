public class GroupingExampleController {
 private List<Account> allAccs {get; set;}
 public List<GroupWrapper> groups {get; set;}
 
 public GroupingExampleController(){
  allAccs=[select id, Name, BillingStreet, BillingCity, BillingCountry, Type,
         (select id, Name, Email, Phone from Contacts limit 5)
     from Account
     where Type != null];
  setupGrouping();
 }

 private void setupGrouping()
 {
 	  List<Account> groupedAccs = new List<Account>();
	  for (Account acc : allAccs){
		   groupedAccs.add(acc);
		   groups=new List<GroupWrapper>();
		   GroupWrapper gr=new GroupWrapper();
		   groups.add(gr);
		   gr.accs=groupedAccs;
	  }
 }
  
 public class GroupWrapper
 {
  public List<Account> accs {get; set;}
 }
}