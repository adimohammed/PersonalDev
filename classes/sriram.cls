public class sriram {

    public sriram(ApexPages.StandardController controller) {
Contact[] clist = Trigger.New;
Set<string> mvalue = new Set<string>();
for (Contact c : clist)
{
mvalue.add(c.FirstName);
}

List<Contact> exist =[Select c.FirstName, c.LastName from Contact c
where c.FirstName IN :mvalue];
Set<string> existrec = new Set<string>();
for (Contact c : exist)
{
existrec.add(c.FirstName);
}

for(Contact c : clist)
{
if(existrec.contains(c.FirstName))
{
c.addError('Record already exist with same name');
}
}
}

    }