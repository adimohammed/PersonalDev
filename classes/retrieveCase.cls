public class retrieveCase {

    public String getContactName() {
        return 'Lauren Boyle';
    }

    public List<Case> getCases() {
        return [SELECT status, subject FROM Case
                WHERE Contact.name = 'Lauren Boyle' AND status != 'Closed' ];
    }
}