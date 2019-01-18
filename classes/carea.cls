public class carea {
	
	public carea(){
		integer i = 8;
		integer j = 9;
		Integer sum = i + j  ;
	}
	
	private String getLiAreas() {
		string what = 'abce';
		return what;
	}

	public void someMethod(){
		carea c = new carea();  
		c.getLiAreas() ;  
	}
/*******************/


	Integer someValue = 8;
	String myString = String.valueOf(someValue);

	Date todaysDate = system.today();
	String myString1 = String.valueOf(todaysDate);

	String dateString = '2012-02-02';
	Date myDate = Date.valueOf(dateString);
	
	public static List<Account>  myAcc(){
		
		for(Account acc : [Select id,Name,AccountNumber from Account] ){
			if(acc.Name == 'sForce'){
				acc.Name = 'kForce';
			}
			update acc;
		}
		
		
		
		return null;
				
	}
}