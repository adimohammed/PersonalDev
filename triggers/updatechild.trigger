trigger updatechild  on Contact (before insert) {

  
    Map<Id,Account> accounts = new Map<Id,Account>([select id,Name, ownerid from Account where Id IN :trigger.newMap.Keyset()]);
  
    for(Contact child : trigger.new){
         if(child.Account != null){
        child.Email = 'abc@gmail.com';    
          }
    }   
 

}