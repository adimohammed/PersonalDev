//trigger to update a field
trigger updateAccounts on Account (before insert , before update) {
for(Account a : Trigger.New)
{
a.Rating = 'Hot';
}


}