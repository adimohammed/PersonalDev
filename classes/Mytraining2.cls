public class Mytraining2 {

    private final Account account;

    public Mytraining2() {
        account = [SELECT Name,Type FROM Account 
                   WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public Account getAccount() {
        return account;
    }

    public PageReference save() {
        update account;
        return null;
    }
}