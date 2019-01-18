public class config_mylist {

List<String> MYLIST_OPTIONS;
String[] MYLIST;
 

    public String[] getMYLIST() {
        return MYLIST;
    }
    
    public void setMYLIST(String[] x) {
        MYLIST = x;
    }


    public List<SelectOption> getMYLIST_OPTIONS() {
        List<SelectOption> options = new List<SelectOption>();
        List<Account> MYLIST_OPTIONS;
        contact con = [select accountid from Contact where id=:Apexpages.currentpage().getparameters().get('id')];
        MYLIST_OPTIONS = [select id,name from Account where parentid=:con.accountid];
        if(MYLIST_OPTIONS.Size() > 0){
            for(Account c:MYLIST_OPTIONS){
                if(c.Name != null){
                    options.add(new SelectOption(c.id,c.Name));
                }
            }
        }
        return options;
    }

}