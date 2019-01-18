trigger changeOwner on Contact (after insert, after update) 
{
List <Id> AccountIds = new List <Id>();
List <Account> accounts = new List<Account>();
List <Contact> contacts = new List<Contact>();

List <Account> accSave = new List<Account>();
List <Contact> contSave = new List<Contact>();

for(Contact c:trigger.new ){
if(c.AccountId !=NULL)
AccountIds.add(c.AccountId);
}

accounts = [Select Id, OwnerId From Account Where Id IN :AccountIds];
contacts = [Select Id, AccountId, OwnerId From Contact Where AccountId IN :AccountIds and Id NOT IN :trigger.new];

for(Contact c:trigger.new ){
for(Account acc:accounts){
if(c.AccountId == acc.Id && c.OwnerId !=acc.OwnerId){
acc.OwnerId = c.OwnerId;
accSave.add(acc);
}
}


}
update(accSave);
update(contSave);
}