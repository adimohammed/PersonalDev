trigger activity on Account (before insert,before update) {
for (Account a: trigger.new){
if (a.lastactivitydate==null)
{
a.HasActivityHistory__c =true;
}



}

}