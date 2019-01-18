trigger HelloWorldTrigger1 on Position__c (before insert) {

  Position__c[] pos = Trigger.new;

   MyHelloWorld2.updatefa(pos);
   system.debug('Adil:'+pos);
}