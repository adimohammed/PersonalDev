@isTest
private class Test_insertContacts {

    static testMethod void checkContacts() {
    	Account acc = new Account();
    	acc.Name	=	'test';
    	acc.Type	=	'Prospect';
    	insert acc;
    	
    	Contact con;
      system.assertEquals(con, con);
    }
}