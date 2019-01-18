trigger updateaccount on Contact (after insert , after update) {
set<Id> liaccIds = new Set<Id>();

for ( Contact c : trigger.new) {
if(c.Department.contains('hero'))
liaccIds.add(c.AccountId);


}

//query all the opportunities in a single query
List<Account> acc = new List<Account>();
acc = [select id,type from Account where id in :liaccIds];
for ( Account accs : acc)
{
accs.Type = 'Prospect' ; 
}
//update all opportunities in a single DML
if(acc.size() > 0)
update acc;



}