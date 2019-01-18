public class tree {

    public tree(ApexPages.StandardController controller) {

    }


     public String application{
    get
    {
   string acc = [Select name,application_id__c from Application__c where id=:Apexpages.currentpage().getparameters().get('id')].name;
        return acc;
    }
    set;
    }

   public pageReference Expand(){
   pagereference p;
     p = new pageReference('/'+'apex/tree');
   return p;
   }

 public pageReference Collapse(){
   pagereference p;
     p = new pageReference('/'+'apex/tree1');
   return p;
   }

   

List<grouping__c> grouping;

public class Groups {
Grouping__c g;
Application__c a;
List<Category__c> cats;
List<Application__c> apps;
public Groups(Grouping__c gin) { g = gin;
cats = [Select c.Name, c.Grouping__r.Grouping_ID__c, c.Grouping__r.Name,
c.Grouping__c, (Select Name,Description__c From Topics__r) From Category__c c
where c.Grouping__c = :gin.id];
system.debug(cats);
}
public List<Category__c> getCategories() { return cats; }
public string getname() { return g.name; }
public string getid() { return g.id; }


}
 
public List<Groups> getgrouping() {
if(grouping == null)
grouping = [select name, id from Grouping__c
where application__r.id =:Apexpages.currentpage().getparameters().get('id')];
List<Groups> ret = new List<Groups>{};
for ( Grouping__c g:grouping) {
ret.add( new Groups( g ) );
}
return ret;
}

}