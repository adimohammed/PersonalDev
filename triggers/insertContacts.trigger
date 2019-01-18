trigger insertContacts on Account (after insert , before insert , after update) {
	system.debug('I am here in the code');
	
	
	List<Contact> contacts = new List<Contact>();
	system.debug('contact List 1:'+contacts);
	for(Account acc : trigger.new){
		if(acc.Name!=null){
			Contact con = new Contact();
			newMethod(con);
			
			contacts.add(con);
			system.debug('contact List 2:'+contacts);
		}
	}
	insert contacts;
	
	public static void newMethod( Contact con){
		con.LastName = 'test';
		con.FirstName = 'something' ;
		
	}
}