public class countcontroller{

    public countcontroller(ApexPages.StandardController controller) {

    }


            public List<Contact> queryResult {get;private set;}

            public String qryString {get;set;}

            public PageReference query(){

            qryString =  'SELECT Name, Email, Phone from Contact';

            queryResult = Database.query(qryString);
             return null;

       } 

}