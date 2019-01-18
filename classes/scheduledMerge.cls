global class scheduledMerge implements Schedulable{
   global void execute(SchedulableContext SC) {
     Contact c= new Contact(); 
     c.LastName='Sushma';
     c.email='abc@gmail.com';
     insert c;
   }
}