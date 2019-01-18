trigger EmailTrigger on Account (after insert, after update) {
for (Account a: System.Trigger.new) {
if ((a.Ownership == 'Public') ) {
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//String[] toAddresses = new String[] {'adil.mohammed@thomsonreuters.com'};
//String[] ccAddresses = new String[] {'abcd@company.com'};
//mail.setToAddresses(toAddresses);
//mail.setCcAddresses(ccAddresses);
mail.setReplyTo('abcd@company.com');
mail.setSenderDisplayName('Adil');
//mail.setSubject('Email Trigger');
mail.setBccSender(false);
mail.setUseSignature(false);
//mail.setPlainTextBody('Your Case: ' + case.Id +' has been created');
mail.setTemplateID('00XA00000016fRJ');   
 mail.settargetObjectid('005A0000000d4dD'); 
 mail.saveAsActivity = false;          
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}
}