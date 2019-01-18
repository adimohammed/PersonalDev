trigger typetest on Account (before insert , before update)
{
Account a = Trigger.New[0];
if(a.Type==null)
{
a.Type.addError(System.Label.test);
}
}