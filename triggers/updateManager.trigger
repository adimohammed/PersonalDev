trigger updateManager on Contact (before insert) {
for ( Contact c : trigger.new) {
if(c.createdby.Name != 'xx' )
{
Id MAnagerID= [ select id,ManagerId from user where id=: Userinfo.getUserId()][0].Managerid;

c.manager__c= MAnagerID;
//update c;
}
}
}