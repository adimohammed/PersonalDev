trigger  helloworld on Contact (before insert) {

 Contact[] con = Trigger.new;

   hellocontact.addWorld(con);

}